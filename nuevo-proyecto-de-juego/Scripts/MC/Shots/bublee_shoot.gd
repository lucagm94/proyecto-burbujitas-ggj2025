extends CharacterBody2D

@export var speed = 600
var velocidadInicial = 100
var impulsoInicial = true

func _ready():
	Sounds.play_sfx("BubleeGun")

func _physics_process(delta: float) -> void:
	velocity.y = -speed * delta
	move_and_slide()
	
func aplicar_fuerza_inicial(direccion: Vector2) -> void: 
	if impulsoInicial: 
		velocity = direccion * velocidadInicial


func _on_timer_fuerza_timeout() -> void:
	if impulsoInicial: 
		if (velocity.x > 0):
			velocity.x = velocity.x -4
			$TimerFuerza.stop()
			$TimerFuerza.start()
		if (velocity.x < 0):
			velocity.x += 4
			$TimerFuerza.stop()
			$TimerFuerza.start()
		if velocity.x < 1 and velocity.x > -1:
			$TimerFuerza.stop()
			impulsoInicial = false


func _on_bubble_area_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("RompeBurbuja"):
		Sounds.play_sfx("BubleeExplosion")
		queue_free()


func _on_destruir_timeout() -> void:
	queue_free()
	pass # Replace with function body.
