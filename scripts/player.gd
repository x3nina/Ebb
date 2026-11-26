extends CharacterBody2D

const SPEED = 400.0
var last_direction = 0
var selected_slot = 0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var inventory = get_node("Inventory")
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
		# flip sprite left & right
		if direction.x != 0:
			last_direction = direction.x
		animated_sprite.flip_h = last_direction < 0
		animated_sprite.play("moving")
		
	
	velocity = direction * SPEED

	move_and_slide()
	
#handle player input (maybe Inputmap, i dont understand it currenlty and i'm to lazy too read it)
func _input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		var inventory_ui = get_tree().get_first_node_in_group("inventoryUI")
		if event.keycode == KEY_1:
			selected_slot = 0
		if event.keycode == KEY_2:
			selected_slot = 1
		if event.keycode == KEY_3:
			selected_slot = 2
		if event.keycode == KEY_4:
			selected_slot = 3
		if event.keycode == KEY_5:
			selected_slot = 4
		inventory_ui.select_item(selected_slot);
		if event.keycode == KEY_G:
			#ignore input, if slot is null, otherwise game will go boom :(
			if(inventory.inventory_array[selected_slot] != null):
				inventory.drop_item(selected_slot,global_position)
				print("drop item")
		if event.keycode == KEY_Q:
			var mouse_position = get_global_mouse_position()
			#ignore input, if slot is null, otherwise game will go boom :(
			if(inventory.inventory_array[selected_slot] != null):
				inventory.throw_item(selected_slot,global_position,mouse_position);
			
