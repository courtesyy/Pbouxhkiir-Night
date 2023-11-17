extends CanvasItem

onready var textLabel = $BubbleMargin/TextMargin/Text

func _ready():
	pass

# called when displayed for the first time
func display():
	print_debug("displaying a bubble")
	#set this visible so the other event triggers on visibility change 
	#on visibiliyu change, it will play a sound
	show();

func setText(text):
	textLabel.text = text

