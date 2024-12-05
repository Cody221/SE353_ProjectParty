class_name coin_collector extends Node3D

@onready var gridMap = $"GridMap"
@onready var scoreLabel = $"MarginContainer/Label"
var rng = RandomNumberGenerator.new()
var coinScene = preload("res://coin.tscn")
#var coinList : Array
var playerScore : int

func _ready():
	GameManager.miniGame = self

func drop_coins():
	var tiles = gridMap.get_used_cells()
	var res = rng.randi_range(0, 1000)
	if res % 500 == 0:
		var index = rng.randi_range(0, len(tiles)-1)
		var randTilePos = self.to_global(gridMap.map_to_local(tiles[index]))
		var coin = coinScene.instantiate()
		coin.position = randTilePos + Vector3(0, 5, 0)
		add_child(coin)
		
		return true
	return false

var dropping = true

func _process(delta):
	while dropping == true:
		if !drop_coins():
			dropping = false
	dropping = true
	
