extends Node3D

var nameOfScene
var idle = true

@onready var characterAnimationPlayerName = "%s/AnimationPlayer"
@onready var animationPlayer = get_node(characterAnimationPlayerName % name)
@export var moveSpeed = 0
var playerScore = 0


func _CharacterSelectAnim() -> void:
	if idle:
		anim.play("walk")
	


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_CharacterSelectAnim()
	handle_input(delta)
	
func handle_input(delta):
	if GameManager.miniGame != null:
		var movement = Vector3.ZERO
		if Input.is_action_pressed("Forward"):
			if position.z <= 4.5 and position.z >= -4.5:
				movement = Vector3(-movement.x, 0, -1)
				animationPlayer.play("walk")
		
		if Input.is_action_pressed("Backward"):
			if position.z <= 4.5 and position.z >= -4.5:
				movement = Vector3(movement.x, 0, 1)
				animationPlayer.play("walk")

		if Input.is_action_pressed("Left"):
			if position.x <= 4.5 and position.x >= -4.5:
				movement = Vector3(-1, 0, movement.z)
				animationPlayer.play("walk")
		
		if Input.is_action_pressed("Right"):
			if position.x <= 5 and position.x >= -5:
				movement = Vector3(1, 0, movement.z) 
				animationPlayer.play("walk")
		
		if position.x >= 4.5:
			position = Vector3(4.5, position.y, position.z)
		if position.x <= -4.5:
			position = Vector3(-4.5, position.y, position.z)
		if position.z >= 4.5:
			position = Vector3(position.x, position.y, 4.5)
		if position.z <= -4.5:
			position = Vector3(position.x, position.y, -4.5)
		
		position += movement.normalized() * delta * moveSpeed
		movement = Vector3.ZERO

func score():
	playerScore += 1
	GameManager.miniGame.scoreLabel.text = "Score: " + str(playerScore)
