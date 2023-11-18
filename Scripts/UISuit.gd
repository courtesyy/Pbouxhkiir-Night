
# displayed for the player to pick a suit to ask for. 

extends Control

#card type enum for which sprite is displayed
export(String, "orbit", "ship", "worm", "rahma", "raye", "cool worm", "byleth", "AI1", "AI2", "AI3", "you won", "yugioh") var cardtype

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

