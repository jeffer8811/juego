extends Node2D
export (PackedScene) var  Monstruo
var Punteo
var time

func _ready():
	randomize()
	time = 0
	

func game_over():
	$PunteoTimer.stop()
	$MonstruoTimer.stop()
	$Interfaz.game_over()
	


func _on_InicioTimer_timeout():
	time += 1
	if time == 1:
		$Interfaz.mostrar_mensaje("  ")
	$MonstruoTimer.start()
	$PunteoTimer.start()
	


func _on_PunteoTimer_timeout():
	Punteo += 1
	$Interfaz.refresh_puntos(Punteo)
	
func _on_MonstruoTimer_timeout():
	$Camino/MonstruoPosicion.set_offset(randi())
	var M = Monstruo.instance()
	add_child(M)
	
	var dire = $Camino/MonstruoPosicion.rotation +PI /2
	M.position = $Camino/MonstruoPosicion.position
	
	dire += rand_range(-PI /4, PI /4)
	M.rotation = dire
	M.set_linear_velocity(Vector2(rand_range(M.vel_min,M.vel_max), 0).rotated(dire))


func nuevo_juego():
	Punteo =  0
	$Player.inicio($PosicionDeinicio.position)
	$InicioTimer.start()
	$Interfaz.mostrar_mensaje("Prepárate...")
	$Interfaz.refresh_puntos(Punteo)


func _on_Interfaz_iniciar_juego():
	Punteo =  0
	$Player.inicio($PosicionDeinicio.position)
	$InicioTimer.start()
	$Interfaz.mostrar_mensaje("Prepárate...")
	
	$Interfaz.refresh_puntos(Punteo)
