extends Node2D

var rocket = preload("res://components/Rocket/Rocket.tscn")

# called every frame
func _process(_delta):
	var target = $Target
	move_rockets_to_target(target)


# Called when user clicks on the background
func _on_Area2D_input_event(_node: Node, evt: InputEvent, _shapIdx: int):
	if evt is InputEventMouseButton and evt.button_index == BUTTON_LEFT and evt.pressed:
		add_rocket(evt.position)


# Test method (replace this with genetic algorithm)
func move_rockets_to_target(target: Node2D):
	get_tree().call_group("tracker", "turn_towards", target)
	get_tree().call_group("tracker", "move_forward")


# Test method, add a rocket to the game
func add_rocket(pos: Vector2):
	var new_rocket = rocket.instance()
	new_rocket.position = pos
	add_child(new_rocket)
