extends CharacterBody2D

# Velocidad a la que se mueve el minero
@export var velocidad: float = 756.0
@export var invertir_eje: int = 1

func _physics_process(delta: float) -> void:
	# 1. Obtener la dirección de las teclas (WASD)
	var direccion = Vector2.ZERO # Empezamos sin dirección

	if Input.is_action_pressed("ui_right"): # Si presionamos D
		direccion.x += 1 
	if Input.is_action_pressed("ui_left"): # Si presionamos A
		direccion.x -= 1
	if Input.is_action_pressed("ui_down"):  # Si presionamos S
		direccion.y += 1 * invertir_eje
	if Input.is_action_pressed("ui_up"):    # Si presionamos W
		direccion.y -= 1 * invertir_eje

	# Normalizar la dirección si nos movemos en diagonal (evita ir más rápido)
	if direccion.length() > 0:
		direccion = direccion.normalized()

	# 2. Calcular la velocidad del minero
	velocity = direccion * velocidad

	# 3. Mover al minero
	move_and_slide()
