extends Node3D

@onready var characterAnimationPlayerName = "%s/AnimationPlayer"
@onready var anim = get_node(characterAnimationPlayerName % name)

func _CharacterSelectAnim() -> void:
	#print(get_parent().get_tree().get_current_scene().name)
	if get_parent().get_tree().get_current_scene().name == "CharacterSelect":
		anim.play("walk")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	_CharacterSelectAnim()