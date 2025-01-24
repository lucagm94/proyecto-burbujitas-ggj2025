extends State
class_name Falling

func _enter(machine_reference):
	super._enter(machine_reference)
	print("Ingresando al state Falling")
	if machine is RigidBody2D:
		print("aplicando fuerza")
		machine.add_constant_central_force(Vector2(0,500))
	pass
	
func doingHisShit():
	pass
	
func _on_area_2d_body_entered(body: Node2D) -> void: #remplaza al metodo de la señal
	pass
