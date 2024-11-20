extends Node3D

var CurrentCharacter = null

var chractersDict = {0 : "res://Characters/Business1.tscn", 1 : "res://Characters/Cop1.tscn", 2 : "res://Characters/Crutches1.tscn",
3 : "res://Characters/Gramps1.tscn", 4 : "res://Characters/Granny1.tscn", 5 : "res://Characters/Nerd1.tscn",
 6 : "res://Characters/Nerd2.tscn", 7 : "res://Characters/Ponytails1.tscn"}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_control_list_index(index: Variant) -> void:
	var scene = load(chractersDict[index]).instantiate()
	add_child(scene)
	if CurrentCharacter != null:
		CurrentCharacter.queue_free()
	CurrentCharacter = scene
	pass # Replace with function body.
