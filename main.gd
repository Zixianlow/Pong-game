extends Node2D
var p1_point = 0
var p2_point = 0
@onready var p_1_point = $P1Point
@onready var p_2_point = $P2Point
@onready var start_button = $"Start Button"
@onready var instruction = $Instruction
@onready var p_1_label = $"P1 label"
@onready var p_2_label = $"P2 label"

func _ready():
	instruction.text = "Instruction:\nPress W,S to move P1\nPress Up,Down to move P2\nPress Play to start playing"

func _on_top_body_entered(body):
	if body.direction:
		body.direction.y *= -1

func _on_bottom_body_entered(body):
	if body.direction:
		body.direction.y *= -1

func _handle_body_entered(body):
	body.queue_free()
	var ball = preload("res://ball.tscn").instantiate()
	ball.global_position = Vector2(577,325)
	add_child(ball)
	
func _on_left_body_entered(body):
	p2_point += 1
	p_2_point.text = str(p2_point)
	call_deferred("_handle_body_entered", body)

func _on_right_body_entered(body):
	p1_point += 1
	p_1_point.text = str(p1_point)
	call_deferred("_handle_body_entered", body)

func _on_start_button_pressed():
	p1_point = 0
	p2_point = 0
	p_1_point.text = str(p1_point)
	p_2_point.text = str(p2_point)
	start_button.queue_free()
	p_1_label.queue_free()
	p_2_label.queue_free()
	instruction.queue_free()
