extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(self._buttonPressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _buttonPressed():
	print("Bahnie the Bunny")
	MPIO.get_child(0).load_scene("res://WorldScenes/DefaultWorld.tscn")
