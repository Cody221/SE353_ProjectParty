extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var playerscene = GameManager.get_child(0)
	playerscene.visible = false
	var scene = load("res://Characters/%s.tscn" % playerscene.name).instantiate()
	print(self.get_children())
	self.get_child(2).add_child(scene)
	self.get_child(2).get_child(3).idle = false
	print(playerscene) 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
