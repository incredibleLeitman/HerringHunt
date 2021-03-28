extends RigidBody2D

var lifetime = 0
var slow_start_time = 0.1

onready var player = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	var error = connect("body_entered", self, "_on_collision")
	if not error == 0:
		print("error connection body_entered event! Error: " + String(error))


func _physics_process(delta):
	# If the slow_start_time has been reached, slow the thing
	# more and more
	lifetime += delta
	
	if lifetime > slow_start_time:
		linear_velocity -= 0.05 * linear_velocity
		
		
func _on_collision(body):
	linear_velocity = Vector2(0, 0)
	gravity_scale = 0
	
	if body.is_in_group("Holdy"):
		player.pull_to(body.position)
		
	if body.is_in_group("Fischi"):
		if body.has_method("pull_to"):
			body.pull_to(player.position)
