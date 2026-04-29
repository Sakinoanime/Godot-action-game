extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Retrieve the default gravity from your Project Settings.
# This ensures consistency across your game.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# 1. Declare a signal that passes the speed as a float
signal speed_updated(current_speed: float)


func _physics_process(delta):
	
	
	
	# 1. Apply Gravity
	if not is_on_floor():
		# Multiply gravity by delta to make it frame-rate independent
		velocity.y += gravity * delta

	# 2. Handle Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		# Set velocity instantly to move upwards
		velocity.y = JUMP_VELOCITY

	# 3. Horizontal Movement
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)



	# 4. Apply the Movement
	move_and_slide()
	

	


  
