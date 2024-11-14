extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(self._buttonPressed)

func _buttonPressed():
	print("Freddy Fivebear")
