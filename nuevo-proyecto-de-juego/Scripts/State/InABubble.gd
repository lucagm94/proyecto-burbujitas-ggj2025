extends State
class_name InABubble

func _enter():
	super._enter()
	print("Ingresando al state In a Bubble")
	pass
	
func doingHisShit():
	machine.position -= Vector2(0,1)
	pass
