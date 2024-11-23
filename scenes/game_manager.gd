extends Node

@onready var player: CharacterBody2D = $"../player"


const PLATFORM = preload("res://scenes/platform.tscn")
const COIN = preload("res://scenes/coin.tscn")

@onready var score_label: Label = %ScoreLabel
var score := 0

func _ready() -> void:
	pass

func add_point(): 
	score += 1
	score_label.text = "Score: " + str(score)
	
	
	var coin = COIN.instantiate()
	owner.add_child(coin)


func add_platform():
	print(player.position)
	var platform = PLATFORM.instantiate()
	platform.position = player.position + Vector2(8.0, 8.0)
	owner.add_child(platform)
	
