extends KinematicBody2D

const UP = Vector2.UP
const GRAVITY = 20
const MAX_SPEED = 200
const ACCELERATION = 50
const JUMP_HEIGHT = - 550

var motion = Vector2()

func _physics_process(delta):
	var friction = false
	
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("Run")
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
		
	else:
		$Sprite.play("Idle")
		friction = true
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			$Sounds/jump_sound.play()
			motion.y = JUMP_HEIGHT
		
		if friction:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0: # subindo
			$Sprite.play("Jump")
		else: # caindo
			$Sprite.play("Fall")
			
		if friction:
			motion.x = lerp(motion.x, 0, 0.05)
		
	motion = move_and_slide(motion, UP)

func _on_Area2D_body_entered(body):
	body.dano()
	
	var controla_altura_pulo = 0.5
	
	if Input.is_action_pressed("ui_up"):
		controla_altura_pulo = 1
		
	motion.y = JUMP_HEIGHT * controla_altura_pulo
	
