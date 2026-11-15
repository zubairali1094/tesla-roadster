extends Area2D

var hit = false

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):

	if body.name == "Player" and not hit:
		hit = true

		print("GAME OVER!")

		body.set_physics_process(false)

		await get_tree().create_timer(1.0).timeout

		get_tree().reload_current_scene()
