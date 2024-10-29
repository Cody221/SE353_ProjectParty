extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var initialize_response: Dictionary = Steam.steamInitEx( true, 480 )
	print("Did Steam initialize?: %s " % initialize_response)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
