extends Node2D

# when the player clicks anywhere, display something else. 

var clicked = false; 
export (bool)var listeningForClicks = false
export (bool)var shouldStartInvisible = false
#export (NodePath)onready var nextNode = get_node(nextNode) as Node2D
export (NodePath) var nextNodePath
var nextNode
var sounds = 0

var secondsBeforeClickable = 0.25;

# Called when the node enters the scene tree for the first time.
func _ready():
	if(shouldStartInvisible):
		hide()
	nextNode = get_node(nextNodePath)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):


	if(!listeningForClicks):
		return

	#if clickable, wait for clickable 
	if(secondsBeforeClickable > 0.0):
		secondsBeforeClickable = secondsBeforeClickable - delta
		return


# reveive the signal from the proceed button 
func receiveClick():

	if(!listeningForClicks || secondsBeforeClickable > 0.0):

		return

	listeningForClicks = false;
	nextNode.show()

	sounds = sounds + 1

	nextNode.listeningForClicks = true 

	if(nextNode.get_child_count() > 0):
		nextNode.get_child(0).play()

