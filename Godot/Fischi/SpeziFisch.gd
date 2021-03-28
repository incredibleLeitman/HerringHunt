extends RigidBody2D

export var speed = 200
var pulling_to = false

# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity.y = -speed
	var error = connect("body_entered", self, "_on_collision")

func _on_collision(body):
	if body.name == "Player":
		if !pulling_to:
			ScoreCounter.geschlagen()
		else:
			ScoreCounter.speziFish()
			
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pulling_to:
		linear_velocity.y = -speed / 3
	else:
		linear_velocity.y = -speed
	
func pull_to(body):
	pulling_to = true