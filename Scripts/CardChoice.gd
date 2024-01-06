extends Node

enum choices {nobody, xeno, annie, robot}
var choicefocus = choices.nobody
var defaulttext = "Your turn! Poke a player to get a card."


var character = "xeno"
var card = "worm"


func _ready():
	choicefocus = choices.nobody
	$Prompt.text = defaulttext
	$Menu.visible = false
	

#hover over robot
func _on_AreaRobot_mouse_entered():
	if choicefocus == choices.nobody:
		$Prompt.text = "Poke 3b42dd00-903a-47b8-87b8-47e0-4447-fcf1-2bed-a6a4-dcf3-484c-9f5420547c893ba1 for a card?"

#hover over annie
func _on_AreaAnnie_mouse_entered():
	if choicefocus == choices.nobody:
		$Prompt.text = "Poke Aniline for a card?"

#hover over xeno
func _on_AreaXeno_mouse_entered():
	if choicefocus == choices.nobody:
		$Prompt.text = "Poke the xenophage for a card?"

#hover over nobody
func _on_AreaOther_mouse_entered():
	if choicefocus == choices.nobody:
		$Prompt.text = "Your turn! Poke a player to get a card."


#select xeno
func _on_AreaXeno_input_event(_viewport, event, _shape_idx):
	if choicefocus == choices.nobody:
		if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				choicefocus = choices.xeno
				$Prompt.text = "Poke for which card?"
				$Menu.visible = true
				character = "xeno"

#select annie
func _on_AreaAnnie_input_event(_viewport, event, _shape_idx):
	if choicefocus == choices.nobody:
		if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				choicefocus = choices.annie
				$Prompt.text = "Poke for which card?"
				$Menu.visible = true
				character = "annie"

#select robot
func _on_AreaRobot_input_event(_viewport, event, _shape_idx):
	if choicefocus == choices.nobody:
		if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				choicefocus = choices.robot
				$Prompt.text = "Poke for which card?"
				$Menu.visible = true
				character = "robot"

#back button
func _on_Back_pressed():
	choicefocus = choices.nobody
	$Menu.visible = false
	$Prompt.text = defaulttext
	$Back.play()


#click outside buttons to back out
func _on_BackOut_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				choicefocus = choices.nobody
				$Menu.visible = false
				$Prompt.text = defaulttext


#"orbit", "ship", "worm", "cool worm", "raye",

#emit usable signal that gives
func _on_Orbit_pressed():
	#emit_signal("card_selected", "orbit", choicefocus)
	$Select.play()
	card = "orbit"
	submit()
	
func _on_Ship_pressed():
	##emit_signal("card_selected", "ship", choicefocus)
	$Select.play()
	card = "ship"
	submit()
	
func _on_Worm_pressed():
	#emit_signal("card_selected", "worm", choicefocus)
	$Select.play()
	card = "worm"
	submit()

func _on_Raye_pressed():
	##emit_signal("card_selected", "raye", choicefocus)
	$Select.play()
	card = "raye"
	submit()

func _on_Coolworm_pressed():
	#emit_signal("card_selected", "cool worm", choicefocus)
	$Select.play()
	card = "cool worm"
	submit()

#button hover sound
func _on_button_mouse_entered():
	$Hover.play()



func submit():
	print("asking for ", card, " from ", character)
	get_parent().get_parent().askForCard(character, card)

#change label name to card hovering over
func _on_Orbit_mouse_entered():
	$Menu/CardName.text = "Orbit"
func _on_Worm_mouse_entered():
	$Menu/CardName.text = "Worm"
func _on_Raye_mouse_entered():
	$Menu/CardName.text = "Raye"
func _on_Coolworm_mouse_entered():
	$Menu/CardName.text = "Cool Worm"
#name of the "ship" card can be changed because it is funny
func _on_Ship_mouse_entered():
	$Menu/CardName.text = $Menu/VariableCardName.text
#remove label name when not hovering over card
func _on_card_mouse_exited():
	$Menu/CardName.text = ""
