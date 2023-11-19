extends CanvasItem

onready var textLabel = $BubbleMargin/TextMargin/Text

onready var sound = $ShowSound

func _ready():
	pass

# called when displayed for the first time
func displayBubble(text):
	sound.play()
	textLabel.text = text
	show()
	
func _on_SpeechBubble_visibility_changed():
	pass # play a sound
