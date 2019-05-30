extends StaticBody2D

var flip = false
var pos_inicial
var pos_final 

const VELOCIDADE = 1

func _ready():
	$AnimatedSprite.play("Walk")
	pos_inicial = $".".position.x
	pos_final = pos_inicial + 100


func _process(delta):
	
	if pos_inicial <= pos_final and !flip:
		$".".position.x += VELOCIDADE
		$AnimatedSprite.flip_h = flip
		
		if $".".position.x >= pos_final:
			flip = true
			pos_final = pos_inicial - 100
		
	elif pos_inicial >= pos_final:
		$".".position.x -= VELOCIDADE
		$AnimatedSprite.flip_h = flip
		
		if $".".position.x <= pos_final:
			flip = false
			pos_final = pos_inicial + 100
