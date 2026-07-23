extends Marker2D
class_name RadarSpawner


@export var rotation_deviation: float = 0

signal Spawn_Radar_Object(object: RadarObject)


func _ready() -> void:
	Spawn_Radar_Object.connect(_spawn_object)

func _spawn_object(object: RadarObject):
	object.position = position
	object.movement_angle_deg = rotation_degrees + (randf()-0.5) * 2 * rotation_deviation
	
	get_parent().add_child(object)
