extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animacion = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_Space") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("tecla_A", "tecla_D")
	if direction:
		if direction > 0 :
			animacion.play("walk_right")
			animacion.flip_h = (direction < 0)
		if direction < 0 :
			animacion.play("walk_right")
			animacion.flip_h  = (direction < 0)
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animacion.play("idle")

	move_and_slide()
