extends Node

# Assign this variable to MPAuth node
#@export var auth: MPAuth

signal listIndex(index)

func _ready():
	pass
	#auth.authenticate_function = _auth_check

func _auth_check(plr_id: int, credentials_data: Dictionary, handshake_data: Dictionary):
	# Return authentication data, otherwise if failed, return false.
	return {}


func _on_item_list_item_selected(index: int) -> void:
	listIndex.emit(index)
	print(index) # Replace with function body.
