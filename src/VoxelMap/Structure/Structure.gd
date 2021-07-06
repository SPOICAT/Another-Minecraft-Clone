extends Spatial
class_name Structure

export var is_container : bool = false # if true, acts as a container
# for the children structure classes

export var voxelmap_path : NodePath
onready var voxelmap = get_node(voxelmap_path)

func _ready():
	pass
