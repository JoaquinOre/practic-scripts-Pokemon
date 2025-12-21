extends Area2D
@export var escena_destino : String = "res://scenas/scenas pokemon/roomPlayer.tscn"
@export var player: PackedScene
# Called when the node enters the scene tree for the first time.






func cambiar_nivel():
	
	get_tree().change_scene_to_file(escena_destino)
	
	


func _on_salida_body_entered(body: Node2D) -> void:
	if (body.is_in_group("player")):
		call_deferred("cambiar_nivel")
