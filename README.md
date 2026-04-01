# Dollhouse Game - Godot 4.5 2D Project

A dollhouse-style game where players decorate rooms by placing items in a 360° view environment.

## Features

- **Room System**: Rooms with background images that can be rotated 360°
- **Item Types**:
  - Decal Items: Stick to surfaces (walls, floors, ceilings)
  - Physical Items: Have gravity and collide with other objects
- **Database Persistence**: Save/load room configurations using SQLite
- **2D Implementation**: Simple coordinate system with X/Y positioning

## Project Structure

```
res://
├── main.tscn              # Main scene with UI
├── project.godot          # Godot project configuration
├── icon.svg               # Game icon
├── rooms/
│   ├── room_template.tscn # Base room scene template
│   └── room_data/         # Saved room data files
├── items/
│  - rotation: float
- scale_x/y: float
- item_type: enum (decal, physical)
- sprite_path: resource_path

## Development Phases

### Phase 1: Core Engine ✅
- [x] Set up Godot 4.5 project structure
- [ ] Create main scene with UI
- [ ] Implement room system with background scrolling
- [ ] Build rotation controls (keyboard + on-screen buttons)

### Phase 2: Item System
- [ ] Create decal item base class
- [ ] Create physical item base class with gravity
- [ ] Implement item placement system
- [ ] Add drag-and-drop interface

### Phase 3: Database Integration
- [x] Set up SQLite database for room/item persistence
- [ ] Create room save/load system
- [ ] Implement item persistence

### Phase 4: Polish & Features
- [ ] Test and polish the complete game
- [ ] Optimize performance
- [ ] Add sound effects

## Getting Started

1. Open the project in Godot 4.5
2. Configure input actions for "rotate_left" and "rotate_right"
3. Run the main scene to test
