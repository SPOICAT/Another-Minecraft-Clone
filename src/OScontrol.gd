extends Node
class_name OScontrol


export var captured_mouse : bool = true


func _input(_event):
	if Input.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen


func _ready():
	if captured_mouse:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
