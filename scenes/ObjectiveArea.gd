extends Area2D

func _on_ObjectiveArea_body_entered(body: RigidBody2D):
	if (body.name == "BlueShip"):
		print("Reached objective!")
		
		# Change to new level
		get_tree().change_scene("res://scenes/NewLevel.tscn")
