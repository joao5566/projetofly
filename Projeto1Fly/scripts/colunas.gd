extends Node2D

var velocidade = 200
var value = 1
func _ready():
	pass 
	
func _process(delta):
	position.x -= velocidade * delta

	if position.x < -50:
		DataOfGame.scored(value)
		queue_free()


func _on_colunas_body_entered(body):
	DataOfGame.score= 0 
	get_tree().reload_current_scene()
