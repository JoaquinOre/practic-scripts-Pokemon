extends Node2D
@export var player: PackedScene
@export var roomPlayer : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:  
	var newLvl = roomPlayer.instantiate()
	add_child(newLvl)
	var newPlayer = player.instantiate()
	add_child(newPlayer)
	
	newPlayer.global_position = get_tree().get_nodes_in_group("spawn")[0].global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.

 
