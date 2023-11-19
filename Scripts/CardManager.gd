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

# character asks player for a card
func CharAsksPlayerCard():
	pass

# character asks another player for a card 
func CharAsksCharCard():
	pass

func PlayerAsksCharCard():
	pass


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

