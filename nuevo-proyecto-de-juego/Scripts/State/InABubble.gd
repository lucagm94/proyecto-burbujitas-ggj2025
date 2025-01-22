extends State
class_name InABubble

func _enter():
	super._enter()
	print("Ingresando al state In a Bubble")
	if machine is RigidBody2D:
		print("aplicando fuerza")
		machine.add_constant_central_force(Vector2(0,-1000))
		machine.set_deferred("freeze",false)

	pass
	
func doingHisShit():

	pass
