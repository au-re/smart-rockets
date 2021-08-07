extends Line2D


func _process(_delta):
	global_position = Vector2(0,0)
	global_rotation = 0
	
	var target: KinematicBody2D = get_parent()
	var point = target.global_position
	add_point(point)
