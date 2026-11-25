class_name PlayerInventory
extends Node

var inventory_ui
const MAX_SLOTS = 5
var inventory_array: Array[Item] = [null, null, null, null, null]


func add_item(item: Item) -> bool:
	for i in inventory_array.size():
		if inventory_array[i] == null:
			inventory_array[i] = item
			#update the inventory hotbar when a new item gets added
			inventory_ui.update_inventory(i,item.item_ID)
			return true
	print("inventory is full") 
	return false
		
	
func drop_item(index: int, player_position: Vector2) -> void:
	var item = inventory_array[index]
	if(inventory_array[index] != null):
		inventory_array[index] = null
	#remove the icon from the hotbar
	inventory_ui.remove_texture(index)
	var item_scene = load(item.path_to_scene) as PackedScene
	if(item_scene == null):
		return
	
	var item_spawn = item_scene.instantiate()
	#add offset so player does no immediately pick up the item
	item_spawn.global_position = player_position + Vector2(0,-150)
	get_tree().current_scene.add_child(item_spawn)
		

func throw_item(index: int, player_position: Vector2) -> void:
	pass
	
