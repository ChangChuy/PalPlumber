extends CenterContainer

func _ready():
	%StartGameButton.grab_focus() 
  
func _on_start_game_button_pressed():
	await LevelTransition.fade_to_black()
	get_tree().change_scene_to_file("res://level_one.tscn")
	LevelTransition.fade_to_bright()

func _on_quit_button_pressed():
	get_tree().quit()
