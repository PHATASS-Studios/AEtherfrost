## Class representing a 2D matrix of MapTileNode elements
## Uses a simple 1D array to simulate a 2D matrix
## SIZE CAN ONLY BE SET ON CONSTRUCTION/INITIALIZATION

## Contains methods to access and iterate over each MapTileRoot and over each corresponding map tile entity

class_name MapTileMatrix
extends Node

# public properties
# X dimension
var width :int :
	get:
		return _width
	#implement a set in the future? it's complicated
var _width :int = 0

# Y dimension
var height :int :
	get:
		return _height
	#implement a set in the future? it's complicated
var _height :int = 0
#ENDOF public properties

# public methods
# fetches and returns MapTileRoot at position X, Y
func get_position (x :int, y :int) -> MapTileNode:
	return _get_position(x, y)	
	
# sets given position value
func set_position (x :int, y :int, value: MapTileNode):
	_set_position(x, y, value)

# iterate over each pair of adjacent (vertical and horizontal only) MapTileNode
# executes given callback passing both MapTileNode for each pair
func adjacent_pairs (callback :Callable):
	_adjacent_pairs (callback)

# same as adjacent_pairs, but accesses directly each tile's ThermalEntity
#func adjacent_pairs_thermal_entities (callback :Callable):
#	_adjacent_pairs_thermal_entities (callback)
#ENDOF public methods

# private variables
var _internal_array : Array[ThermalEntity] = []
#ENDOF private variables

# constructor
func _init (width_param :int, height_param :int):
	_initialize_array_size(width_param, height_param)
#ENDOF constructor

# private functions
# initializes dimensions and internal array size to given parameters. 
func _initialize_array_size (width_param :int, height_param :int) -> void:
	_width = width_param
	_height = height_param
	_internal_array = []
	_internal_array.resize(_width * _height)

# fetches and returns entry at position X, Y
func _get_position (x :int, y :int) -> ThermalEntity:
	if not _internal_array:
		push_error ("[!!] ThermalEntity2DMatrix._get_position(x, y): _internal_array not initialized!!")
		return null
	
	if not _is_inside(x,y):
		push_error ("[!!] ThermalEntity2DMatrix._get_position(x,y): x and y must be inside bounds!")
		return null
	
	return _internal_array.get(_2d_index_to_1d(x, y))

# writes value at x, y position
func _set_position (x :int, y :int, value):
	if not _internal_array:
		push_error ("[!!] ThermalEntity2DMatrix._get_position(x, y): _internal_array not initialized!!")
		return
	
	if not _is_inside(x,y):
		push_error ("[!!] ThermalEntity2DMatrix._get_position(x,y): x and y must be inside bounds!")
		return
	
	_internal_array.set(_2d_index_to_1d(x, y), value)

# transforms an X,Y matrix coordinate into the corresponding 1D array index
func _2d_index_to_1d (x :int, y :int) -> int:
	return x + (y * _width)

# calculates if index x,y falls inside of this matrix' bounds
func _is_inside (x: int, y :int):
	if x < 0 or x >= _width or y < 0 or y >= _height:
		return false
	else:
		return true

# iterate over each pair of adjacent (vertical and horizontal only) tiles
# executes given callback passing both tiles for each
func _adjacent_pairs (callback :Callable):
	for y :int in _height:
		for x :int in _width:
			_tile_pairs (x, y, callback)

# tries to execute given callback for given tile and 2 neighbors to avoid duplicate pairs
func _tile_pairs (x :int, y :int, callback :Callable):
	var center : ThermalEntity = _get_position(x, y)
	if x < (_width-1):
		callback.call (center, _get_position(x+1, y))
	if y < (_height-1):
		callback.call (center, _get_position(x, y+1))
#ENDOF private functions

