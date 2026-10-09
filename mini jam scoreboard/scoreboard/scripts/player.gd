extends CharacterBody2D
@onready var sprite: AnimatedSprite2D = $Sprite2D
@onready var main = get_tree().get_root()
@onready var projectile = load("res://scenes/bullet.tscn")
var stance = 1
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func upShoot():
	var instance = projectile.instantiate()
	instance.dir = rotation - 45
	instance.spawnPos = global_position
	instance.ypos = position.y + 250
	instance.xpos = position.x + 110
	instance.spawnRot = rotation
	instance.zdex = z_index -1
	main.add_child(instance)

func middleShoot():
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position
	instance.ypos = position.y + 250
	instance.xpos = position.x + 45
	instance.spawnRot = rotation
	instance.zdex = z_index -1
	main.add_child(instance)

func downShoot():
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position
	instance.ypos = position.y + 400
	instance.xpos = position.x + 200
	instance.spawnRot = rotation
	instance.zdex = z_index -1
	main.add_child(instance)
func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if stance == 0:
		sprite.animation = "down"
	elif stance == 1:
		sprite.animation = "middle"
	elif stance == 2:
		sprite.animation = "up"
	# Handle jump.
		
	if Input.is_action_just_pressed("fire") and stance == 2:
		upShoot()
	if Input.is_action_just_pressed("fire") and stance == 1:
		middleShoot()
	if Input.is_action_just_pressed("fire") and stance == 0:
		downShoot()
	
	if Input.is_action_just_pressed("up"):
		stance += 1
		if stance > 2:
			stance = 2
	if Input.is_action_just_pressed("down"):
		stance -= 1
		if stance<0:
			stance = 0
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	Global.points -=2
