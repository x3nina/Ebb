#basicly kinda a DB for item icons, so the inventory can then just read from here, instead of checking every time an item is picked up

extends Node
var _icons: Dictionary = {}
const ITEM_SPRITESHEET = preload("res://assets/items_sprite.png")


func register(item_ID: int, texture: Texture2D, region: Rect2) -> void:
	_icons[item_ID] = {"spriteTexture": texture, "region": region}

func register_from_sprite(item_ID: int, sprite: Sprite2D) -> void:
	register(item_ID, sprite.texture, sprite.region_rect)
	
func get_icon(item_ID: int) -> Texture2D:
	var item_at = AtlasTexture.new()
	item_at.atlas = ITEM_SPRITESHEET
	var icon_region = _icons[item_ID].region
	item_at.region = icon_region
	item_at.filter_clip = true
	return item_at
	
