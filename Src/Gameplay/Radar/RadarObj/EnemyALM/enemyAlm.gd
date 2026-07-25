extends RadarObject



func _special_ready() -> void:
	position.x += (randf()-0.5) * 2 * 20
	position.y += (randf()-0.5) * 2 * 20
	movement_angle_deg = rad_to_deg((position).angle())-90
	_update_move_vector()
	
func check_special_properties() -> void:
	print(movement_angle_deg)
	
	
