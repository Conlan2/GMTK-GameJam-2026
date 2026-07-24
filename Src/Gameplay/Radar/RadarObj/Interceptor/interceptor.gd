extends RadarObject
class_name Interceptor

var is_locked_on: bool = false

func _on_lock_on_area_entered(area: Area2D) -> void:
	if is_locked_on:
		return
	
	if area is RadarObject and area is not Interceptor:
		movement_angle_deg = rad_to_deg(position.angle_to(area.position)) - 90
		movement_speed = movement_speed * 2
		_update_move_vector()
		is_locked_on = true
