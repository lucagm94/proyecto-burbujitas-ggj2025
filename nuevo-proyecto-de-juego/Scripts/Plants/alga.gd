extends RigidBody2D

var state:State
var hits:int
var bubble = preload("res://Scenes/MC/Shots/Bublee_shoot.tscn")

func _ready() -> void:
	hits = 0
	state = IdleObject.new()
	state._enter(self)
	pass
	
func _physics_process(delta: float) -> void:
	state.doingHisShit()

	pass
	
func _hits():
	hits +=1
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
				_changeState(InABubble.new())
			
			

func _changeState(newState:State):
	state._exit()
	state = newState
	state._enter(self)


func _on_area_2d_body_entered(body: Node2D) -> void:
	state._on_area_2d_body_entered(body)
	pass # Replace with function body.
