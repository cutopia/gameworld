# UI script for item palette (selection of items to place in room)
extends Control

@onready var item_list = $ItemList
var selected_item_type = ""

func _ready():
    # Populate the item list with available items
    populate_item_list()
    
    # Connect item selection signal
    item_list.item_selected.connect(on_item_selected)

func populate_item_list():
    # Add placeholder items - in final version, load from database or resource folder
    item_list.add_item("Furniture", "res://items/furniture.png")
    item_list.add_item("Decorations", "res://items/decorations.png")
    item_list.add_item("Plants", "res://items/plants.png")

func on_item_selected(index):
    selected_item_type = item_list.get_item_text(index)
    print(f"Selected item type: {selected_item_type}")

func get_selected_item():
    return selected_item_type
