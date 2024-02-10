extends Node2D

@export var next_level: PackedScene
var discrepencyTime = 0.00

func _ready(): 
	start_countdown()
	Events.HUD.connect(show_hud)

func _process(delta):
	%TimerDisplay.text = str((Time.get_ticks_msec() - discrepencyTime)/1000)
	
func start_countdown():
	#pause game 
	#play animation
	#resume game 
	get_tree().paused = true
	%AnimationPlayer.play("countdownAnimation")
	await %AnimationPlayer.animation_finished
	get_tree().paused = false
	discrepencyTime = Time.get_ticks_msec()
	
	
func show_hud():
	%HUD.show()
	if not next_level is PackedScene: 
		%HUD.next_level_button.text = "Victory"
		next_level = load("res://victory_display.tscn")
	get_tree().paused = true
	%HUD.restart_button.grab_focus()

	
func _on_hud_next_level():
	await LevelTransition.fade_to_black()
	get_tree().change_scene_to_packed(next_level)
	get_tree().paused = false
	LevelTransition.fade_to_bright()

func _on_hud_retry():
	await LevelTransition.fade_to_black()
	get_tree().paused = false
	get_tree().change_scene_to_file(scene_file_path)
