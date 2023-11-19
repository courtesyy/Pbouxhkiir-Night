extends Node


#true for the player hand to make it look nice 
export (bool)var formatHand = false 
export (int)var containerWidth = 1000
export (int)var yPos = 500

var cardWidth = 191
var desiredPadding = -20

var midpoint = 500 - (191 / 2)
var screenWidth = 1280

var cardCount = 0

# parent of a hand 
## has a position 
# has a bunch of cards 
# could potentially control layout

func _ready():
	# when we start, load our children as our hand
	# TODO 

	# keep track of how many in cardCount
	cardCount = get_child_count()

	# then, shuffle ourself 

	screenWidth = get_viewport().size.x
	midpoint = (screenWidth / 2)
	# - (cardWidth / 2) + ((screenWidth - containerWidth) / 2)

	formatHand()

# does this hand have a card of a suit?
func hasCard(suit):

	#TODO 

	return true



# take a card out of this hand and put it in the other hand 
func giveCard(card, newHand):

	if(!hasCard(card)):
		printerr("asked to give card ", card, " but didnt have it!")
		return

	# TODO move card
	
	cardCount = cardCount - 1
	newHand.cardCount = newHand.cardCount + 1
	formatHand()
	newHand.formatHand()


# give a random card to the other person from this hand 
func giveRandom(newHand):
	## TODO pick a random card type from what's in the hand and ask for it 
	var randomCardName = ""
	# TODO 

	giveCard(randomCardName, newHand)


func formatHand():

	if(!formatHand): ##hides offscreen 
		formatFrom(-1000, 0)
		return
	
	var pixelsWide = (cardWidth + desiredPadding) * cardCount
	
	var startingPos = 0 
	var distanceBetween = 0

	if(pixelsWide <= containerWidth):
		# dont need to squash, do from midpoint
		distanceBetween = cardWidth + desiredPadding
		startingPos = midpoint - ((distanceBetween * cardCount) / 2) 
		formatFrom(startingPos, distanceBetween)

	else:
		# squash 
		distanceBetween = containerWidth / (cardCount)
		startingPos = ((screenWidth - containerWidth) / 2) - ((cardWidth - distanceBetween) / 2)
		formatFrom(startingPos, distanceBetween)


func formatFrom(startingPos, distance):
	for i in cardCount:
		var child = get_child(i)
		child.set_position(Vector2(startingPos + (distance * i), yPos))
