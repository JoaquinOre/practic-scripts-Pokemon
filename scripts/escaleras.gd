extends Area2D
@export var escena_destino : String = "res://scenas/roomPlayer.tscn"

# Called when the node enters the scene tree for the first time.



func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("player")):
		call_deferred("cambiar_nivel")
	else:
		print("no se a encontrado body de grupo players")

func cambiar_nivel():
	
	get_tree().change_scene_to_file(escena_destino)
	
