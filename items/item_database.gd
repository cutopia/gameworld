# Item registry for managing available items in the game
extends Node

var item_registry = {}

func _ready():
    register_default_items()

func register_item(name: String, sprite_path: String, item_type: String, 
                   size: Vector2 = Vector2(64, 64), properties = {}) -> int:
    var item_id = item_registry.size()
    
    item_registry[item_id] = {
        "name": name,
        "sprite_path": sprite_path,
        "item_type": item_type,
        "size": size,
        "properties": properties
    }
    
    return item_id

func register_default_items():
    # Register some default furniture items
    register_item("Chair", "res://items/chair.png", "physical", Vector2(40, 60))
    register_item("Table", "res://items/table.png", "physical", Vector2(80, 80))
    register_item("Plant", "res://items/plant.png", "physical", Vector2(30, 80))
    register_item("Picture Frame", "res://items/frame.png", "decal", Vector2(60, 40))
    register_item("Rug", "res://items/rug.png", "decal", Vector2(100, 60))

func get_item(item_id: int):
    return item_registry.get(item_id)

func get_all_items():
    return item_registry

func get_items_by_type(item_type: String) -> Array:
    var filtered = []
    for item_id in item_registry:
        if item_registry[item_id].item_type == item_type:
            filtered.append(item_registry[item_id])
    return filtered
