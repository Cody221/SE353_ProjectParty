extends Node3D

@onready var cam = $Camera3D
@onready var character = $Character
@onready var characterBody = $Character/CharacterBody3D
var isMyTurn : bool
var heatlh
var speed 

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.Players.append(self)
	#characterBody.selected.connect(move)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event.is_action_pressed("Select"):
		var res = raycast_from_mouse(2,20)
		if res:
			#emit the signal
			#res.collider.selected.emit()
			pass
			

func move():
	if isMyTurn:
		pass
		

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
