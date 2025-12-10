extends Area2D
@export var escena_destino : String = "res://scenas/roomPlayer.tscn"
var main 
# Called when the node enters the scene tree for the first time.
func _ready():
	main = get_tree().get_nodes_in_group("main")[0]



func _on_body_entered(body: Node2D) -> void:

	if (body.is_in_group("player")):
		#call_deferred("cambiar_nivel") <--- sirve para cambiar de nivel mas manualmente
		main.check_door()


func cambiar_nivel():
	
	get_tree().change_scene_to_file(escena_destino)
	
