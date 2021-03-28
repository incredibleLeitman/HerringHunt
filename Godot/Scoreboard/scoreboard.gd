extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	#var score = get_score_for_player("new")
	#score = get_score_for_player("Karl")
	#print("score: " + String(score))
	
	#add_score_for_player("Karl", 9999)
	#add_score_for_player("Nino", 150)
	#add_score_for_player("new", 100)
	
	# fill gui
	var data = ScoreData.get_all_scores()
	var box = get_node("CenterContainer/VBoxContainer/Scores")
	for user in data.keys():
		var label = Label.new()
		label.set_text(user + "    " + String(data[user]["score"]))
		box.add_child(label)


func _on_Button_button_down():
	var error = get_tree().change_scene("res://Menue/menue.tscn")
	if not error == 0:
		print("load menu failed! Error: " + String(error))
