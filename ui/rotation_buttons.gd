# UI script for rotation control buttons
extends Control

@onready var left_button = $LeftButton
@onready var right_button = $RightButton

func _ready():
    # Connect button signals to rotation functions
    left_button.pressed.connect(lambda: Input.action_press("rotate_left"))
    left_button.released.connect(lambda: Input.action_release("rotate_left"))
    
    right_button.pressed.connect(lambda: Input.action_press("rotate_right"))
    right_button.released.connect(lambda: Input.action_release("rotate_right"))

func _process(delta):
    # Update button visual states if needed
    pass
