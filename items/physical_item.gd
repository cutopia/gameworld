# Base script for physical items with gravity and collision
extends RigidBody2D

# Physical item properties
var item_type = "physical"
var is_stacked = false
var stack_height_offset = 0.0

# Physics properties
var gravity_strength = 980.0  # pixels per second squared
var friction = 0.8
var bounce = 0.1

func _ready():
    # Setup physical properties
    set_gravity_scale(gravity_strength / 980.0)
    set_friction(friction)
    set_bounce(bounce)
    
    # Add collision shape if not present
    if get_child_count() == 0:
        create_collision_shape()

func _process(delta):
    # Check if item is on a surface
    if is_on_floor():
        stack_height_offset = 0.0
        is_stacked = false

func place_at(position: Vector2):
    position = position
    linear_velocity = Vector2(0, 0)
    angular_velocity = 0

func create_collision_shape():
    # Create a simple rectangular collision shape
    var collision_shape = CollisionShape2D.new()
    var shape = RectangleShape2D.new()
    shape.size = Vector2(64, 64)  # Default size
    collision_shape.shape = shape
    add_child(collision_shape)

func set_size(width: float, height: float):
    # Update collision shape size
    for child in get_children():
        if child is CollisionShape2D:
            if child.shape is RectangleShape2D:
                child.shape.size = Vector2(width, height)

func add_stack_offset(offset: float):
    stack_height_offset += offset
