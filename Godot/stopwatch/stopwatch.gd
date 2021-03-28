extends Node

var stopWatchRunning
var elapsedTime #elapsed time in seconds

func _ready():	
	reset()

func _process(delta):

	if stopWatchRunning == true:
		elapsedTime += delta
	
func start():
	
	if stopWatchRunning == true:
		print('timer already started')
		return
		
	stopWatchRunning = true
	
func stop():
	stopWatchRunning = false
	
func getElapsedTimeSec():
	return elapsedTime
	
func getElapsedTimeMilliSec():
	return elapsedTime * 1000
	
func reset():
	stopWatchRunning = false
	elapsedTime = 0.0
