extends CanvasItem

onready var textLabel = $BubbleMargin/Text

onready var sound = $AudioStreamPlayer2D

func _ready():
	pass

# called when displayed for the first time
func displayBubble():
	#print("displaying bubble with ", text)
	playSoundIfExists()
	#textLabel.text = text
	show()

func playSoundIfExists():
	if(sound != null):
		sound.play()
	else:
		print_debug("no sound on this bubble")
	

func _on_SpeechBubble_visibility_changed():
	print("why is this here")

