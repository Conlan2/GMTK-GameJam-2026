extends Node3D

@export var is_left: bool = true

@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer



var pushed: bool = false

func _ready() -> void:
	HiddenButtonManager.turn_radar_lock.connect(_radar_listen)
	

	
func _radar_listen(turn_amount: float) -> void:
	var old_state: bool = pushed
	
	if turn_amount < 0 and is_left:
		pushed = true
		timer.start()
		
	if turn_amount > 0 and !is_left:
		pushed = true
		timer.start()
		
	if old_state != pushed:
		animation_player.play("PushDown")

func _on_timer_timeout() -> void:
	pushed = false
	animation_player.play("RealeaseButton")
	
