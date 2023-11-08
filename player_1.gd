extends CharacterBody2D

const SPEED = 600.0

func _physics_process(delta):
	var directiony = Input.get_axis("w", "s")
	velocity.y = directiony * SPEED
	move_and_slide()

func _on_area_2d_body_entered(body):
	body.direction.x *= -1
