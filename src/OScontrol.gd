extends Node
class_name OScontrol


export var fullscreen : bool = false


func _ready():
	OS.window_fullscreen = fullscreen
