extends Node2D

@onready var inventoryUI = $InventorySlots
@onready var inventory_slots = inventoryUI.get_children();

@onready var player = get_tree().get_first_node_in_group("player")
@onready var inventory = player.get_node("Inventory")


func update_inventory(index) -> void:
	var current_slot = inventory_slots[index]
	var texture_rect = current_slot.get_node("TextureRect")
	if(inventory.inventory_array[index] != null):
		texture_rect.texture = inventory.inventory_array[index].icon
	else:
		texture_rect.texture = null

func remove_texture(index) -> void:
	var current_slot = inventory_slots[index]
	var texture_rect = current_slot.get_node("TextureRect")
	texture_rect.texture = null

func select_item(index) -> void:
	for i in range(inventory_slots.size()):
		var highlight = inventory_slots[i].get_node("Highlight")
		highlight.visible = (i == index)
	

func _ready() -> void:
	inventory.inventory_ui = self
	
