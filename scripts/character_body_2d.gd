extends CharacterBody2D

@export var jump_height : float = 100.0
@export var jump_time_to_peak : float = 0.4
@export var jump_time_to_descent : float = 0.3

const SPEED = 300.0

@onready var JUMP_VELOCITY : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
@onready var jump_gravity : float = (2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)
@onready var fall_gravity : float = (2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)

@onready var animacion = $AnimatedSprite2D
@onready var coyote_timer = %coyoteTimer

const TILE_SIZE = Vector2(8, 8)
var on_ledge: bool = false
var direction: float = 0.0
var grab_ledge:bool = false
func _physics_process(delta: float) -> void:
	var was_on_floor = is_on_floor()
	velocity.y += get_custom_gravity() * delta
	if !on_ledge:
		#_ledge_logic()
		#este if es para verificar si es el personaje se puede agarrar a algo
		#si ledge miss está colisionando entonces no se puede agarrar porque es un muro muy grande para el personaje, por eso debe cumplirse  
		#ver el diseño de mario
		if %ledge_hit.is_colliding() && !$ledge_miss.is_colliding() && velocity.y > 0:
			velocity.y = 0
			grab_ledge = true
		else:
			grab_ledge = false
	
	
	if Input.is_action_just_pressed("ui_Space"):
		if is_on_floor() or !coyote_timer.is_stopped() or grab_ledge:
			jump()
	var direction := Input.get_axis("tecla_A", "tecla_D")
	if direction:
		animacion.play("walk_right")
		animacion.flip_h = (direction < 0)
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animacion.play("idle")


	move_and_slide()


	if was_on_floor and !is_on_floor() and velocity.y >= 0:
		coyote_timer.start()


#func _ledge_logic() -> void:
	#if is_on_floor() or velocity.y <= 0 or direction == 0:
		#return
	#if (%ledge_hit.is_colliding() or $ledge_miss.is_colliding()):
		#return



func get_custom_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity

func jump(): 
	velocity.y = JUMP_VELOCITY
	coyote_timer.stop() 
