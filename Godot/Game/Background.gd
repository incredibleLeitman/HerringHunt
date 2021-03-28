extends Node2D

var img = preload("res://Graphics/Bergtextur.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	
	var sprite = Sprite.new()
	sprite.texture = img
	add_child(sprite)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
