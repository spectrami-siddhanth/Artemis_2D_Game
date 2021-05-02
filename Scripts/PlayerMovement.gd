extends KinematicBody2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(_delta):
	
	var velocity = Vector2()
	
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		$AnimatedSprite.flip_h = true
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		$AnimatedSprite.flip_h = false
	
	velocity = velocity.normalized() * 100
	velocity = move_and_slide(velocity)
	
	if (abs(velocity.x) > 0 or abs(velocity.y) > 0) and !$Footstep.playing:
		$AnimatedSprite.play("Walk")
		$Footstep.play()
	if (velocity == Vector2.ZERO):
		$AnimatedSprite.play("Idle")
		$Footstep.stop()
