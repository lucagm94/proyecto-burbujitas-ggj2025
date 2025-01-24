extends State
class_name IdleObject

func _enter(machine_reference):
	super._enter(machine_reference)
	machine.set_deferred("freeze",true)
	pass

func _exit() ->void:
	super._exit()
	machine.hits = 0
	pass


func doingHisShit():
	pass
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Bubble"): #no encontre mejor manera para identificar a la burbuja
		body.queue_free()
		machine._hits()
pass
