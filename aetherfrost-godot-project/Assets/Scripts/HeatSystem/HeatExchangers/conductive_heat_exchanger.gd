class_name ConductiveHeatExchanger
extends BaseHeatExchanger

# inherited method overrides
func exchange_heat (entity_A :ThermalEntity, entity_B :ThermalEntity, delta_time :float) -> float:
	if not entity_A or not entity_B:
		push_error ("[!!] ConductiveHeatExchanger.exchange_heat(a,b) entity_A AND entity_B are required!!")
		return 0.0
	
	#calculate energy transfered in joules and notify each entity of added/substracted energy
	var delta_temperature :float = entity_A.kelvin - entity_B.kelvin
	var conductivity_factor :float = entity_A.conductivity_factor * entity_B.conductivity_factor
	
	var energy_transfer :float = delta_time * delta_temperature * conductivity_factor
	entity_A.add_energy(-energy_transfer)
	entity_B.add_energy(energy_transfer)
	
	return energy_transfer
#ENDOF overrides
