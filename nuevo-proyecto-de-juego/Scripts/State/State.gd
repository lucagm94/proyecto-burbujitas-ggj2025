extends Node
class_name State

var machine #Referencia al dueño del estado
func _init() -> void: #constructor
	pass

func _enter(machine_reference) -> void:
	machine = machine_reference #Este metodo deberia setear todo lo necesario para que el estado funcione
	pass

func _exit() ->void: #Este metodo no es del todo necesario creo. Deberia preparar al objeto para salir del estado
	pass

func doingHisShit(): #el metodo que hace lo que hace el estado
	pass
	
func _on_area_2d_body_entered(body: Node2D) -> void: #remplaza al metodo de la señal
	pass
