extends Spatial
class_name Structure


# base class for all structures, must be instanced inside a StructureContainer class


onready var container = get_parent()
onready var voxelmap = container.get_node(container.voxelmap_path)


# example dictionary for structure dicts that 
# contains data for structure blocks
var _eg_dict = {
	"height": 1, # height, widthx and widthy
	"widthx": 1, # must be at least 1 or
	"widthz": 1, # they won't appear
	"top": 0,
	"left": 0,
	"forward": 0,
	"block": 0
}


# builds the dict
func build(dict):
	var pos = voxelmap.world_to_map(global_transform.origin)
	
	for x in dict["widthx"]:
		for y in dict["height"]:
			for z in dict["widthz"]:

				voxelmap.set_cell_item(
					pos.x + x + dict["left"],
					pos.y + y + dict["top"],
					pos.z + z + dict["forward"],
					dict["block"]
					)
