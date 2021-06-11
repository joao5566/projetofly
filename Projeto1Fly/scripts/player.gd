extends RigidBody2D

var impulse = false
var force_jump = -600
onready  var anim = get_node("anim")

func _ready():
		anim.connect("animation_finished",self,"finished") 
	
func _physics_process(_delta):
	
	if impulse:
		anim.play("impulse")
	else:
		anim.play("fly")
	
		if Input.is_action_just_pressed("on_touch"):
			on_touch()
			
func on_touch():
	anim.frame = 0
	impulse = true 
	apply_impulse(Vector2(0,0),Vector2(0,force_jump))
	
func finished():
 impulse = false	
