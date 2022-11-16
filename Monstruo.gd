extends RigidBody2D

export (int) var vel_min
export (int) var vel_max
var tipo_mpnstruo = ["enemigo", "mini"]

func _ready():
	$AnimatedSprite.animation =tipo_mpnstruo[randi() % tipo_mpnstruo.size()]
	
	if $AnimatedSprite.animation == "enemigo":
		$CollisionShape2D.scale.x = 1.4
		$CollisionShape2D.scale.y = 1.4
	


func _on_VisibilityNotifier2D_screen_exited():
	pass # Replace with function body.
