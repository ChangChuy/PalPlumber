extends CharacterBody2D


const SPEED = 300
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY
	else: 
		if Input.is_action_just_released("jump") and velocity.y < JUMP_VELOCITY/2:
			velocity.y = JUMP_VELOCITY/2
			
	var direction = Input.get_axis("move_left","move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		#resetting it back to zero when no button was pressed. 
		velocity.x = 0

	if velocity.length() <= 0.0:
		%HappyBoo.play_idle_animation()
	else: 
		%HappyBoo.play_walk_animation()
	
	move_and_slide()

func apply_gravity():
	pass
