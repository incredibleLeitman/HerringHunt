extends Node2D

var platform1 = preload("res://HoldyPoint/HoldyPoint1.tscn")
var platform2 = preload("res://HoldyPoint/HoldyPoint2.tscn")
# Called when the node enters the scene tree for the first time.

func _ready():
	randomize()
	
	for i in range(1,100):
		var x = randi()%600-300
		var y = randi()%1080+1-i*100
		var position = Vector2(x, y)
		var platform;
		
		if i % 2 == 0:
			platform = platform1.instance()
		else:
			platform = platform2.instance()
			
		platform.position = position
		add_child(platform)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
