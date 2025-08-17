class_name ThermalTileMatrixInstantiator
extends Node

# signals emitted
signal thermal_tile_matrix_instantiated (matrix :ThermalEntity2DMatrix)
#ENDOF signals emitted

#public variables
var matrix : ThermalEntity2DMatrix:
	get:
		if not _matrix:
			push_warning ("[!!] ThermalTileMatrixInstantiator.matrix.get() _matrix not initialized yet!!")
		return _matrix
var _matrix : ThermalEntity2DMatrix = null
#ENDOF public variables

# private variables
@export_group("Instantiation settings")

@export var _sample_tile : PackedScene

#tiles instantiated will be instantiated as children of this node
@export var _parent_node : Node

@export var _auto_trigger : bool = true

@export_group("Matrix dimensions")
@export var _columns : int = 8
@export var _rows : int = 8

@export_group("Matrix world position")
@export var _start_x : float = 1
@export var _tile_width : float = 1
@export var _start_y : float = 1
@export var _tile_height : float = 1
#ENDOF private variables

# public functions
func instantiate_matrix ():
	_instantiate_matrix()
#ENDOF public functions

# Node lifecycle
func _ready ():
	if _auto_trigger:
		_instantiate_matrix()
#ENDOF Node lifecycle

# private functions
# Fully initializes a new matrix and instantiates one new entity for each element in the right position, registering a reference to it
func _instantiate_matrix ():
	_matrix = ThermalEntity2DMatrix.new(_columns, _rows)
	
	for y:int in _rows:
		for x:int in _columns:
			var new_tile : ThermalEntity = _new_tile(x, y)
			_matrix.set_position(x, y, new_tile)
	
	thermal_tile_matrix_instantiated.emit(_matrix)


# creates a new tile element at the adequate position for given column and row. Also sets it's ownership and parenthood
func _new_tile (column :int, row :int) -> ThermalEntity:
	var new_tile : ThermalEntity = _sample_tile.instantiate() as ThermalEntity
	if not new_tile:
		assert(false, "[!!] ThermalTileMatrixInstantiator._instantiate_matrix(): _sample_tile MUST be a ThermalEntity node!!")
		return null
	
	_parent_node.call_deferred("add_child", new_tile)
	new_tile.call_deferred("set_owner", _parent_node)
	
	new_tile.position = _tile_position(column, row)
	
	return new_tile

# gets the Vector2 spatial position for given column/row tile
func _tile_position (column :int, row :int) -> Vector2:
	return Vector2(_start_x + (column * _tile_width), _start_y + (row * _tile_height))
#ENDOF functions
