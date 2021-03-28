extends Control

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ButtonExit_button_down():
	get_tree().quit()


func _on_ButtonScore_button_down():
	var error = get_tree().change_scene("res://Scoreboard/scoreboard.tscn")
	if not error == 0:
		print("change to scoreboard failed! Error: " + String(error))


func _on_ButtonStart_button_down():
	var error = get_tree().change_scene("res://Main.tscn")
	if not error == 0:
		print("start game failed! Error: " + String(error))
