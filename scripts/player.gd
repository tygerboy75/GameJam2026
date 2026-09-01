extends CharacterBody2D


const SPEED = 100.0
#removed the jump volicity constant

#Declaring the variable so that it knows what the fuck im talking about
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	#deleted the jump function, kinda thinking for a puzzle game removing jumping could be good, also easier to make it look good and smooth, can always add back later

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	#flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	#different animation for walking and idle]
	if direction == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("walking")

	move_and_slide()
