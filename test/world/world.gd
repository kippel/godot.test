extends Control


func _on_platform_pressed() -> void:
	get_tree().change_scene_to_file("res://1.platform/platform.tscn")
