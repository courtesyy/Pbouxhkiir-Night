extends Node


#true for the player hand to make it look nice 
export (bool)var shuffleStart = false
export (bool)var formatHand = false 
export (int)var containerWidth = 1000
export (int)var yPos = 500

var cardWidth = 191
var desiredPadding = -20

var midpoint = 500 - (191 / 2)
var screenWidth = 1280

var cardCount = 0

#used to shuffle without actually shuffling 
var indexMap = []

# parent of a hand 
## has a position 
# has a bunch of cards 
# could potentially control layout

func _ready():

	# keep track of how many in cardCount
	cardCount = get_child_count()

	screenWidth = get_viewport().size.x
	midpoint = (screenWidth / 2)

	doFormatHand()

# does this hand have a card of a suit?
func hasCard(suit):

	for i in cardCount:
		if(get_child(i).isSuit(suit)):
			print("found ", suit, " at ", i)
			return true

	print("did not find ", suit)
	return false

#returns index of card of type, -1 if not found 
func findCard(type):
	for i in cardCount: 
		if(get_child(i).cardtype == type):
			print("found ", type, " at ", i)
			return i
	return -1


# take a card out of this hand and put it in the other hand 
func giveCard(card, newHand):

	print("giving ", card)

	var indexOfCardType = findCard(card)

	if(indexOfCardType == -1):
		printerr("asked to give card ", card, " but didnt have it!")
		return

	# move card
	var cardToMove = get_child(indexOfCardType)
	cardToMove.get_parent().remove_child(cardToMove)
	newHand.add_child(cardToMove)
	
	cardCount = cardCount - 1
	newHand.cardCount = newHand.cardCount + 1
	doFormatHand()
	newHand.doFormatHand()


# give a random card to the other person from this hand 
func giveRandom(newHand):
	## pick a random card type from what's in the hand and ask for it 
	var randomCardName = pickRandom()
	giveCard(randomCardName, newHand)

func giveRandomEnforced(newHand, ignoredSuit):
	var randomCardName = pickRandom(ignoredSuit)
	giveCard(randomCardName, newHand)

func pickRandom(ignoredSuit = "NONE"):
	var randIndex = randi() % cardCount
	var c = get_child(randIndex)
	if(ignoredSuit == "NONE" || (c.cardSuit != ignoredSuit)):
		return c.cardtype # success 
	else: 
		return pickRandom(ignoredSuit)


func doFormatHand():

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
