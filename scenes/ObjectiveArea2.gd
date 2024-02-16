extends Area2D

func _on_ObjectiveArea2_body_entered(body: RigidBody2D):
	if (body.name == "GreenShip"):
		print("Reached objective!")
	
		# Change to main level
		get_tree().change_scene("res://scenes/MainLevel.tscn")
