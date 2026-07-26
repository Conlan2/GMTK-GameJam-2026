extends RadarObject

var track_base: bool = true

func _special_ready() -> void:
	if !track_base:
		return
	movement_angle_deg = rad_to_deg((position).angle())-90
	_update_move_vector()
	

	
	
