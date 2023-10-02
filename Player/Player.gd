extends CharacterBody2D

#func _physics_process(delta):
#	print("Start")
#	if Input.is_action_pressed("ui_left"):
#		velocity.x = -4
#	elif Input.is_action_pressed("ui_right"):
#		velocity.x = 4
#	else :
#		velocity.x = 0
#		velocity.y = 0
#	move_and_collide(velocity)

const MAX_SPEED = 300
const ACCELERATION = 30
const FRICTION = 30

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") 
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector * ACCELERATION * delta
		
		velocity = velocity.clamp(Vector2(-MAX_SPEED*delta,-MAX_SPEED*delta), Vector2(MAX_SPEED*delta,MAX_SPEED*delta))
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta ) 
		
	move_and_collide(velocity )
