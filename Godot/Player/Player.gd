extends KinematicBody2D

var aim_distance = 80
var aim_angle = Vector2(0, 0)

var loading = false
var loaded = 0
var loaded_max = 1.5

var pulling_to = false
var pull_speed = 7

var throw_force_factor = 60

onready var aim = get_node("Aim")
onready var whoosh = get_node("Whoosh")
onready var krk = get_node("Krk")
onready var anim = get_node("Anim")

var hook_scene = preload("res://Player/Hook.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var error = connect("body_entered", self, "_on_collision")


func _on_collision(body):
	if body.is_in_group("Fischi"):
		if !body.pulling_to:
			ScoreCounter.geschlagen()
		else:
			ScoreCounter.regFish()
			
		body.free()


func _process(delta):
	# Update loading var
	if loading:
		loaded += delta
		
		if loaded > loaded_max:
			loaded = loaded_max

	# Update mouse-to-player angle
	var global_mouse = get_global_mouse_position()
	var global_self = global_position
	var angle = global_self.angle_to_point(global_mouse)
	
	aim_angle.x = -cos(angle) * aim_distance
	aim_angle.y = -sin(angle) * aim_distance
	
	aim.position = aim_angle
	
	# Pull towards a thing
	if pulling_to:
		var dir = (pulling_to - position) * pull_speed * delta
		var collision = move_and_collide(dir)
		
		if position.distance_to(pulling_to) < 2:
			pulling_to = false
			anim.animation = "hangingIdle"
	else:
		krk.stop()
		krk.seek(0)
	
	# Input
	if Input.is_action_just_pressed("angle"):
		start_load()
	
	if Input.is_action_just_released("angle"):
		throw()


# Start loading the hook
func start_load():
	loading = true
	
	# Delete previous hook
	if has_node("Hook"):
		get_node("Hook").free()


# Throw the hook (after having started loading it)
func throw():
	var hook = hook_scene.instance()
	hook.position = aim_angle
	hook.name = "Hook"
	hook.apply_impulse(Vector2(0, 0), aim_angle * loaded * throw_force_factor)
	add_child(hook)
	
	loaded = 0
	loading = false
	
	# Play sound
	whoosh.seek(0)
	whoosh.play()
	
	anim.animation = "hangingThrown"
	
	
func pull_to(position):
	krk.play()
	anim.animation = "flying"
	pulling_to = position