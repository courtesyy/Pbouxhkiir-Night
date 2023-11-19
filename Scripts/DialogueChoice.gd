extends Node


func _ready():
	pass 


func _on_Button_pressed():
	#emit_signal("choice_selected", 0)
	get_parent().get_parent().makeChoice(0)
	$Select.play()


func _on_Button2_pressed():
	#emit_signal("choice_selected", 1)
	get_parent().get_parent().makeChoice(1)
	$Select.play()

func _on_Button_mouse_entered():
	$Hover.play()
