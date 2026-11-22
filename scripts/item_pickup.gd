extends Area2D
@export var item: Item



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
