extends Node2D

var rangeLeft
var rangeRight

var timer
var max_time = 60

var fischi_scene = preload("res://Fischi/fischi.tscn")
var spezifisch_scene = preload("res://Fischi/SpeziFisch.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	# get pos and size from left waterfall
	var waterfall = get_node("Background/waterfall2")
	var width = waterfall.get_node("TextureRect").rect_size.x * waterfall.scale.x
	rangeLeft =  Vector2(waterfall.position.x, width)
	print("left range: " + String(rangeLeft))
	
	waterfall = get_node("Background/waterfall")
	width = waterfall.get_node("TextureRect").rect_size.x * waterfall.scale.x
	rangeRight =  Vector2(waterfall.position.x, width)
	print("right range: " + String(rangeRight))
	
	timer = get_node("Timer")
	# spawn fischi random between 0.5 - 2 sec
	timer.wait_time = 0.5 + randf()*1.5
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	timer.wait_time = 0.5 + randf()*1.5
	
	var dir = randi()%2
	if dir == 0:
		dir -= 1
	
	if randi() % 20 == 1:
		var fischi = spezifisch_scene.instance()
		var posY = get_node("PlayerCamera").position.y + 500
		var posX = (randf() - 0.5) * 800
		
		fischi.position.x = posX
		fischi.position.y = posY
		
		add_child(fischi)
	else:
		var fischi = fischi_scene.instance()
		var rangeX
		if dir == -1:
			rangeX = rangeRight
		else:
			rangeX = rangeLeft
	
		var posX = randi()%int(rangeX.y) + rangeX.x
		var posY = get_node("PlayerCamera").position.y
		#print("spawn fischi on pos " + String(posX) + ", " + String(posY))
		fischi.position = Vector2(posX, posY)
		fischi.setDirect(dir)

		add_child(fischi)


func _on_playTimer_timeout():
	var label = get_node("PlayerCamera/CanvasLayer/Label")
	label.text = String(max_time)
	if max_time <= 0:
		get_tree().change_scene("res://Menue/endscreen.tscn")
	max_time -= 1
