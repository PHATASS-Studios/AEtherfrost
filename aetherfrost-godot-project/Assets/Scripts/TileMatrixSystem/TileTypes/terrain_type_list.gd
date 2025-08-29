## Singleton (Autoload) class that hosts a listing of MapTileType objects
## Definitions of terrain map tile types

class_name TerrainTypeList
extends Node

# exports
@export var _list : Array[TerrainType] = []
#ENDOF exports

# public methods
func get (index :int) -> TerrainType:
	return _list[index]
#ENDOF public methods
