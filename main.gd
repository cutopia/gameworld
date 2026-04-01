# Main script for the dollhouse game
extends Node2D

@onready var room = $Room
@onready var ui_panel = $UIPanel

func _ready():
    # Initialize the game
    print("Dollhouse Game initialized")
    
    # Setup input handling
    setup_input()
    
    # Load any saved room data
    load_room_data()

func _process(delta):
    # Handle rotation if needed
    pass

func setup_input():
    # Input actions are configured in project settings
    # We'll use "rotate_left" and "rotate_right" actions
    pass

func load_room_data():
    # TODO: Load room from database
    print("Loading room data...")

func save_room_data():
    # TODO: Save current room state to database
    print("Saving room data...")
