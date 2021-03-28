extends Node

var score = 0

func regFish():
	score += regFishScore

func speziFish():
	score += speziFishScore
	
func geschlagen():
	score += geschlagenScore


var regFishScore = 7
var speziFishScore = 18
var geschlagenScore = -10
