extends Node
class_name OScontrol


func _input(_event):
	if Input.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
