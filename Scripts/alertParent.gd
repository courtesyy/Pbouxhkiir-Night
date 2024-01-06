extends Control

#play animation
func _ready():
	 $AnimationPlayer.play("New Anim")

#delete self when animation is done
func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
