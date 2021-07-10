extends KinematicBody

var gravity = Vector3.DOWN * 10

var speed = 25

var jump_speed = 9

var mouse_sensitivity : float = 0.25

var velocity = Vector3.ZERO
var jump = false

onready var blocker = get_node("Camera/Blocker")
var voxelmap = null

signal selected_block(action)
enum {
	REMOVE_BLOCK,
	ADD_BLOCK
}


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


func _input(event):

	var min_camera_rot = -95
	var max_camera_rot = 90
	
	var camera = get_node("Camera")

	if event is InputEventMouseMotion:
		var rot_delta = event.relative
		rot_delta *= mouse_sensitivity
		rotation_degrees.y -= rot_delta.x
		camera.rotation_degrees.x -= rot_delta.y
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, min_camera_rot, max_camera_rot)

	if Input.is_action_just_pressed("remove_block"):
		emit_signal("selected_block", REMOVE_BLOCK)
	if Input.is_action_pressed("add_block"):
		emit_signal("selected_block", ADD_BLOCK)
