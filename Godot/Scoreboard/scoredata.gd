extends Node

var data
var file_score = "user://scores.json"


func _ready():
	print("initializing scoreboard...")
	var data_file = File.new()
	if data_file.open(file_score, File.READ) != OK:
		print("Couldn't read data from JSON file!")
		data = {}
		return

	var data_text = data_file.get_as_text()
	data_file.close()
	
	var data_parse = JSON.parse(data_text)
	if data_parse.error != OK:
		print("Scoreboard could not be parsed from JSON!")

	data = data_parse.result


func get_all_scores():
	return data


func get_score_for_player(name):
	if not data.has(name):
		print("No score for " + name)
		return 0;
	return data[name]["score"]


func add_score_for_player(name, score):
	var existScore = get_score_for_player(name)
	if existScore == 0 || score > existScore:
		data[name] = {"score": score}

		var data_file = File.new()
		if data_file.open(file_score, File.WRITE) != OK:
			print("Couldn't write data to JSON file!")
			#return
	
		data_file.store_line(to_json(data))
		data_file.close()