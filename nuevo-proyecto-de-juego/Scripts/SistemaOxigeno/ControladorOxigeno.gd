extends Control

const MINUTOS_INICIALES = 5
const SEGUNDOS_INICIALES = 0

var minutos = 5
var segundos = 0

var totalTime;
var tiempoTranscurrido = 0 
var temporizador;

signal derrota
signal reiniciar_nivel

func _ready():
	
	totalTime = MINUTOS_INICIALES*60 + SEGUNDOS_INICIALES
	%TextureProgressBar.max_value = totalTime
	temporizador = $DescontarSegundo
	actualizar_tiempo();

func quitar_oxigeno(valorADescontar: int)-> void:
	segundos -= valorADescontar
	tiempoTranscurrido += valorADescontar 
	actualizar_tiempo()

func agregar_oxigeno(valorAAgregar)->void:
	segundos += valorAAgregar
	tiempoTranscurrido -= valorAAgregar
	actualizar_tiempo()
	
func _on_descontar_segundo_timeout() -> void:
	quitar_oxigeno(1)

func actualizar_tiempo():
	if minutos < 0: 
		emit_signal("derrota")
		temporizador.stop()
		$ReiniciarOxigeno.start()
		
	if segundos <= 0:
		minutos -=1 
		segundos = 59
	if segundos >= 60:
		segundos = 0 
		minutos +=1 
	%TextureProgressBar.value = tiempoTranscurrido
	var currentPorcentaje = %TextureProgressBar.value * 100 /%TextureProgressBar.max_value
	var porcentajeAMostrar = 100 - currentPorcentaje
	%Texto.text =  str(roundi(porcentajeAMostrar)) + "%"

	#if segundos < 10  && minutos <10:
		#%Texto.text = "0" + str(minutos) + ":0" + str(segundos)
	#elif segundos >10 && minutos < 10: 
		#%Texto.text = "0" + str(minutos) + ":" + str(segundos)
	#elif segundos < 10 && minutos > 10:
		#%Texto.text = str(minutos) + ":0" + str(segundos)
	#if minutos < 0:
		#%Texto.text = "00:00" 
	#else: 
		#%Texto.text = str(minutos) + ":" + str(segundos)
	#


func _on_main_character_consumir_oxigeno(oxigenoUtilizado: int) -> void:
	quitar_oxigeno(oxigenoUtilizado)
	pass # Replace with function body.

func _on_main_character_recuperar_oxigeno(oxigenoRecuperado: int) -> void:
	agregar_oxigeno(oxigenoRecuperado)
	pass # Replace with function body.


func _on_reiniciar_oxigeno_timeout() -> void:
	emit_signal("reiniciar_nivel")
	segundos = SEGUNDOS_INICIALES
	minutos = MINUTOS_INICIALES
	tiempoTranscurrido  = 0
	%TextureProgressBar.value = 0 
	temporizador.start()
	pass # Replace with function body.
