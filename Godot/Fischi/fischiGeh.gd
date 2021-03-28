extends RigidBody2D

var startY
var endY
var useVelX
var useVelY = 300

var pulling_to = false
var pull_speed = 200

var endMin = -100
var endRange = 400
var velXMin = 150
var velXRange = 200
var velYMin = 250
var velYRange = 100

var direction = 1  #1 for left-to-right; -1 for right-to-left

func setDirect(dearReini):
	direction = dearReini
	get_node("FischiStruggle").scale.x *= dearReini

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	gehFischi()
	var error = connect("body_entered", self, "_on_collision")

func _on_collision(body):
	if body.name == "Player":
		if !pulling_to:
			ScoreCounter.geschlagen()
		else:
			ScoreCounter.regFish()
			
		queue_free()

func gehFischi():
	startY = position.y
	randJumpStuff()
	linear_velocity = Vector2(useVelX, -useVelY)
	
func checkHeight():
	if position.y > startY + endY:
		gehFischi()

func randJumpStuff():
	endY = randi()%endRange+endMin
	useVelX = (randi()%velXRange+velXMin) * direction

func fischiDreh():
	var velY = linear_velocity.y
	var drehProz
	drehProz = velY/useVelY
	if drehProz > 1:
		drehProz = 1
	rotation_degrees = drehProz * 90 * direction

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Pull towards a thing
	if pulling_to:
		var dir = (pulling_to - position) * pull_speed * delta
		linear_velocity = dir
		gravity_scale = 0
	else:
		checkHeight()
		fischiDreh()
	
func pull_to(position):
	pulling_to = position
