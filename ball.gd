extends CharacterBody2D

const SPEED = 300.0
var direction = Vector2.ZERO
@onready var p_1_point = $"../P1Point"
@onready var p_2_point = $"../P2Point"

func _ready():
	var randx = randi_range(0, 1)
	if randx == 0:
		randx = -1
	var randy = randi_range(0, 1)
	if randy == 0:
		randy = -1	
	direction = Vector2(randx, randy)

func _physics_process(delta):
	velocity.x = direction.x * SPEED
	velocity.y = direction.y * SPEED
	move_and_slide()
	
func _update_points(point1, point2):
	p_1_point.value = str(point1)
	p_2_point.value = str(point2)
