extends Node2D

export(PackedScene) var alien

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.connect("game_ended", self, "_game_ended")
	var screen_size = get_viewport_rect()
	for i in range(8):
		var alien_ins = alien.instance()
		alien_ins.position = Vector2(rand_range(0, screen_size.end.x), rand_range(0, screen_size.end.y))
		add_child(alien_ins)
		alien_ins.add_to_group("aliens")


func _on_Timer_timeout():
	if get_tree().get_nodes_in_group("aliens").size() < 8:
		var screen_size = get_viewport_rect()
		for i in range(8):
			var alien_ins = alien.instance()
			alien_ins.position = Vector2(rand_range(0, screen_size.end.x), rand_range(0, screen_size.end.y))
			add_child(alien_ins)
			alien_ins.add_to_group("aliens")

func _game_ended():
	for i in range(3):
		yield(get_tree(), "idle_frame")
	get_tree().quit(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
