extends Area2D
class_name ImpactZone




func _on_area_entered(area: Area2D) -> void:
	if area is RadarObject:
		if area.plane_type == RadarObjectTypes.type.ENEMY_ALM or\
			area.plane_type == RadarObjectTypes.type.ENEMY_HYPERSONIC:
				if TimeManager.game_timer < 770:
					EndingManager.play_ending.emit("Failed_Defense")
				else:
					EndingManager.play_ending.emit("Final_Attack_No_Nuke")
