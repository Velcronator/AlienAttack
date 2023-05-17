extends Area2D

@export var speed = 10
#@onready var visibleNotifier = $VisibleOnScreenNotifier2D
# alterative way from connecting
#func _ready():
#	visibleNotifier.connect("screen_exited", _onScreenExited)

func _physics_process(delta):
	global_position.x += speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
		queue_free()

#func _onScreenExited():
#	queue_free()
