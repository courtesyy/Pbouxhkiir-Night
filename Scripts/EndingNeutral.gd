extends Node2D


func _ready():
	$AnimationPlayer.play("EarthExplosion")
	$AnimationPlayer2.play("You lost")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Proceed_toggled(button_pressed):
	emit_signal("dialogue_done")
