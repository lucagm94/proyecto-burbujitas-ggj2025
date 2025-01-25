extends Control

func _on_play_button_up():
	get_tree().change_scene_to_file("res://Scenes/Levels/prueba_tileset.tscn")
	pass 

func _on_exit_button_up():
	get_tree().quit()
	pass 
