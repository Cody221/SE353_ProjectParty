extends Node

var lobbyJoined = false


func _loadCharacterSelect():
	GameManager.load_scene("res://WorldScenes/CharacterSelectStage.tscn")
	
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_loadCharacterSelect()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
