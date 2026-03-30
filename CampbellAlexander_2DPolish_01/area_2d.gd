extends Area2D

@export var value: int = 1

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		
		var gm = get_tree().get_first_node_in_group("game_manager")
		if gm:
			gm.add_score(value)

		AudioManager.play_coin()
		
		queue_free()
