extends Node
class_name State

var machine #Referencia al dueño del estado
func _init(machine_reference) -> void: #constructor
	machine = machine_reference
	_enter()
	pass

func _enter() -> void: #Este metodo deberia setear todo lo necesario para que el estado funcione
	pass
	

func _exit() ->void: #Este metodo no es del todo necesario creo. Deberia preparar al objeto para salir del estado
	pass

func doingHisShit(): #el metodo que hace lo que hace el estado
	pass
