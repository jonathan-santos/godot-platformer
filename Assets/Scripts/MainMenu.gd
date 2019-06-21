extends Control

func _on_Play_pressed():
	get_tree().change_scene("res://Assets/Stages/Stage1.tscn")
	pass

func _on_Quit_pressed():
	get_tree().quit()
	pass