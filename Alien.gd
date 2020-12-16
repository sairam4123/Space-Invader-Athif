extends Area2D


func _on_Timer_timeout() -> void:
	var screen_size = get_viewport_rect()
	var new_pos = position + Vector2(rand_range(-25, 25), rand_range(-25, 25))
	if screen_size.has_point(new_pos):
		position = new_pos


func _on_Alien_body_entered(body: Node) -> void:
	if body is Bullet:
		call_deferred("queue_free")
		Events.emit_signal("bullet_entered_alien", self)
	if body is Rocket:
		body.call_deferred("kill")
