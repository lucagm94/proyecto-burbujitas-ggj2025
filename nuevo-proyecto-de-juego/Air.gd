extends Area2D
#Para que el empuje sea efectivo se debe activar las colisiones en las leyer y mask 10 del objeto a mover
var fuerzaDeEmpuje  = 1

func _physics_process(delta):
	for body in get_overlapping_bodies():
		var direccion:Vector2 = global_transform.x.normalized()
		body.apply_impulse(direccion*fuerzaDeEmpuje)
