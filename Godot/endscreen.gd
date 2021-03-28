extends Control

var scoreboard = preload("res://Fischi/SpeziFisch.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var labelScore = get_node("CenterContainer/VBoxContainer/Label")
	labelScore.text = labelScore.text.replace("%score%", ScoreCounter.score)
	
	var sprite = get_node("AnimatedSprite")
	sprite.play()

func _on_Button_button_down():
	var text = get_node("CenterContainer/VBoxContainer/TextEdit").text
	if text.length() != 0:
		ScoreData.add_score_for_player(text, ScoreCounter.score)
		ScoreCounter.score = 0
		var error = get_tree().change_scene("res://Scoreboard/scoreboard.tscn")
		if not error == 0:
			print("change to scoreboard failed! Error: " + String(error))
