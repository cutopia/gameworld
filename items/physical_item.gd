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

func _process(delta):
    # Check if item is on a surface (floor at bottom of screen)
    if position.y > 500:  # Assuming room height ~500px
        position.y = 500
        velocity.y = 0

func check_collisions():
    # Simple AABB collision detection
    var item_rect = Rect2(position - Vector2(32, 32), Vector2(64, 64))
    
    for other_item in get_tree().get_nodes_in_group("physical_items"):
        if other_item != self:
            var other_rect = Rect2(other_item.position - Vector2(32, 32), Vector2(64, 64))
            
            if item_rect.intersects(other_rect):
                # Push items apart
                var overlap = 10.0
                position.x += overlap
                velocity.y *= -BOUNCE
