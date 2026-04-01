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
        # Move item
        item.position += item.velocity * delta
        
        # Check for collisions with surfaces and other items
        check_collisions(item)
        
        # Apply friction when on surface
        if is_on_surface(item):
            item.velocity.x *= FRICTION

func is_on_surface(item):
    # Check if item is resting on floor (y position near bottom of room)
    # or on top of another item
    return false  # Placeholder - implement collision detection

func check_collisions(item):
    # Simple AABB collision detection
    var item_rect = Rect2(item.position - item.size/2, item.size)
    
    for other_item in physical_items:
        if item != other_item:
            var other_rect = Rect2(other_item.position - other_item.size/2, other_item.size)
            
            if item_rect.intersects(other_rect):
                handle_collision(item, other_item)

func handle_collision(item1, item2):
    # Simple collision response
    # Push items apart and reduce velocity
    var overlap = 10.0  # pixels to separate
    item1.position.x += overlap
    item1.velocity.y *= -BOUNCE
