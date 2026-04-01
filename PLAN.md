# Dollhouse Game - Project Plan

## Overview
A Godot 4.5 dollhouse game where players decorate rooms by placing items in a 360° view environment.

## Core Concepts

### Room System
- Each room has a background image (panoramic/360°)
- Player can rotate view using arrow keys or on-screen buttons
- Background scrolling creates the illusion of rotation
- Items placed in room persist with their positions

### Item Types
1. **Decal Items**
   - Stick to walls, floors, or ceilings at placement position
   - No physics interaction
   - Remain fixed relative to surface

2. **Physical Items**
   - Have gravity effect
   - Land on surfaces (floor, other items)
   - Can be stacked/rearranged
   - May have simple collision shapes

### Database Requirements
- Store room definitions
- Track item positions (x, y, z coordinates)
- Store rotation/orientation for each item
- Save/load room configurations

## Technical Implementation

### Project Structure
```
res://
├── main.tscn              # Main scene with UI
├── rooms/
│   ├── room_template.tscn # Base room scene
│   └── room_data/         # Saved room data files
├── items/
│   ├── decal_base.gd      # Decal item script
│   ├── physical_item.gd   # Physical item script
│   └── item_database.gd   # Item registry
├── ui/
│   ├── rotation_buttons.tscn
│   └── item_palette.tscn
└── scripts/
    ├── room_manager.gd
    ├── physics_system.gd
    └── database_manager.gd
```

### Input System
- **Keyboard**: Arrow keys for rotation (left/right)
- **Touch/Mouse**: On-screen buttons for mobile support
- Rotation speed: configurable

### View System
- Camera orbits around room center
- Background image scrolls opposite to rotation direction
- Parallax effect for depth perception
- 360° continuous rotation

### Physics System
- Simple gravity (downward force)
- Collision detection with surfaces
- Item stacking support
- Friction for stability

### Database Schema
```gdscript
# Room table
- room_id: int
- name: string
- background_image: resource_path
- created_at: timestamp

# Items table  
- item_id: int
- room_id: int
- position_x: float
- position_y: float
- position_z: float
- rotation: float
- scale: vector3
- item_type: enum (decal, physical)
- sprite_path: resource_path
```

## Development Phases

### Phase 1: Core Engine
- [ ] Set up Godot 4.5 project
- [ ] Create room scene with background
- [ ] Implement rotation system
- [ ] Add basic UI controls

### Phase 2: Item System
- [ ] Create decal item base class
- [ ] Create physical item base class  
- [ ] Implement placement system
- [ ] Add drag-and-drop interface

### Phase 3: Physics & Collision
- [ ] Implement gravity for physical items
- [ ] Add collision detection
- [ ] Create surface detection (floor/wall/ceiling)
- [ ] Support item stacking

### Phase 4: Database Integration
- [ ] Set up SQLite database
- [ ] Create room save/load system
- [ ] Implement item persistence
- [ ] Add room management UI

### Phase 5: Polish & Features
- [ ] Optimize performance
- [ ] Add sound effects
- [ ] Create item palette UI
- [ ] Test on target platforms

## Future Enhancements
- Multiple rooms with transitions
- Item customization (colors, textures)
- Room themes/presets
- Multiplayer room sharing
- Animation support for items
- Lighting system
- Sound placement in 3D space
