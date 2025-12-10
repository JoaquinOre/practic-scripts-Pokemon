extends Node2D
@export var player: PackedScene
@export var roomPlayer : PackedScene
var nivel_actual = 1;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:  
	var newLvl = roomPlayer.instantiate()
	add_child(newLvl)
	var newPlayer = player.instantiate()
	add_child(newPlayer)
	
	newPlayer.global_position = get_tree().get_nodes_in_group("spawn")[0].global_position

func check_door():
	get_tree().get_nodes_in_group("player")[0].queue_free()
	get_tree().get_nodes_in_group("nivel")[0].queue_free()
	match(nivel_actual):
		1: 
			nivel_actual = 2
			
# Called every frame. 'delta' is the elapsed time since the previous frame.

 
