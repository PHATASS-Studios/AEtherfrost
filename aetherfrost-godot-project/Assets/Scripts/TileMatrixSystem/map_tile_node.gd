## Root node for a map tile
## Contains references to other tile component objects
## This is meant to contain NO LOGIC - any relevant logic should be implemented in another class and linked from this entity

class_name MapTileNode
extends Node2D

# export variables
@export var _terrain : TerrainType
var terrain :TerrainType:
	get:
		return _terrain
	#set (value):
	#	_set_terrain_type (value)

@export var _thermal_entity : ThermalEntity
var thermal_entity :ThermalEntity:
	get:
		return _thermal_entity
#ENDOF export variables

# public functions
func set_terrain_type (value :TerrainType):
	_set_terrain_type (value)
#ENDOF public functions

# private functions
func _set_terrain_type (value :TerrainType):
	_terrain = value
	# [TO-DO]: trigger other updates as necessary for terrain full change?
#ENDOF private functions
