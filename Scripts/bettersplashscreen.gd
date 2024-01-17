extends Node2D
var timesclicked = 0

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				print(timesclicked)
				match timesclicked:
					0:
						$"Sprites/1".visible = true
					1:
						$"Sprites/2".visible = true
					2:
						$"Sprites/3".visible = true
					3:
						$"Sprites/4".visible = true
				timesclicked += timesclicked	
