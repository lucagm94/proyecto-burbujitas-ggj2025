extends CharacterBody2D

const SPEED = 300.0

var bubble = preload("res://Scenes/MC/Shots/Bublee_shoot.tscn")
var air = preload("res://Scenes/MC/Shots/Air.tscn")
var shots:Array = ["Bubble","Air"]
var currentShot = "Bubble"
var bullet

func _physics_process(delta: float) -> void:
	
	mover_mc(delta)

	
func _process(delta: float) -> void: 
	seleccionar_disparo()
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

func seleccionar_disparo() -> void:
	if Input.is_action_just_pressed("1"):
		currentShot = shots[0]
		print("Disparo 1 seleccionado")
	if Input.is_action_just_pressed("2"):
		currentShot = shots[1]
		print("Disparo 2 seleccionado")
		
func disparar() -> void: 
	
	if Input.is_action_just_pressed("left_click"):
		var mousePosition = get_global_mouse_position()
		var direccion = (mousePosition - global_position).normalized()
		var origenBala = global_position + direccion * 80
		#var bala;
		if currentShot == shots[0]:
			var bala = bubble.instantiate()
			bala.global_position = origenBala
			get_tree().root.add_child(bala)
			bala.aplicar_fuerza_inicial(direccion)
			print("deberia disparar")
			pass
		if currentShot == shots[1]:
			bullet = air.instantiate()
			add_child(bullet)
			bullet.global_position = global_position
			bullet.rotation= direccion.angle()
			pass
			
		
	if Input.is_action_pressed("left_click"):
		if currentShot == shots[1]:
			var mousePosition = get_global_mouse_position()
			var direccion = (mousePosition - global_position).normalized()
			bullet.rotation = direccion.angle()
			
	if Input.is_action_just_released("left_click"):
		print("Click soltado")
		if currentShot == shots[1]:
			bullet.queue_free()
			bullet=null
			#get_tree().root.find_child("Air",true,false).queue_free()
			

		
