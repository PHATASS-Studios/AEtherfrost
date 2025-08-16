## Class representing a 2D matrix of ThermalEntity elements
## Uses a simple 1D array to simulate a 2D matrix
## SIZE CAN ONLY BE SET ON CONSTRUCTION

class_name ThermalEntity2DMatrix
extends RefCounted

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
# fetches and returns entry at position X, Y
func get_position (x :int, y :int) -> ThermalEntity:
	return _get_position(x, y)	
#ENDOF public methods

# private variables
var _internal_array : Array[ThermalEntity] = []
#ENDOF private variables

# constructor
func _init (width_param :int, height_param :int):
	_initialize_array_size(_width, _height)
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
	
	return _internal_array.get(x + (y * _width))

# calculates if position x,y falls inside of this matrix' bounds
func _is_inside (x: int, y :int):
	if x < 0 or x >= _width or y < 0 or y >= _height:
		return false
	else:
		return true
#ENDOF private functions
