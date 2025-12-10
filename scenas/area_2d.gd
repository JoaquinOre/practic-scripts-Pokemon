extends Area2D
@export var escena_destino : String = "res://scenas/houseplayer.tscn"
@export var player: PackedScene

# Called when the node enters the scene tree for the first time.



func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("player")):
		call_deferred("cambiar_nivel")
		

func cambiar_nivel():
	get_tree().change_scene_to_file(escena_destino)
