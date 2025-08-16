## class handling the exchange of heat in a matrix of tiles
## each physics update makes each tile exchange heat through a ConductiveHeatExchanger with each 4 adjacent tiles, only once for each pair

class_name MatrixConductiveExchangeHandler
extends Node2D


# private variables
#@export var entity_matrix :Array[Array[ThermalEntity]]

var heat_exchanger :BaseHeatExchanger
#ENDOF private variables
