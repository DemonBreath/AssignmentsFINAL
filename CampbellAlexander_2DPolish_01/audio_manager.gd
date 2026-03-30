extends Node

@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var sfx_player: AudioStreamPlayer = $SFXPlayer

func _ready() -> void:
	print("AUDIOMANAGER READY")
	print("music stream: ", music_player.stream)
	print("music bus: ", music_player.bus)

	if music_player.stream == null:
		print("NO MUSIC FILE ASSIGNED")
		return

	if not music_player.playing:
		music_player.play()
		print("MUSIC STARTED")

func play_coin() -> void:
	print("PLAY_COIN CALLED")
	if sfx_player.stream:
		sfx_player.play()
