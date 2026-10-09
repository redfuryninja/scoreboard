extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 10.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x -= SPEED
	animated_sprite_2d.animation = "run"

	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	queue_free()
	Global.points += 1
