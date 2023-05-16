extends TileMap


func _physics_process(delta: float) -> void:
	
	if(Input.is_action_just_pressed("interact")):
		var tile: Vector2 = world_to_map(get_global_mouse_position())
		if get_cellv(tile) == -1:
			set_cellv(tile,0)
		else:
			set_cellv(tile,-1)
