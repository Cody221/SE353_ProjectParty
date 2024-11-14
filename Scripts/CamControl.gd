extends Camera3D

@export var cam_speed : int = 5
@export var sensitivity : float = 0.2

# Called when the node enters the scene tree for the first time.
func _ready():
	#hide the mouse
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_input(delta)


func handle_input(delta):
	if Input.is_action_pressed("Forward"):
		position += Vector3(0, 0, -1) * delta * cam_speed
	
	if Input.is_action_pressed("Backward"):
		position += Vector3(0, 0, 1) * delta * cam_speed
	
	if Input.is_action_pressed("Left"):
		position += Vector3(-1, 0, 0) * delta * cam_speed
	
	if Input.is_action_pressed("Right"):
		position += Vector3(1, 0, 0) * delta * cam_speed


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and !(position.y < 2):
			position -= Vector3(0, 0.5, 0)
		if (event.button_index == MOUSE_BUTTON_WHEEL_DOWN):
			position += Vector3(0, 0.5, 0)
