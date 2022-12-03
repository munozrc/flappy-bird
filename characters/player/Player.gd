extends RigidBody2D

export var FLAP_FORCE = -200

const MAX_ROTATION_DEGRESS = -30.0

onready var animator = $AnimationPlayer

var started = false

func _physics_process(_delta):
	if Input.is_action_just_pressed("flap"):
		if !started:
			start()
		flap()
	if rotation_degrees <= MAX_ROTATION_DEGRESS:
		angular_velocity = 0
		rotation_degrees = MAX_ROTATION_DEGRESS
		
	if linear_velocity.y > 0:
		if rotation_degrees <= 90:
			angular_velocity = 3
		else:
			angular_velocity = 0

func start():
	if started: return
	started = true
	gravity_scale = 5.0
	animator.play("Flap")

func flap():
	linear_velocity.y = FLAP_FORCE
	angular_velocity = -8.0
