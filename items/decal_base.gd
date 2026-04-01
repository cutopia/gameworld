# Base script for decal items (stick to surfaces, no physics)
extends Sprite2D

# Decal properties
var item_type = "decal"
var surface_position: Vector2
var rotation_offset = 0.0
var scale_factor = 1.0

func _ready():
    # Setup basic decal properties
    set_process(true)

func place_at(position: Vector2, surface: String = "floor"):
    # Position the decal at the given coordinates
    position = position
    
    # Adjust based on surface type
    match surface:
        "wall":
            # Wall placement logic (vertical orientation)
            rotation = PI / 2
        "ceiling":
            # Ceiling placement logic (upside down)
            rotation = PI
        _:
            # Floor is default (no rotation needed)
            rotation = 0.0
    
    surface_position = position

func set_rotation(angle: float):
    rotation_offset = angle
    rotation = rotation_offset

func set_scale(scale: Vector2):
    scale_factor = scale.x
    self.scale = scale
