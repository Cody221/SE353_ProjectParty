extends Node3D

@onready var ui = $UI
@onready var cam = $Camera3D
@onready var character = $Character
@onready var characterBody = $Character/CharacterBody3D
#stats
var speed
var health

#signals 
signal turn_changed(turnStart : bool)

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
	turn_changed.connect(func(turnStart): ui.visible = turnStart)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func move():
	var moveAmount = GameManager.diceManager.roll6(speed)

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
		return res
	else:
		return null
