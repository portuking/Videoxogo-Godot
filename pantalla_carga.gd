extends Control

@onready var barra = %"barra-carga"
@onready var texto = %texto # El texto que dice "Cargando..."

func _ready():
	# 1. Ponemos la barra a 0 al empezar
	barra.value = 0
	
	# 2. Creamos la animación (Tween)
	var tween = create_tween()
	
	# 3. Animamos el valor de la barra de 0 a 100 en 5 segundos
	# Puedes cambiar el '5.0' por el tiempo que quieras que dure la carga
	tween.tween_property(barra, "value", 100, 5.0).set_trans(Tween.TRANS_SINE)
	
	# 4. Cuando la barra llegue a 100, ejecutamos la función "terminar"
	tween.finished.connect(_al_terminar_carga)

func _al_terminar_carga():
	texto.text = "¡AVENTURA PREPARADA!"
	print("La simulación de carga ha finalizado.")
	# Aquí podrías añadir un efecto de sonido de victoria o fanfarria
