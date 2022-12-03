extends Node2D

onready var timer = $Timer

var Obstacle = preload("res://environments/Obstacle.tscn")

func _ready():
	randomize()

func _on_Timer_timeout():
	var obstacle = Obstacle.instance()
	add_child(obstacle)
	obstacle.position.y = randi() % 340 + 150

func start():
	timer.start()

func stop():
	timer.stop()
