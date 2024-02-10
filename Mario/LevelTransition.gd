extends CanvasLayer

@onready var animation_player = $AnimationPlayer

func fade_to_black():
	animation_player.play("fade_to_black")
	await animation_player.animation_finished
	
func fade_to_bright(): 
	animation_player.play("fade_to_bright")
	await animation_player.animation_finished
	

