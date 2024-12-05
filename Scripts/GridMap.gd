extends GridMap

var directions = [
	Vector3i(1, 0, 0),
	Vector3i(-1, 0, 0),
	Vector3i(0, 0, 1),
	Vector3i(0, 0, -1),
]

func _ready():
	GameManager.gridMap = self

func get_valid_tiles(origin : Vector3i, moveDistance : int):
	var validTiles = []
	var usedCells = get_used_cells()
	for cell in usedCells:
		var distanceX = abs(origin.x - cell.x)
		var distanceZ = abs(origin.z - cell.z)
		
		if ((distanceX + distanceZ <= moveDistance) and (cell != origin)):
			validTiles.append(cell)
	
	for tile in validTiles:
		if a_star(origin, tile, moveDistance) == false:
			validTiles.erase(tile)
	
	return validTiles

func paint_tiles(tiles, index):
	for tile in tiles:
		set_cell_item(tile, index)


func a_star(origin : Vector3i, goal : Vector3i, moveDistance: int):
	var openList = [origin] #nodes to check 
	var cameFrom = {} #maps nodes to their previous nodes 
	var gScore = {} #cost from start to a node
	var fScore = {} #estimated total from start to goal through node 
	
	gScore[origin] = 0
	fScore[origin] = heuristic(origin, goal)
	
	while len(openList) > 0:
		var current = get_lowest_f_score(openList, fScore)
		if current == goal:
			var path = reconstruct_path(cameFrom, current)
			if moveDistance >= path.size() - 1:
				return true
			else:
				return false
		
		openList.erase(current)
		var neighbors = get_neighbors(current)
		
		for neighbor in neighbors:
			if not is_walkable(neighbor):
				continue
			var tentative_gScore = gScore.get(current, INF) + 1
			if tentative_gScore < gScore.get(neighbor, INF):
				cameFrom[neighbor] = current
				gScore[neighbor] = tentative_gScore
				fScore[neighbor] = gScore[neighbor] + heuristic(neighbor, goal)
				
				if not openList.has(neighbor):
					openList.append(neighbor)
		
	return false

func heuristic(origin, goal):
	return abs(origin.x - goal.x) + abs(origin.z - goal.z)  # Ignoring y-axis as it's flat

func get_lowest_f_score(openList, fScore):
	var lowest_node = openList[0]
	var lowest_score = fScore.get(lowest_node, INF)
	for node in openList:
		var score = fScore.get(node, INF)
		if score < lowest_score:
			lowest_score = score
			lowest_node = node
	return lowest_node

func get_neighbors(cell):
	var neighbors = []
	for direction in directions:
		var neighbor_pos = cell + direction
		neighbors.append(neighbor_pos)
	return neighbors

func reconstruct_path(came_from: Dictionary, current) -> Array:
	var path = [current]
	while came_from.has(current):
		current = came_from[current]
		path.insert(0, current)
	return path

func is_walkable(pos) -> bool:
	# This depends on your GridMap configuration, e.g. if a certain tile is walkable
	var cell = get_cell_item(pos)
	return cell != -1  # Assuming -1 means no tile or unwalkable area
