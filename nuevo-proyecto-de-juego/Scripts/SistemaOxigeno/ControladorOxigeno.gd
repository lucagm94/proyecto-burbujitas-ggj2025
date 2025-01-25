extends Control
var minutos = 5
var segundos = 0
var totalTime;
var tiempoTranscurrido = 0 

func _ready():
	
	totalTime = minutos*60 + segundos
	%TextureProgressBar.max_value = totalTime
	actualizar_tiempo();

func quitar_oxigeno(valorADescontar: int)-> void:
	segundos -= valorADescontar
	tiempoTranscurrido += 1 
	if segundos <= 0:
		minutos -=1 
		segundos = 59
	actualizar_tiempo()

func agregar_oxigeno(valorAAgregar)->void:
	segundos += valorAAgregar
	tiempoTranscurrido -= valorAAgregar
	if segundos >= 60:
		segundos = 0 
		minutos +=1 
	actualizar_tiempo()
	
func _on_descontar_segundo_timeout() -> void:
	quitar_oxigeno(1)

func actualizar_tiempo():
	if segundos < 10  && minutos <10:
		%Texto.text = "0" + str(minutos) + ":0" + str(segundos)
	elif segundos >10 && minutos < 10: 
		%Texto.text = "0" + str(minutos) + ":" + str(segundos)
	elif segundos < 10 && minutos > 10:
		%Texto.text = str(minutos) + ":0" + str(segundos)
	else: 
		%Texto.text = str(minutos) + ":" + str(segundos)
	
	%TextureProgressBar.value = tiempoTranscurrido


func _on_main_character_consumir_oxigeno(oxigenoUtilizado: int) -> void:
	quitar_oxigeno(oxigenoUtilizado)
	pass # Replace with function body.


func _on_main_character_recuperar_oxigeno(oxigenoRecuperado: int) -> void:
	agregar_oxigeno(oxigenoRecuperado)
	pass # Replace with function body.
