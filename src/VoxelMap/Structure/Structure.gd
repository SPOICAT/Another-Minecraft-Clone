extends Spatial
class_name Structure


# base class for all structures, must be instanced inside a StructureContainer class


onready var container = get_parent()
onready var voxelmap = container.get_node(container.voxelmap_path)


onready var pos = voxelmap.world_to_map(global_transform.origin)


var used_blocks : Array = []



# strc short for structure
# contains blocks data to be built
class strc:
	var height = 1;
	var widthx = 1;
	var widthz = 1;
	var top = 0;
	var left = 0;
	var forward = 0;
	var block = null;


func set_strc_values(strc_, height, widthx, widthz, top, left, forward, block):
	strc_.height = height
	strc_.widthx = widthx
	strc_.widthz = widthz
	strc_.top = top
	strc_.left = left
	strc_.forward = forward
	strc_.block = block


# builds the strc
func build(strc_):
	if strc_.block != null:
		var pos = voxelmap.world_to_map(global_transform.origin)
		
		for x in strc_.widthx:
			for y in strc_.height:
				for z in strc_.widthz:

					var the_block = [
						pos.x + x + strc_.left,
						pos.y + y + strc_.top,
						pos.z + z + strc_.forward,
						strc_.block
					]
					
					voxelmap.set_cell_item(
						the_block[0],
						the_block[1],
						the_block[2],
						the_block[3]
						)
						
					used_blocks.append(the_block)
					

