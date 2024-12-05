extends Node3D

var nameOfScene
var idle = true

@onready var characterAnimationPlayerName = "%s/AnimationPlayer"
@onready var anim = get_node(characterAnimationPlayerName % name)

func _CharacterSelectAnim() -> void:
	if idle:
		anim.play("walk")
	


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	_CharacterSelectAnim()
