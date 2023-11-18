extends Control

##export var cardTexture

#card type enum for which sprite is displayed
export(String, "orbit", "ship", "worm", "rahma", "raye", "cool worm", "byleth", "AI1", "AI2", "AI3", "you won", "yugioh") var cardtype

#card suit for asking for a type
export(String, "orbit", "ship", "worm", "other") var cardSuit

func _ready():
	#change sprite depending on card type
	match cardtype:
		"orbit":
			$Sprite.texture = load("res://Sprites/cardOrbit.png")
		"ship": 
			$Sprite.texture = load("res://Sprites/cardShip.png")
		"worm":
			$Sprite.texture = load("res://Sprites/cardWorm.png")
		#TODO others 

func isSuit(suit):
	if(suit == cardSuit):
		return true


#animation when entering/exiting hand?
