extends Structure
class_name TreeStructure


onready var tree_base = strc.new()
onready var tree_head = strc.new()


func _ready():
	
	var base_height = rand_range(4, 8)
	
	set_strc_values(tree_base, base_height, 1, 1, 0, 0, 0, voxelmap.WOOD)
	set_strc_values(tree_head, 3, 3, 3, base_height - 1, -1, -1, voxelmap.LEAF)
	build(tree_base)
	build(tree_head)
