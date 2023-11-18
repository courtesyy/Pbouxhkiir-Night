extends Node

enum choices {nobody, xeno, annie, robot}
var choicefocus = choices.nobody
var defaulttext = "Your turn! Poke a player to get a card."

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

#select annie
func _on_AreaAnnie_input_event(_viewport, event, _shape_idx):
	if choicefocus == choices.nobody:
		if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				choicefocus = choices.annie
				$Prompt.text = "Poke for which card?"
				$Menu.visible = true

#select robot
func _on_AreaRobot_input_event(_viewport, event, _shape_idx):
	if choicefocus == choices.nobody:
		if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				choicefocus = choices.robot
				$Prompt.text = "Poke for which card?"
				$Menu.visible = true

#back button
func _on_Back_pressed():
	choicefocus = choices.nobody
	$Menu.visible = false
	$Prompt.text = defaulttext


#click outside buttons to back out
func _on_BackOut_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				choicefocus = choices.nobody
				$Menu.visible = false
				$Prompt.text = defaulttext

#emit usable signal that gives
func _on_Orbit_pressed():
	emit_signal("card_selected", "orbit", choicefocus)

func _on_Ship_pressed():
	emit_signal("card_selected", "ship", choicefocus)
	
func _on_Worm_pressed():
	emit_signal("card_selected", "worm", choicefocus)

func _on_Raye_pressed():
	emit_signal("card_selected", "raye", choicefocus)

func _on_Coolworm_toggled(button_pressed):
	emit_signal("card_selected", "cool worm", choicefocus)
