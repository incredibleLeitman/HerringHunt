extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var percentage = (randi()%30+15)*0.01
	var scale = Vector2(percentage, percentage)
	var this_sprite = get_node("Sprite")
	this_sprite.set_scale(scale)
	#print(percentage)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
