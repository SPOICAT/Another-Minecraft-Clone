extends KinematicBody

var gravity = Vector3.DOWN * 12  # strength of gravity

var speed = 50  # movement speed

var jump_speed = 9  # jump strength

var mouse_sensitivity : float = 0.25

var velocity = Vector3.ZERO
var jump = false


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$Camera.current = true


func get_input():
	var vy = velocity.y
	velocity = Vector3()
	if Input.is_action_pressed("move_forward"):
		velocity += -transform.basis.z * speed
	if Input.is_action_pressed("move_back"):
		velocity += transform.basis.z * speed
	if Input.is_action_pressed("move_left"):
		velocity += -transform.basis.x * speed
	if Input.is_action_pressed("move_right"):
		velocity += transform.basis.x * speed
	velocity.y = vy

	jump = false
	if Input.is_action_just_pressed("jump"):
		jump = true


func _physics_process(delta):
	velocity += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector3.UP, true)

	if jump and is_on_floor():
		velocity.y = jump_speed


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		var rot_delta = event.relative
		rot_delta *= mouse_sensitivity
		rotation_degrees.y -= rot_delta.x
		$Camera.rotation_degrees.x -= rot_delta.y
