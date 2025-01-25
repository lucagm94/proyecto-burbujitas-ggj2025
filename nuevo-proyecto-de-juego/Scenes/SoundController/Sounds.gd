extends Node

var listaSonidos: Array;
var listaMusica: Array;
var reproduccionActual;
var sfxActual;
func _ready():
	reproduccionActual = $Sfx/BotonInicio
	listaSonidos= $Sfx.get_children()
	listaMusica = $Music.get_children()

func play_sfx(sound: String):
	if sfxActual != null:
		sfxActual.stop()
	for sonido in listaSonidos:
		if sonido.name == sound:
			sfxActual = sonido
			sonido.play()
			break

func play_music(music: String):
	for musica in listaMusica:
		if musica.name == music:
			musica.play()
			reproduccionActual = musica
			break
	
func stop_music():
	reproduccionActual.stop()

func fadeout():
	while reproduccionActual.volume_db > -5:
		reproduccionActual.volume_db -= 1
		await(get_tree().create_timer(0.1).timeout)

#func play_loop_sfx(sfx: String):
func fadein():
	pass
