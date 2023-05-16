extends KinematicBody2D

export var speed = 400
var velocity = Vector2.ZERO

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if input_direction[1] < 0 and input_direction[0] < 0:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.animation = "WalkingBD"
	elif input_direction[1] < 0 and input_direction[0] > 0:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.animation = "WalkingBD"
	elif input_direction[1] > 0 and input_direction[0] < 0:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.animation = "WalkingFD"
	elif input_direction[1] > 0 and input_direction[0] > 0:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.animation = "WalkingFD"
	elif input_direction[1] < 0:
		$AnimatedSprite.animation = "WalkingB"
	elif input_direction[1] > 0:
		$AnimatedSprite.animation = "WalkingF"
	elif input_direction[0] < 0:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.animation = "WalkingS"
	elif input_direction[0] > 0:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.animation = "WalkingS"
	else:
		if $AnimatedSprite.animation == "WalkingF":
			$AnimatedSprite.animation = "IdleF"
		elif $AnimatedSprite.animation == "WalkingB":
			$AnimatedSprite.animation = "IdleB"
		elif $AnimatedSprite.animation == "WalkingFD":
			$AnimatedSprite.animation = "IdleFD"
		elif $AnimatedSprite.animation == "WalkingBD":
			$AnimatedSprite.animation = "IdleBD"
		elif $AnimatedSprite.animation == "WalkingS":
			$AnimatedSprite.animation = "IdleS"
	
	if Input.is_action_just_pressed("interact"):
		pass
	

func _physics_process(delta):
	get_input()
	move_and_slide(velocity, Vector2.UP)
