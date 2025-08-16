class_name ThermalTileMatrixInstantiator
extends Node

# signals emitted
signal thermal_tile_matrix_instantiated (matrix :ThermalEntity2DMatrix)
#ENDOF signals emitted

#public variables
var matrix : ThermalEntity2DMatrix:
	get:
		if not matrix:
			push_warning ("[!!] ThermalTileMatrixInstantiator.matrix.get() _matrix not initialized yet!!")
		return _matrix
var _matrix : ThermalEntity2DMatrix = null
#ENDOF public variables

# private variables
@export_group("Instantiation settings")

@export var _sample_tile : PackedScene

#tiles instantiated will be instantiated as children of this node
@export var _parent_node : Node

@export var _instantiate_on_init : bool = true

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
func _init ():
	if _instantiate_on_init:
		_instantiate_matrix()
#ENDOF Node lifecycle

# private functions
func _instantiate_matrix ():
	_matrix = ThermalEntity2DMatrix.new(_columns, _rows)
	push_warning (_sample_tile)
	
	for y in _rows:
		for x in _columns:
			var new_tile : ThermalEntity = _sample_tile.instantiate() as ThermalEntity
			if not new_tile:
				assert(false, "[!!] ThermalTileMatrixInstantiator._instantiate_matrix(): _sample_tile MUST be a ThermalEntity node!!")
				return
			_matrix.set_position(x, y, new_tile)
#ENDOF functions
