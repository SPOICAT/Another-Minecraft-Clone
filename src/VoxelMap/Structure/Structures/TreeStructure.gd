extends Structure
class_name TreeStructure


onready var tree_base_dict = {
	"height": 5,
	"widthx": 1,
	"widthz": 1,
	"top": 0,
	"left": 0,
	"forward": 0,
	"block": voxelmap.WOOD
}

onready var tree_head_dict = {
	"height": 3,
	"widthx": 3,
	"widthz": 3,
	"top": 4,
	"left": -1,
	"forward": -1,
	"block": voxelmap.LEAF
}


func _ready():
	build(tree_base_dict)
	build(tree_head_dict)
