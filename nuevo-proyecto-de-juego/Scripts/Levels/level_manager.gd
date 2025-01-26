extends Node2D

var restosMC = preload("res://Scripts/MC/restos_mc.tscn")
var mc

func _ready() -> void:
	mc = $MainCharacter
	
func crearNuevoCuerpo() -> void: 
	var nuevosRestos = restosMC.instantiate()
	nuevosRestos.position = mc.position
	get_tree().root.add_child(nuevosRestos)

func _on_sistema_de_oxigeno_derrota() -> void:
	crearNuevoCuerpo()
	pass

func reiniciar_nivel() -> void:
	$MainCharacter.global_position = $SpawnMC.global_position
	$MainCharacter.reiniciar()
	


func _on_sistema_de_oxigeno_reiniciar_nivel() -> void:
	reiniciar_nivel()
	pass # Replace with function body.
