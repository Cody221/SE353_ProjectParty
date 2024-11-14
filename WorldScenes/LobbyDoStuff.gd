extends Node

var lobbyJoined = false

func _loadMultiplay():
	var multiplay = load("res://WorldScenes/Multiplayer.tscn").instantiate()
	MPIO.add_child(multiplay)
	
func _joinedLobby():
	var players = MPIO.get_child(0).players.get_players()
	if players.size() > 0:
		lobbyJoined = true
		
func _loadCharacterSelect():
	GameManager.load_scene("res://WorldScenes/CharacterSelectStage.tscn")
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_loadMultiplay()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_joinedLobby()
	if lobbyJoined == true:
		_loadCharacterSelect()
