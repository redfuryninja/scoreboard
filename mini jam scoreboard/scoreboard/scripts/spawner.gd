extends Node2D

@export var enemyScene : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var enemy = enemyScene.instantiate()
	enemy.position = position
	get_parent().add_child(enemy)
