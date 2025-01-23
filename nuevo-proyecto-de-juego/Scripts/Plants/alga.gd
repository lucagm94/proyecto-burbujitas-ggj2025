extends RigidBody2D

var state:State
var hits:int
var bubble = preload("res://Scenes/MC/Shots/Bublee_shoot.tscn")

func _ready() -> void:
	hits = 0
	state = State.new(self)
	
	
	pass
	
func _physics_process(delta: float) -> void:
	state.doingHisShit()

	pass
	
func _hits():
	if hits < 4:
		hits+=1
		
	match hits:
		0:
			%FirstHit.visible = false
			%SecondHit.visible = false
			%ThirdHit.visible = false
			%FourthHit.visible = false
		1:
			%FirstHit.visible = true
		2:
			%SecondHit.visible = true
		3:
			%ThirdHit.visible = true
		4:
			%FirstHit.visible = false
			%SecondHit.visible = false
			%ThirdHit.visible = false
			%FourthHit.visible = true
			if not (state is InABubble):
				state = InABubble.new(self)
			
			



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Bubble"): #no encontre mejor manera para identificar a la burbuja
		body.queue_free()
		_hits()
	pass # Replace with function body.
