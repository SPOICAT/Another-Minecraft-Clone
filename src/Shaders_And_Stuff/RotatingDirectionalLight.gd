tool
extends DirectionalLight
class_name RotatingDirectionalLight

export var rotate_in_editor : bool = false
export var rotation_ = Vector3()
export var multiplier : float = 1

func _physics_process(delta):
	if Engine.editor_hint:
		if !rotate_in_editor:
			return
	rotation += rotation_ * delta * multiplier
