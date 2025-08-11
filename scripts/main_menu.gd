extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/select_menu.tscn") # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit() # Replace with function body.


func _on_wish_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/gift_scene.tscn")
