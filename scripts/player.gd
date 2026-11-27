extends CharacterBody2D

const SPEED = 400.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Get the input direction from the movement actions (WASD / Arrow keys)
	var direction : Vector2 = Vector2.ZERO
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	
		
	# play animations
	if direction.x == 0 && direction.y == 0:
		animated_sprite.flip_h = false
		animated_sprite.play("idle")
	else:
		if direction.y > 0 && direction.x == 0:
			animated_sprite.play("walk_down")
		elif direction.y < 0 && direction.x == 0:
			animated_sprite.play("walk_up")
		else:
			# flip sprite left & right
			if direction.x > 0:
				animated_sprite.play("walk_right")
			if direction.x < 0:
				animated_sprite.play("walk_left")
		
	
	velocity = direction * SPEED

	move_and_slide()
