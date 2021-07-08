extends Structure
class_name TreeStructure


onready var tree_base = strc.new()
onready var tree_head = strc.new()


func _ready():
	set_strc_values(tree_base, 5, 1, 1, 0, 0, 0, voxelmap.WOOD)
	set_strc_values(tree_head, 3, 3, 3, 4, -1, -1, voxelmap.LEAF)
	build(tree_base)
	build(tree_head)
