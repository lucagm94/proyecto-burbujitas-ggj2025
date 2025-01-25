extends State
class_name InABubble

func _enter(machine_reference):
	super._enter(machine_reference)
	if machine is RigidBody2D:
		machine.add_constant_central_force(Vector2(0,-500))
		machine.set_deferred("freeze",false)
	pass

func _exit() ->void:
	super._exit()
	machine.find_child("FourthHit",true,false).visible = false
	Sounds.play_sfx("BubleeExplosion")
	pass


func doingHisShit():
	pass
	
func _on_area_2d_body_entered(body: Node2D) -> void: #remplaza al metodo de la señal
	if body.is_in_group("RompeBurbuja"):
		machine._changeState(Falling.new())
	pass
	
