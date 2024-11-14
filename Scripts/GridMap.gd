extends GridMap

func _ready():
	GameManager.gridMap = self

#returns list of valid tiles in the given distance
func get_valid_tiles(origin : Vector3i, moveDistance : int):
	var validTiles = []
	var usedCells = get_used_cells()
	for cell in usedCells:
		var distanceX = abs(origin.x - cell.x)
		var distanceZ = abs(origin.z - cell.z)
		
		if ((distanceX + distanceZ <= moveDistance) and (cell != origin)):
			validTiles.append(cell)
	
	return validTiles
