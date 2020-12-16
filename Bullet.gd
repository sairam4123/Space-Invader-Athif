extends KinematicBody2D
class_name Bullet

var velocity: Vector2
var speed = 1

func _ready() -> void:
	Events.connect("bullet_entered_alien", self, "_bullet_entered_alien")
	set_physics_process(true)


func _physics_process(delta: float) -> void:
	move_and_slide(velocity * speed, Vector2.DOWN)

func _bullet_entered_alien(body):
	
	body.set_physics_process(false)
	body.call_deferred("queue_free")
