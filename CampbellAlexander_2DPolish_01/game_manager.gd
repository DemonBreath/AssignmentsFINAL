extends Node

var score: int = 0

@onready var score_label: Label = $"../UI/ScoreLabel"

func _ready() -> void:
	add_to_group("game_manager")
	update_score()

func add_score(amount: int) -> void:
	score += amount
	update_score()

func update_score() -> void:
	score_label.text = "Score: " + str(score)
