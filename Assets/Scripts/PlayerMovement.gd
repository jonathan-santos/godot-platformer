extends KinematicBody2D

const UP = Vector2(0, -1)
const VELOCITY = 300
const GRAVITY = 10
const JUMP_HEIGHT = -300
var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = VELOCITY
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -VELOCITY
		$Sprite.flip_h = true
	else:
		motion.x = 0
		
	if Input.is_action_pressed("ui_up") and is_on_floor():
		motion.y = JUMP_HEIGHT
		
	play_animations()
	motion = move_and_slide(motion, UP)
	pass

func play_animations():
	if is_on_floor():
		if motion.x == 0:
			$Sprite.play("idle")
		else:
			$Sprite.play("run")
	else:
		$Sprite.play("jump")
	pass