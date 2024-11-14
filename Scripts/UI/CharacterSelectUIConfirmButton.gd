extends Button



var colorRect
var label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(self._buttonPressed)
	colorRect = $"../ColorRect"
	label = $"../RichTextLabel"
	

func _buttonPressed():
	print("Freddy that is yellow")
	colorRect.visible = true
	label.visible = true
	
