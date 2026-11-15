extends CharacterBody2D

const SPEED = 1000.0
const JUMP_VELOCITY = -900.0
const GRAVITY = 1200.0
var time = 0
var game_ended = false
func _physics_process(delta):
	if not game_ended: time += delta
	if position.x > 29113 and not game_ended:
		game_ended = true
		$"../CanvasLayer/ColorRect".visible = true
		$"../CanvasLayer/ColorRect/Score".text = "Score: " + str(roundi(time))
	$"../CanvasLayer/Label".text = str(roundi(time))
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	#var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = SPEED

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	move_and_slide()

func restart():
	get_tree().reload_current_scene()


func _on_button_pressed() -> void:
	restart()
