extends Area2D
@export var item: Item
@onready var icon_sprite: Sprite2D = $SpriteIcon

var is_thrown: bool = false;
var throw_speed: float = 600.0
var direction: Vector2 = Vector2.ZERO
#delete item after some time
var timer: float = 0.0
const MAX_THROW_TIME: float = 5.0 

func _ready() -> void:
	ItemIcons.register_from_sprite(item.item_ID,icon_sprite)
#temp most likely will change logic to use RigidBody2D
func throw(towards_position: Vector2) -> void:
	direction = towards_position.normalized()
	is_thrown = true
	#to disable pickup after the item is thrown
	monitoring = false
	await get_tree().create_timer(0.3).timeout
	monitoring = true
	
func _physics_process(delta: float) -> void:
	if not is_thrown:
		return
	position += direction * throw_speed * delta
	timer += delta
	if timer >= MAX_THROW_TIME:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	var status = false
	if body is CharacterBody2D:
		#get the players inventory component
		var inventory = body.get_node("Inventory")
		#need status to determine if an item can be added (if inventory is full we ignore the item)
		status = inventory.add_item(item)
		#print("picked up: " + item.item_name)
	if(status):
		queue_free()
