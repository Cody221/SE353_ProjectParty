extends Control


@export var host_btn: Button
@export var join_btn: Button

@export var button_layout: Control

var mpc

var url = "12"
# Called when the node enters the scene tree for the first time.
func _ready():
	# Register Button Press Signals
	_loadMultiplay()
	mpc = MPIO.get_child(0)
	host_btn.pressed.connect(host_game)
	join_btn.pressed.connect(join_game)
	
	# Hide UI if client were connected
	mpc.connected_to_server.connect(_on_connected_to_server)
	mpc.connection_error.connect(_on_connection_error)

# When host game requested
func host_game():
	mpc.start_online_host(true)
	open_connecting_ui()

# When join game requested
func join_game():
	# Pass URL from address bar to MPC
	mpc.start_online_join(url)
	open_connecting_ui()
	_loadMultiplay()

# Open Connecting UI Layout
func open_connecting_ui():
	button_layout.visible = false


# Close UI when connected to server
func _on_connected_to_server(_plr):
	visible = false

func _on_connection_error(reason: int):
	# Get value string of reason enum
	var reason_codename = MultiPlayCore.ConnectionError.keys()[reason]
	
	# Reset layout to connect buttons
	button_layout.visible = true



func _loadMultiplay():
	var multiplay = load("res://WorldScenes/Multiplayer.tscn").instantiate()
	MPIO.add_child(multiplay)
