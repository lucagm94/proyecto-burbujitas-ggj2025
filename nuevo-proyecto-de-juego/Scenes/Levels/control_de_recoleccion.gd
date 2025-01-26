extends Control

var algasRecolectadas = 0
const ALGAS_A_RECOLECTAR = 3

signal victoria


func _process(delta: float) -> void:
	condicion_de_victoria()
	

func condicion_de_victoria():
	if algasRecolectadas == ALGAS_A_RECOLECTAR:
		emit_signal("victoria")	
		$CartelGanaste.visible = true
		$TxtCartel.visible = true
		

func recolectar_algas(algasRecogidas: int) -> void:
	algasRecolectadas += algasRecogidas
	$CantAlga.text = " x " + str(algasRecolectadas)
	
