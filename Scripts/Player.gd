extends CharacterBody2D

var speed = 250
var rocketScene = preload("res://Scenes/rocket.tscn")
@onready var rocketContainer = $RocketContainer # get_node("RocketContainer")
@onready var screenSize = get_viewport_rect().size

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		Shoot()

func _physics_process(delta):
	velocity = Vector2(0,0)
	
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	move_and_slide()

	
	global_position = global_position.clamp(Vector2(0,0), screenSize)

func Shoot():
	var rocketInstance = rocketScene.instantiate()
	rocketContainer.add_child(rocketInstance)
	rocketInstance.global_position = global_position
	rocketInstance.global_position.x += 65
	
