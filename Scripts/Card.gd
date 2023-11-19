extends Control

#card type enum for which sprite is displayed
export(String, "AI1", "AI2", "AI3", "cat", "cat2", "coolworm", "cowboy", "credit", "game", "hole", "king", "layers", "man", "orbit", "patrick", "phone", "rahma", "rana", "raye", "razor", "recursion", "ship", "ted", "vase", "wanted", "worm", "youwin") var cardtype

#card suit for asking for a type
export(String, "orbit", "ship", "worm", "coolworm", "raye", "SPECIAL") var cardSuit

func _ready():
	#change sprite depending on card type 

	var typeCapped = cardtype[0].to_upper() + cardtype.substr(1,-1)
	var path = "res://Sprites/Cards/card" + typeCapped + ".png"
	$Sprite.texture = load(path)


func isSuit(suit):
	if(suit == cardSuit):
		return true


#animation when entering/exiting hand?
