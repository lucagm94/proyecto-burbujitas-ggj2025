extends CharacterBody2D

const SPEED = 300.0

var bubble = preload("res://Scenes/MC/Shots/Bublee_shoot.tscn")
var air = preload("res://Scenes/MC/Shots/Air.tscn")
var bullet
signal consumir_oxigeno(oxigenoUtilizado: int)
signal recuperar_oxigeno(oxigenoRecuperado: int)
func _physics_process(delta: float) -> void:
	
	mover_mc(delta)

func _process(delta: float) -> void: 
	disparar()

func mover_mc(delta) -> void: 
	var direccion = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		direccion.y -= 1
	if Input.is_action_pressed("ui_down"):
		direccion.y += 1
	if Input.is_action_pressed("ui_left"):
		direccion.x -= 1
	if Input.is_action_pressed("ui_right"):
		direccion.x += 1
	
	direccion = direccion.normalized()
	velocity = direccion * SPEED
	
	move_and_slide()

func disparar() -> void: 
	
	if Input.is_action_just_pressed("left_click"): #
		var mousePosition = get_global_mouse_position()
		var direccion = (mousePosition - global_position).normalized()
		var origenBala = global_position + direccion * 80
		
		var bala = bubble.instantiate()
		bala.global_position = origenBala
		get_tree().root.add_child(bala)
		bala.aplicar_fuerza_inicial(direccion)
		
		emit_signal("consumir_oxigeno",1)

	if Input.is_action_just_pressed("right_click"):
		var mousePosition = get_global_mouse_position()
		var direccion = (mousePosition - global_position).normalized()
		bullet = air.instantiate()
		add_child(bullet)
		bullet.global_position = global_position
		bullet.rotation= direccion.angle()
		pass
			
		
	if Input.is_action_pressed("right_click"):
		var mousePosition = get_global_mouse_position()
		var direccion = (mousePosition - global_position).normalized()
		bullet.rotation = direccion.angle()
			
	if Input.is_action_just_released("right_click"):
		print("Click soltado")
		bullet.queue_free()


# func _on_area_2d_body_entered(body: Node2D) -> void:
#	if body.name == "Bubble":
#		emit_signal("recuperar_oxigeno", 10)
#		body.queue_free()
#	pass # Replace with function body.


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "BubbleArea":
		emit_signal("recuperar_oxigeno", 1)
		area.get_parent().queue_free()
