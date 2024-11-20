extends Node

#list of all players in the game 
var Players = []
var playersTurn : int #index of the player whose turn it is
var Host

var gridMap : GridMap

#managers
var diceManager : DiceManager

# Called when the node enters the scene tree for the first time.
func _ready():
	diceManager = DiceManager.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#pass_turn()
	pass

func pass_turn():
	#var res = await Players[playersTurn].turn_changed
	#if res == false:
		#pass
	playersTurn += 1
	if playersTurn >= Players.size():
		playersTurn = 0
	print_debug(playersTurn)
	
func load_scene(path:String):
	get_tree().change_scene_to_file(path)
