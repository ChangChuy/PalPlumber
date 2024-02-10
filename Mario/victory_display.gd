extends CenterContainer

func _ready():
	LevelTransition.fade_to_bright()
	%MenuButton.grab_focus()
	
 
func _on_button_pressed(): 
	get_tree().change_scene_to_file("res://start_menu.tscn")
