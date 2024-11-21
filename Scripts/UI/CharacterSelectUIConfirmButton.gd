extends Button

var colorRect
var label
var startButton
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(self._buttonPressed)
	colorRect = $"../ColorRect"
	label = $"../RichTextLabel"
	startButton = $"../Start_Game"
	

func _buttonPressed():
	print("Freddy that is yellow")
	if (MPIO.get_child(0).is_server):
		startButton.visible = true
	colorRect.visible = true
	label.visible = true
	
