# Room manager for handling room creation, loading, and management
extends Node

var current_room = null
var rooms = {}

@onready var database = $DatabaseManager
@onready var physics = $PhysicsSystem

func _ready():
    load_all_rooms()

func create_new_id)
        return false
    
    current_room = room_id
    
    # Load items for this room
    var items = database.load_room_items(room_id)
    
    # Add items to the room scene
    for item_data in items:
        spawn_item_from_data(item_data)
    
    print("Loaded room:", room_data["name"])
    return true

func save_current_room():
    if not current_room:
        print("No room currently loaded")
        return false
    
    # Save all items in current room to database
    # This would iterate through room items and call database.save_item()
    
    print("Saved room:", current_room)
    return true

func delete_room(room_id: int):
    if database.delete_room(room_id):
        rooms.erase(room_id)
        if current_room == room_id:
            current_room = null
        print("Deleted room:", room_id)

func spawn_item_from_data(item_data: Dictionary):
    # Create item based on saved data
    var item_type = item_data.item_type
    
    match item_type:
        "decal":
            # Spawn decal item
            pass
        "physical":
            # Spawn physical item with physics
            pass
