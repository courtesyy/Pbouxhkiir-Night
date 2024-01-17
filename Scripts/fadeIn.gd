extends Node2D

#fade in when created
func _ready():
	$AnimationPlayer.play("FadeIn")

#destroy self when finished fading out
func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
