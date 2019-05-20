extends KinematicBody2D

const UP = Vector2(0, -1)
var acceleration = 25
var max_velocity = 300
var gravity = 10
var jump_height = -300
var motion = Vector2()

func _physics_process(delta):
	motion.y += gravity	
	if Input.is_action_pressed("ui_right"):
		motion.x =  min(motion.x + acceleration, max_velocity)
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - acceleration, -max_velocity)
		$Sprite.flip_h = true
	else:
		motion.x = 0
		
	if Input.is_action_pressed("ui_up") and is_on_floor():
		motion.y = jump_height
		
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
		if motion.y < 0:
			$Sprite.play("jump")
		else:
			$Sprite.play("fall")
	pass