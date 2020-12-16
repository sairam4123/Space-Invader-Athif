extends KinematicBody2D
class_name Rocket

export var speed = 50
export(PackedScene) var bullet_scene

var velocity = Vector2()

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("ui_select"):
			shoot(Vector2.UP)

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	var screen_size = get_viewport_rect()
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	elif Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	elif Input.is_action_pressed("ui_right"):
		velocity.x += 1
	
	velocity = velocity.normalized() * speed
	if screen_size.has_point(position + velocity):
		velocity = move_and_slide(velocity, Vector2.UP)


func shoot(_velocity):
	var bullet = bullet_scene.instance()
	bullet.velocity = _velocity * 50
	bullet.position = global_position + _velocity * 4
	get_parent().add_child(bullet)

func kill():
	queue_free()
	Events.emit_signal("game_ended")
	
