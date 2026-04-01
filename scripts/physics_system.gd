# Physics system for handling gravity and collisions in the dollhouse
extends Node

# Physics constants
const GRAVITY = 980.0  # pixels per second squared
const FRICTION = 0.8
const BOUNCE = 0.1

var physical_items = []

func _ready():
    set_process(true)

func _process(delta):
    apply_physics(delta)

func add_physical_item(item):
    if not item in physical_items:
        physical_items.append(item)

func remove_physical_item(item):
    if item in physical_items:
        physical_items.erase(item)

func apply_physics(delta):
    for item in physical_items:
        # Apply gravity
        item.velocity.y += GRAVITY
        item.position += item.velocity * delta
        
        # Check if item is on a surface (floor at bottom of screen)
        if item.position.y > 500:  # Assuming room height ~500px
            item.position.y = 500
            item.velocity.y = 0

func check_collisions(item):
    # Simple AABB collision detection
    var item_rect = Rect2(item.position - Vector2(32, 32), Vector2(64, 64))
    
    for other_item in physical_items:
        if item != other_item:
            var other_rect = Rect2(other_item.position - Vector2(32, 32), Vector2(64, 64))
            
            if item_rect.intersects(other_rect):
                # Push items apart
                var overlap = 10.0
                item.position.x += overlap
                item.velocity.y *= -BOUNCE
