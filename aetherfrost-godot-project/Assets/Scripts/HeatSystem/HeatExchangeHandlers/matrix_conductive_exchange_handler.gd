## class handling the exchange of heat in a matrix of tiles
## each physics update makes each tile exchange heat through a ConductiveHeatExchanger with each 4 adjacent tiles, only once for each pair

class_name MatrixConductiveExchangeHandler
extends Node

# private variables
@export var matrix_source :ThermalTileMatrixInstantiator

var _heat_exchanger :BaseHeatExchanger
#ENDOF private variables

# node lifecycle
func _ready() -> void:
	_heat_exchanger = ConductiveHeatExchanger.new()
#ENDOF node lifecycle

# private functions
func _physics_process(deltaTime: float) -> void:
	if not matrix_source:
		push_error ("[!!] MatrixConductiveExchangeHandler matrix_source is null!!")
		return
	
	matrix_source.matrix.adjacent_pairs( #change to matrix_source.thermal_entity_matrix
		func(entity_A: ThermalEntity, entity_B: ThermalEntity):
			_heat_exchanger.exchange_heat(entity_A, entity_B, deltaTime))
#ENDOF private functions
