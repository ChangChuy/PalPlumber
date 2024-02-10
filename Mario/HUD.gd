extends ColorRect


signal retry()
signal next_level()

@onready var restart_button = %RestartButton
@onready var next_level_button = %NextLevelButton

func _on_restart_button_pressed():
	retry.emit()

func _on_next_level_button_pressed():
	next_level.emit()
 
