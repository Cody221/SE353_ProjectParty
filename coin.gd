extends MeshInstance3D

@onready var area = $"Area3D"
@onready var shadow = $"Shadow"

func _ready():
	area.body_entered.connect(collision)
	shadow.position = position - Vector3(0, 5, 0)

func _process(delta):
	#while area.overlaps_body():
	position -= Vector3(0, 1, 0) * delta
	

func collision(collider):
	if collider.get_class() == "CharacterBody3D":
		collider.get_parent().score()
		#GameManager.miniGame.
	elif collider.get_class() == "GridMap":
		pass
	queue_free()
	#print("touched", collider.get_class())
