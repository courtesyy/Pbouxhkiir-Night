extends Node


onready var deck = $Deck
onready var handPlayer = $HandPlayer
onready var handAnnie = $HandAnnie
onready var handXeno = $HandXeno
onready var handRobot = $HandRobot
onready var specialCards = $SpecialCards # for the AI cards, cards force given to the player



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# character asks player for a card
func CharAsksPlayerCard():
	pass

# character asks another player for a card 
func CharAsksCharCard():
	pass

func PlayerAsksCharCard():
	pass


