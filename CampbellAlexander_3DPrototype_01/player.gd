extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 9
const sensitivity = 0.01
@onready var campivot:=$SpringArm3D

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		campivot.rotation.x-=event.screen_relative.y * sensitivity
		campivot.rotation.y-=event.screen_relative.x * sensitivity

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var input_rot = Vector3(input_dir.x, 0, input_dir.y)
	input_rot = input_rot.rotated (Vector3.UP,campivot.rotation.y).normalized()
	var direction :Vector3= (transform.basis * input_rot).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
