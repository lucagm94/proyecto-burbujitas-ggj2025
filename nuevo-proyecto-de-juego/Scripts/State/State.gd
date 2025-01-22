extends Node
class_name State

var machine
func _init(machine_reference) -> void:
	machine = machine_reference
	_enter()
	pass

func _enter() -> void:
	pass
	

func _exit(state:State) ->void:
	pass
	
func doingHisShit():
	pass
