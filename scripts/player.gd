extends CharacterBody2D

const SPEED = 400.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")

	if direction == Vector2.ZERO:
		animated_sprite.play("idle")
	elif direction.x > 0:
		animated_sprite.play("walk_right")
	elif direction.x < 0:
		animated_sprite.play("walk_left")
	elif direction.y > 0:
		animated_sprite.play("walk_down")
	else:
		animated_sprite.play("walk_up")

	velocity = direction * SPEED
	move_and_slide()
