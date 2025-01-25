extends Area2D
#Para que el empuje sea efectivo se debe activar las colisiones en las leyer y mask 10 del objeto a mover
var fuerzaDeEmpuje  = 1

func _ready() -> void:
	$Sound_secador.play()
	
func _physics_process(delta):
	for body in get_overlapping_bodies():
		var direccion:Vector2 = global_transform.x.normalized()
		body.apply_impulse(direccion*fuerzaDeEmpuje)

func _on_timer_timeout() -> void:
	get_tree().call_group("ControlOxigeno", "quitar_oxigeno", 1)
