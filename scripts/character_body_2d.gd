extends CharacterBody2D

@export var jump_height : float 
@export var jump_time_to_peak : float
@export var jump_time_to_descent : float 



const SPEED = 300.0
@onready var JUMP_VELOCITY : float = ((2.0 * jump_height) / jump_time_to_peak) * - 1.0
@onready var jump_gravity : float  = ((2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * - 1.0
@onready var fall_gravity : float = ((2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * - 1.0
@onready var animacion = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	velocity.y -= get_custom_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_Space") and is_on_floor():
		jump()

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

func get_custom_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity

func jump(): 
	velocity.y = JUMP_VELOCITY
