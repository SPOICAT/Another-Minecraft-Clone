extends Structure
class_name TreeStructure

onready var WOOD = voxelmap.WOOD
onready var LEAF = voxelmap.LEAF


var tree_log = {
	"height": 6,
	"left": 1,
	"forward": 1,
	"top": 0,
}

var tree_head = {
	"height": 3,
	"width": 3,
	"top": 5,
}

func _ready():
	if !is_container:
		var pos = voxelmap.world_to_map(global_transform.origin)

		do_logs(pos)
		do_head(pos)


func do_logs(pos):
	for y in tree_log["height"]:
		voxelmap.set_cell_item(
				pos.x + tree_log["left"],
				pos.y + y,
				pos.z + tree_log["forward"],
				WOOD
			)


func do_head(pos):
	for x in tree_head["width"]:
		for y in tree_head["height"]:
			for z in tree_head["width"]:
				voxelmap.set_cell_item(
					pos.x + x,
					pos.y + y + tree_head["top"],
					pos.z + z,
					LEAF
				)
