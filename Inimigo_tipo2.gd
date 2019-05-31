extends RigidBody2D

var vetor_hor = Vector2.RIGHT
var vetor_diag = Vector2(1,1)
var velocidade = 1
var flip = false

func _ready():
	$Sprite.play("Walk")
	mode = MODE_KINEMATIC
	
func _process(delta):
	if not colidiu_ou_fim_de_cenario():
		if velocidade > 0:
			velocidade = 1
			flip = false
		else:
			velocidade = -1
			flip = true
	else:
		flip = not flip
		velocidade *= -1
		vetor_hor *= -1
		vetor_diag.x *= -1
	
	position.x += velocidade
	$Sprite.flip_h = flip

func colidiu_ou_fim_de_cenario():
	return test_motion(vetor_hor) or \
		not test_motion(vetor_diag)

func dano():
	queue_free()