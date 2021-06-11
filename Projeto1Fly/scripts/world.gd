extends Node2D

const PRE_COLUNAS = preload("res://scenes/colunas.tscn")

var time_instance = 0

func _ready():
	pass

func _process(delta):
	$score/score.text = str(DataOfGame.score)
	
	time_instance += delta
	if time_instance > 2:
		spawn_columns()
		time_instance = 0
	
	move_scenery($cenario/fundo,$cenario/fundo2,0.5,1085)
	move_scenery($cenario/montanha,$cenario/montanha2,3,1086)
	move_scenery($cenario/nuvem,$cenario/nuvem2,5,2160)
	
		
func move_scenery(node1,node2,velocity,positionsc):
		
	node1.position.x -= velocity
	node2.position.x -= velocity
	
	if node1.position.x <= -positionsc:
		node1.position.x = positionsc
	
	if node2.position.x <= -positionsc:
		node2.position.x = positionsc
	
	
func spawn_columns():
	var colunas = PRE_COLUNAS.instance()
	colunas.position.y = rand_range(200,450)
	colunas.position.x = 500
	add_child(colunas)
	

