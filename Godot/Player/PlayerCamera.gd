extends Camera2D

var min_speed = 40

onready var player = get_parent().get_node("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= min_speed * delta
	
	if position.y > player.position.y - 150:
		position.y = player.position.y - 150
	
