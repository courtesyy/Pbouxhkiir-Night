extends Node


onready var deck = $Deck
onready var handPlayer = $HandPlayer
onready var handAnnie = $HandAnnie
onready var handXeno = $HandXeno
onready var handRobot = $HandRobot
onready var specialCards = $SpecialCards # for the AI cards, cards force given to the player


var storedCard = "ERR"
var storedCharacter = "ERR"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func getHand(namestring):
	var hand = "ERR"
	match namestring: 
		"annie":
			hand = handAnnie
		"xeno": 
			hand = handXeno
		"robot":
			hand = handRobot
		"player":
			hand = handPlayer
	return hand

func drawFromDeck(character):
	deck.giveRandom(getHand(character))

func moveCard(from, to, card):
	var deckFrom = getHand(from)
	var deckTo = getHand(to)
	deckFrom.giveCard(card, deckTo)

func giveAICard(cardName):
	specialCards.giveCard(cardName, handPlayer)

# by suit 
func checkCard(character, card):
	var hand = getHand(character)
	return hand.hasCard(card)

# returns correct/incorrect index 
#*[ROBOT (correct)]->turn1playerrobottrue
#*[ROBOT (incorrect)]->turn1playerrobotfalse
#*[ANNIE (correct)]->turn1playerannietrue
#*[ANNIE (incorrect)]->turn1playeranniefalse
#*[XENOPHAGE (correct)]->turn1playerxenotrue
#*[XENOPHAGE (incorrect)]->turn1playerxenofalse
func askForCard(character, card):

	storedCharacter = character 
	storedCard = card

	var correct = checkCard(character, card)
	#if(correct):
	#	moveCard(character, "player", card)
	#else:
	#	drawFromDeck("player")
	#	pass
	
	if(character == "robot"):
		if(correct):
			return 0 
		else: 
			return 1
	elif(character == "annie"):
		if(correct):
			return 2
		else: 
			return 3
	elif(character == "xeno"):
		if(correct):
			return 4
		else: 
			return 5
	
	print("ERR")
	return 0


func finalizeCorrectCard():
	print("FINALIZE CORRECT CARD")
	moveCard(storedCharacter, "player", storedCard)


func SetupHands():

	# player starts with no weird cards
	deck.giveRandomEnforced(handPlayer, "SPECIAL")
	deck.giveRandomEnforced(handPlayer, "SPECIAL")
	deck.giveRandomEnforced(handPlayer, "SPECIAL")
	
	# annie doesn't start with worms 
	deck.giveRandomEnforced(handAnnie, "worm")
	deck.giveRandomEnforced(handAnnie, "worm")
	deck.giveRandomEnforced(handAnnie, "worm")

	# robot doesn't start with orbit 
	deck.giveRandomEnforced(handRobot, "orbit")
	deck.giveRandomEnforced(handRobot, "orbit")
	deck.giveRandomEnforced(handRobot, "orbit")

	# xeno doesn't start with rayes 
	deck.giveRandomEnforced(handXeno, "raye")
	deck.giveRandomEnforced(handXeno, "raye")
	deck.giveRandomEnforced(handXeno, "raye")

