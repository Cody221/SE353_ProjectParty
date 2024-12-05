extends Node3D

@onready var ui = $UI
@onready var cam = $Camera3D
@onready var character = $Character
@onready var characterBody = $Character/CharacterBody3D
@onready var rollText = $UI/MarginContainer/VBoxContainer2/RichTextLabel
#stats
var speed : int = 0
var health : int = 0
var gridPosition : Vector3i

#signals 
signal turn_changed(turnStart : bool)
signal tile_chosen(tilePosition : Vector3i)

var awaitingChoice : bool = false

var myTurn : bool : 
	get:
		return myTurn
	set(value):
		if value == true:
			turn_changed.emit(true)
		else:
			turn_changed.emit(false)
		myTurn = value

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.Players.append(self)
	ui.rollButton.pressed.connect(move)
	ui.passTurnButton.pressed.connect(GameManager.pass_turn)
	turn_changed.connect(func(turnStart): ui.visible = turnStart)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	

func move():
	var moveAmount = GameManager.diceManager.roll6(speed)
	rollText.text = "Roll: %s" % moveAmount
	#print(moveAmount)
	var validTiles = GameManager.gridMap.get_valid_tiles(gridPosition, moveAmount)
	#print(validTiles)
	awaitingChoice = true
	while awaitingChoice:
		var tilePosition = await tile_chosen
		print(position)
		if tilePosition in validTiles:
			print(tilePosition)
			position = tilePosition
			print(tilePosition)
			print(position)
			cam.position = Vector3(0, cam.position.y, 2)
			#Move Player
			var localPos = GameManager.gridMap.to_local(position)
			gridPosition = GameManager.gridMap.local_to_map(localPos)
			position = GameManager.gridMap.map_to_local(gridPosition)
			if (position.x > 0.45):
				position = Vector3(position.x + 1, position.y, position.z)
			if position.z > 0.45:
				position = Vector3(position.x, position.y, position.z + 1)
						
			
			
			awaitingChoice = false

func _input(event):
	if event.is_action_released("Select") and awaitingChoice == true:
		var res = raycast_from_mouse(1, 20)
		if res != null:
			var localResPosition = GameManager.gridMap.to_local(res.position)
			var tilePos = GameManager.gridMap.local_to_map(localResPosition)
			tile_chosen.emit(tilePos)

#hitting a target returns the result(it's a dictionary) missing returns null
func raycast_from_mouse(collisionMask, rayLength):
	var mPos = cam.get_viewport().get_mouse_position()
	var rayStart = cam.project_ray_origin(mPos)
	var rayEnd = rayStart + cam.project_ray_normal(mPos) * rayLength#raylength
	
	var space = get_world_3d().direct_space_state
	if space == null:
		return
	
	var query = PhysicsRayQueryParameters3D.create(rayStart, rayEnd, collisionMask)
	query.collide_with_areas = true
	
	var res = space.intersect_ray(query)
	if res:
		print("hit")
		return res
	else:
		print("not")
		return null
