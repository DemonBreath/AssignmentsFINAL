extends Control

@onready var play_button: Button = $PlayButton
@onready var quit_button: Button = $QuitButton

func _ready() -> void:
	$TextureRect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	
	play_button.pressed.connect(_on_play_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

func _on_play_pressed() -> void:
	print("PLAY BUTTON PRESSED")
	get_tree().change_scene_to_file("res://mainscene.tscn")

func _on_quit_pressed() -> void:
	print("QUIT BUTTON PRESSED")
	get_tree().quit()
