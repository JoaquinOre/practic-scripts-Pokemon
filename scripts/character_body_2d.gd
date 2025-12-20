extends CharacterBody2D
var velocidad = 150
@onready var player =$".."
@onready var animacion =  $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(Input.is_action_pressed("tecla_W")):
		player.position.y -= velocidad * _delta
		animacion.play("walk_up")
	elif (Input.is_action_pressed("tecla_S")):
		player.position.y += velocidad * _delta
		animacion.play("walk_down")
	elif(Input.is_action_pressed("tecla_A")):
		player.position.x -= velocidad * _delta
		animacion.play("walk_left")
	elif(Input.is_action_pressed("tecla_D")):
		player.position.x += velocidad * _delta
		animacion.play("walk_right")
	else: 
		animacion.stop()
	move_and_slide()
