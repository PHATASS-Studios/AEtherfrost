## https://docs.google.com/document/d/1slyy0lps6qmzA_lbFTpJt6cc3KCcKj0UP3Hpy82bV6A/edit?usp=sharing

#abstract
class_name BaseHeatExchanger
extends RefCounted

#abstract methods

# Calculates heat transferred between two entities for given time
# notifies each of the corresponding entities of their energy change.
# Returns the amount of joules that were transfered
func exchange_heat (entity_A :ThermalEntity, entity_B :ThermalEntity, delta_time :float) -> float:
	push_error ("[!!] ERROR: BaseHeatExchanger.exchange_heat base method called!!")
	return false
#ENDOF abstract methods
