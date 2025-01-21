extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	mover_mc(delta)

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
