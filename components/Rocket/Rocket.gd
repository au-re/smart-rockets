extends KinematicBody2D

var exploded = false

# If it collides with the 
func _ready():
	$Tracker.connect("on_target_hit", self, "explode")
	$Tracker.connect("on_obstacle_hit", self, "explode")


func explode():
	exploded = true
	remove_child($CollisionShape2D)
	remove_child($RocketSprite)
	$AnimatedSprite.play("explosion")


func _on_AnimatedSprite_animation_finished():
	get_parent().remove_child(self)
