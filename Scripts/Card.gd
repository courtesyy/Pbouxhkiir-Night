extends Control

#card type enum
export(String, "orbit", "ship", "worm") var cardtype

func _ready():
	#change sprite depending on card type
	match cardtype:
		"orbit":
			$Sprite.texture = load("res://Sprites/cardOrbit.png")
		"ship": 
			$Sprite.texture = load("res://Sprites/cardShip.png")
		"worm":
			$Sprite.texture = load("res://Sprites/cardWorm.png")

#animation when entering/exiting hand?
