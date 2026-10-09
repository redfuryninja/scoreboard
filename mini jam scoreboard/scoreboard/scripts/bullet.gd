extends CharacterBody2D
@export var SPEED = 1000
var dir : float
var spawnPos : Vector2
var spawnRot : float
var zdex : int
var ypos : int
var xpos : int
func _ready():
	global_rotation = spawnRot
	position.y = ypos
	position.x = xpos
	z_index = zdex
	
func _physics_process(delta):
	velocity = Vector2(SPEED,0).rotated(dir)
	move_and_slide()
	



func _on_area_2d_area_entered(area: Area2D) -> void:
	queue_free()
