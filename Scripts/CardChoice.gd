extends Node

var tooltipwidth = 0
var mousepos = Vector2(0,0)

func _ready():
	pass
	
func showSelf(name):
	name.visible = true
	tooltipwidth = name.rect_size.x
	
func hideSelf(name):
	name.visible = false

func _process(_delta):
	mousepos = get_viewport().get_mouse_position()
	#only display if within bounds
	if mousepos.y >= 563 && mousepos.y <= 710:
		if mousepos.x >= 28 && mousepos.x <= 376:
			showSelf($TooltipParent/TooltipXeno)
			hideSelf($TooltipParent/TooltipAnnie)
			hideSelf($TooltipParent/TooltipRobot)
		if mousepos.x >= 467 && mousepos.x <= 815:		
			hideSelf($TooltipParent/TooltipXeno)
			showSelf($TooltipParent/TooltipAnnie)
			hideSelf($TooltipParent/TooltipRobot)
		if mousepos.x >= 901 && mousepos.x <= 1248:
			hideSelf($TooltipParent/TooltipXeno)
			hideSelf($TooltipParent/TooltipAnnie)
			showSelf($TooltipParent/TooltipRobot)
		if (mousepos.x <28) || (mousepos.x >376 && mousepos.x <467) ||(mousepos.x >815 && mousepos.x <901) ||(mousepos.x >1248) :
			hideSelf($TooltipParent/TooltipXeno)
			hideSelf($TooltipParent/TooltipAnnie)
			hideSelf($TooltipParent/TooltipRobot)
	else:
		hideSelf($TooltipParent/TooltipXeno)
		hideSelf($TooltipParent/TooltipAnnie)
		hideSelf($TooltipParent/TooltipRobot)
	#show up on right or left side
	if mousepos.x < get_viewport().size.x/2:
		$TooltipParent.rect_position = mousepos - Vector2(0,0)
	else:
		$TooltipParent.rect_position = mousepos - Vector2(tooltipwidth,0)

#show when hovering over buttons

func _on_XenoOrbit_mouse_entered():
	showSelf($TooltipParent/TooltipXeno)

func _on_XenoOrbit_mouse_exited():
	hideSelf($TooltipParent/TooltipXeno)
