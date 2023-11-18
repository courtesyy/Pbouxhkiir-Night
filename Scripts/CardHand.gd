extends Node


# parent of a hand 
## has a position 
# has a bunch of cards 
# could potentially control layout

func _ready():
	# when we start, load our children as our hand
	# then, shuffle ourself 
	pass

# does this hand have a card of a suit?
func hasCard(suit):
	pass 

# take a card out of this hand and put it in the other hand 
func giveCard(card, newHand):
	pass

