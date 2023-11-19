extends Node


func _ready():
	pass 


func _on_Button_pressed():
	emit_signal("choice_selected", 0)


func _on_Button2_pressed():
	emit_signal("choice_selected", 1)
