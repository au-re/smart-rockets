extends Node

export var speed: float = .5

signal on_target_hit
signal on_obstacle_hit


func move_forward():
	var parent: KinematicBody2D = get_parent()
	
	if parent.exploded:
		return 

	var collision = parent.move_and_collide(Vector2(1, 0).rotated(parent.rotation) * speed)
	
	if collision and collision.collider.is_in_group("target"):
		emit_signal("on_target_hit")

	if collision and collision.collider.is_in_group("rocket"):
		emit_signal("on_target_hit")

	if collision and collision.collider.is_in_group("obstacle"):
		emit_signal("on_obstacle_hit")


func turn_towards(target: Node2D):
	var parent: Node2D = get_parent()
	parent.look_at(target.position)
