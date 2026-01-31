extends Control

# Usamos % para encontrar los nodos sin importar dónde estén
@onready var fondo_ajustes = %"Fondo-Ajustes"
@onready var menu_opciones = %menu_opciones

# Cargamos las dos imágenes (asegúrate de que las rutas sean correctas)
var img_musica_si = preload("res://imagenes/botones/boton-musica-si.png")
var img_musica_no = preload("res://imagenes/botones/boton-musica-no.png")

# Variable para saber si la música está activa o no
var musica_activa = true

func _ready():
	# Ocultamos todo al inicio de forma segura
	if fondo_ajustes:
		fondo_ajustes.hide()
		# Esto es vital para que no bloquee los botones de atrás
		fondo_ajustes.mouse_filter = Control.MOUSE_FILTER_IGNORE

func _on_boton_opciones_pressed():
	if fondo_ajustes:
		fondo_ajustes.show()
		# Cambiamos a STOP solo cuando el menú es visible para poder usarlo
		fondo_ajustes.mouse_filter = Control.MOUSE_FILTER_STOP
		print("Abriendo opciones...")

func _on_boton_cerrar_pressed():
	if fondo_ajustes:
		fondo_ajustes.hide()
		# Volvemos a IGNORE para que el ratón "atraviese" y llegue a JUGAR
		fondo_ajustes.mouse_filter = Control.MOUSE_FILTER_IGNORE
		print("Cerrando opciones...")

func _on_boton_salir_pressed():
	# Esta línea cierra la aplicación inmediatamente
	get_tree().quit()
	
func _on_boton_musica_si_pressed():
	# Buscamos el nodo. Asegúrate de que la ruta sea correcta según tu árbol
	# Si es hijo de menu_opciones, la ruta suele ser esta:
	var nodo_boton = %"Boton-Musica" 
	
	if nodo_boton == null:
		print("ERROR: No encuentro el botón. Revisa el nombre único (%)")
		return

	musica_activa = !musica_activa
	
	if musica_activa:
		nodo_boton.texture_normal = img_musica_si
		$%musica.playing = true
	else:
		nodo_boton.texture_normal = img_musica_no
		$%musica.playing = false
