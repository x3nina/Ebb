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
			inventory_ui.update_inventory(i)
			return true
	print("inventory is full") 
	return false
		
	
func drop_item(index: int) -> void:
	if(inventory_array[index] != null):
		inventory_array[index] = null
		#remove the icon from the hotbar
		inventory_ui.remove_texture(index)
	
