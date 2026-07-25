extends RadarObject



func _special_ready() -> void:
	movement_angle_deg = rad_to_deg((position).angle())-90
	_update_move_vector()
	

	
	


func _on_timer_timeout() -> void:
	_delete_self()
