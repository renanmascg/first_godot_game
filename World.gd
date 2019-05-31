extends Node2D

func _ready():
	$music_fundo/AudioStreamPlayer.volume_db = 10
	$music_fundo/AudioStreamPlayer.play()
	
