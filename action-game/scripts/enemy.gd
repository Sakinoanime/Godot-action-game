extends CharacterBody2D

var speed = 100.0
var direction = 1
var player = null

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"): # Make sure your Player is in the "player" group
		player = body

func _physics_process(delta):
	# Apply horizontal movement
	velocity.x = speed * direction
	
	if not is_on_floor():
		# Multiply gravity by delta to make it frame-rate independent
		velocity.y += gravity * delta
	
	# Basic wall detection: flip direction if hitting a wall
	if is_on_wall():
		direction *= -1
		$Sprite2D.flip_h = direction < 0
	
	if player:
		# Calculate direction toward player
		var dir = (player.global_position - global_position).normalized()
		velocity = dir * speed
	else:
		velocity.x = speed * direction
	
	# Move and slide handles collisions automatically
	move_and_slide()


func _on_vision_body_entered(body: Node2D) -> void:

	if body.is_in_group("player"): # Make sure your Player is in the "player" group
		player = body
		print("player entered")

	
