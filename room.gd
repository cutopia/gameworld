# Room management script
extends Node2D

# Room properties
var room_name = "Default Room"
var background_image: Texture2D
var rotation_angle = 0.0
var rotation_speed = 100.0

@onready var background_sprite = $BackgroundSprite
@onready var items_container = $ItemsContainer

func _ready():
    # Initialize room with default background
    load_default_background()
    
    # Setup input for rotation
    Input.action_press("rotate_left")
    Input.action_press("rotate_right")

func _process(delta):
    handle_rotation(delta)

func handle_rotation(delta):
    # Handle keyboard rotation
    if Input.is_action_pressed("rotate_left"):
        rotate_room(-rotation_speed * delta)
    elif Input.is_action_pressed("rotate_right"):
        rotate_room(rotation_speed * delta)

func rotate_room(amount: float):
    rotation_angle += amount
    
    # Keep rotation within 0-360 degrees
    if rotation_angle >= 360.0:
        rotation_angle -= 360.0
    elif rotation_angle < 0.0:
        rotation_angle += 360.0
    
    # Update background position for scrolling effect
    update_background_position()

func update_background_position():
    # Calculate background offset based on rotation angle
    var offset_x = -rotation_angle * 2  # Adjust multiplier for desired scroll speed
    if background_sprite:
        background_sprite.position.x = offset_x

func load_default_background():
    # Load a default background (placeholder)
    print("Loading default background...")
    # In final implementation, this would load from resources

func add_item(item: Node2D, position: Vector2):
    items_container.add_child(item)
    item.global_position = position
    print(f"Added item at {position}")
