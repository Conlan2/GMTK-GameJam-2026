extends Area2D
class_name ImpactZone




func _on_area_entered(area: Area2D) -> void:
	if area is RadarObject:
		if area.plane_type == RadarObjectTypes.type.ENEMY_ALM or\
			area.plane_type == RadarObjectTypes.type.ENEMY_HYPERSONIC:
				EndingManager.play_ending.emit("Failed_Defense")
