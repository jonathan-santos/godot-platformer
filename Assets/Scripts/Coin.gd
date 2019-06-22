extends Area2D



func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			Global.score += 10
			print(Global.score)
			queue_free()
	pass
