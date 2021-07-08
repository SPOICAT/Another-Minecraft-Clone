extends Structure
class_name WaterStructure


onready var water_base = strc.new()


func _ready():
		
	set_strc_values(water_base, 1, 1, 1, 0, 0, 0, voxelmap.WATER)
	build(water_base)
	
