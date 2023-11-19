extends CanvasItem

onready var textLabel = $BubbleMargin/TextMargin/Text

onready var sound = $ShowSound

func _ready():
	pass

# called when displayed for the first time
func displayBubble(text):
	print("displaying bubble with ", text)
	playSoundIfExists()
	textLabel.text = text
	show()

func playSoundIfExists():
	if(sound != null):
		sound.play()
	else:
		print_debug("no sound on this bubble")
