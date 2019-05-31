extends Node2D


func _ready():
	$music_fundo/background.volume_db = 10
	$music_fundo/background.play()
