extends Spatial
class_name StructureContainer


# Class to contain structures


export var voxelmap_path : NodePath


var structures = {
    "TreeStructure": preload("res://src/VoxelMap/Structure/Structures/TreeStructure.gd")
}
