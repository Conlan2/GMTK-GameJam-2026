extends RadarObject

var track_base: bool = true

func _special_ready() -> void:
	if track_base:
		movement_angle_deg = rad_to_deg((position).angle())-90
	else:
		movement_angle_deg += (randf()-0.5) * 30
	_update_move_vector()
	

	
	
