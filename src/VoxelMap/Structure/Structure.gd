extends Spatial
class_name Structure


# base class for all structures, must be instanced inside a StructureContainer class


onready var container = get_parent()
onready var voxelmap = container.get_node(container.voxelmap_path)
