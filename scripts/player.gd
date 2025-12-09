extends CharacterBody2D
var vel_actual = Vector2()
var vel_desp = 16

func _ready():
	$AnimationPlayer.play("walk_up")
	
func _physics_process(delta):
	if(!$AnimationPlayer.is_playing()):
		if (Input.is_action_just_pressed("acept")):
			if ($palo/RayCast2D.is_colliding()):
				var objeto_chocado = $palo/RayCast2D.get_collider()
				if (objeto_chocado.is_in_group("pc")):
					print("interactuando con el pc")
				if (objeto_chocado.is_in_group("ordenador")):
					print("interactuando con el ordenador")


		if(Input.is_action_pressed("tecla_W")):
			$palo.rotation_degrees = 0
			vel_actual.y = -vel_desp * delta/$AnimationPlayer.get_animation("walk_up").length
			$AnimationPlayer.play("walk_up")
		elif(Input.is_action_pressed("tecla_S")):
			$palo.rotation_degrees = 180
			vel_actual.y = vel_desp * delta/$AnimationPlayer.get_animation("walk_down").length
			$AnimationPlayer.play("walk_down")
		elif(Input.is_action_pressed("tecla_A")):
			$palo.rotation_degrees = 270
			vel_actual.x = -vel_desp * delta/ $AnimationPlayer.get_animation("move").length
			$AnimationPlayer.play("move")
		elif(Input.is_action_pressed("tecla_D")):
			$palo.rotation_degrees = 90
			vel_actual.x = vel_desp * delta / $AnimationPlayer.get_animation("move_der").length
			$AnimationPlayer.play("move_der")
		 
	#if(!$AnimationPlayer.is_playing()): 
		#vel_actual.x = 0
		#vel_actual.y = 0
		
	if($AnimationPlayer.is_playing()):
		#get_tree().get_nodes_in_group("paredes")[0].get_cellv($palo/pos.global_position)
		move_and_collide(vel_actual)



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	vel_actual = Vector2(0,0)# Replace with function body.
	global_position = Vector2((round(global_position.x) - get_tree().get_nodes_in_group("spawn")[0].global_position.x /vel_desp * vel_desp) + get_tree().get_nodes_in_group("spawn")[0].global_position.x, (round(global_position.y) - get_tree().get_nodes_in_group("spawn")[0].global_position.y/ vel_desp * vel_desp) + get_tree().get_nodes_in_group("spawn")[0].global_position.y)
