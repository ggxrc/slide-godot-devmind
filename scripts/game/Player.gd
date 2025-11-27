extends CharacterBody2D
class_name Player

## Script do Player - Funciona independente do contexto
## Use este script no seu projeto de jogo!

# ============================================
# CONFIGURAÇÕES (ajuste no Inspector)
# ============================================
@export_group("Movimento")
@export var speed: float = 300.0
@export var jump_force: float = -400.0
@export var gravity: float = 980.0

@export_group("Tiro")
@export var bullet_scene: PackedScene  # Arraste a cena do tiro aqui
@export var fire_rate: float = 0.2     # Tempo entre tiros

@export_group("Vida")
@export var max_health: int = 3
var current_health: int

# ============================================
# VARIÁVEIS INTERNAS
# ============================================
var can_shoot: bool = true
var facing_right: bool = true

# Referências opcionais (crie esses nós se quiser)
@onready var sprite = get_node_or_null("Sprite2D")
@onready var animated_sprite = get_node_or_null("AnimatedSprite2D")
@onready var shoot_point = get_node_or_null("ShootPoint")
@onready var shoot_timer = get_node_or_null("ShootTimer")

# ============================================
# SINAIS (conecte em outros scripts se precisar)
# ============================================
signal health_changed(new_health: int)
signal player_died
signal shot_fired

# ============================================
# INICIALIZAÇÃO
# ============================================
func _ready():
	current_health = max_health
	
	# Configurar timer de tiro se existir
	if shoot_timer:
		shoot_timer.wait_time = fire_rate
		shoot_timer.one_shot = true
		shoot_timer.timeout.connect(_on_shoot_timer_timeout)

# ============================================
# LOOP PRINCIPAL DE FÍSICA
# ============================================
func _physics_process(delta):
	# Aplicar gravidade
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Pular
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_force
	
	# Movimento horizontal
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed
	
	# Atualizar direção do sprite
	if direction != 0:
		facing_right = direction > 0
		_update_sprite_direction()
	
	# Atirar
	if Input.is_action_just_pressed("ui_select") or Input.is_action_just_pressed("shoot"):
		shoot()
	
	# Mover
	move_and_slide()

# ============================================
# SISTEMA DE TIRO
# ============================================
func shoot():
	if not can_shoot or bullet_scene == null:
		return
	
	can_shoot = false
	
	# Criar o tiro
	var bullet = bullet_scene.instantiate()
	
	# Posição do tiro
	if shoot_point:
		bullet.global_position = shoot_point.global_position
	else:
		bullet.global_position = global_position
	
	# Direção do tiro
	if bullet.has_method("set_direction"):
		bullet.set_direction(1 if facing_right else -1)
	elif "direction" in bullet:
		bullet.direction = 1 if facing_right else -1
	
	# Adicionar à cena
	get_tree().current_scene.add_child(bullet)
	
	shot_fired.emit()
	
	# Timer para próximo tiro
	if shoot_timer:
		shoot_timer.start()
	else:
		await get_tree().create_timer(fire_rate).timeout
		can_shoot = true

func _on_shoot_timer_timeout():
	can_shoot = true

# ============================================
# SISTEMA DE VIDA
# ============================================
func take_damage(amount: int = 1):
	current_health -= amount
	health_changed.emit(current_health)
	
	if current_health <= 0:
		die()

func heal(amount: int = 1):
	current_health = min(current_health + amount, max_health)
	health_changed.emit(current_health)

func die():
	player_died.emit()
	# Você pode adicionar animação de morte aqui
	queue_free()

# ============================================
# FUNÇÕES AUXILIARES
# ============================================
func _update_sprite_direction():
	if sprite:
		sprite.flip_h = not facing_right
	if animated_sprite:
		animated_sprite.flip_h = not facing_right
