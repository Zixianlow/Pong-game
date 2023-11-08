extends CharacterBody2D

const SPEED = 600.0
@onready var ball = $"../Ball"

func _physics_process(delta):
	var directiony = Input.get_axis("up", "down")
	velocity.y = directiony * SPEED
	move_and_slide()

func _on_area_2d_body_entered(body):
	body.direction.x *= -1
