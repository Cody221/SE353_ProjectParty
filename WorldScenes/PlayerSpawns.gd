extends Node3D

@onready var startPosition = self.position
 
var locationNum = 7
var locations = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	for location in range(0, locationNum):
		var temp = Vector3(startPosition.x + (location), startPosition.y, startPosition.x)
		locations.append(temp)
		
	for location in locations:
		pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
