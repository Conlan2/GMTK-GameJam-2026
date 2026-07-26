extends RadarSpawner

@onready var timer: Timer = $Timer



func _on_timer_timeout() -> void:
	PlaneSpawner.spawn.emit(RadarObjectTypes.type.ENEMY_HYPERSONIC_ENDING,
	name,
	"NUCLEAR MISSILE")
	timer.start(5)
