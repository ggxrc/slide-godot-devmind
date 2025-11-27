extends CharacterBody2D
class_name Enemy

## Script do Inimigo - Funciona independente do contexto
## Use este script no seu projeto de jogo!

# ============================================
# CONFIGURAÇÕES (ajuste no Inspector)
# ============================================
@export_group("Movimento")
@export var speed: float = 100.0
@export var gravity: float = 980.0
@export var patrol_distance: float = 200.0  # Distância de patrulha

@export_group("Comportamento")
@export_enum("Patrol", "Chase", "Static") var behavior: int = 0
@export var chase_range: float = 300.0      # Alcance para perseguir
@export var attack_range: float = 50.0       # Alcance para atacar

@export_group("Combate")
@export var max_health: int = 2
@export var damage: int = 1
@export var attack_cooldown: float = 1.0

var current_health: int

# ============================================
# VARIÁVEIS INTERNAS
# ============================================
var start_position: Vector2
var patrol_direction: int = 1
var can_attack: bool = true
var target: Node2D = null  # Player para perseguir

# Referências opcionais
@onready var sprite = get_node_or_null("Sprite2D")
@onready var animated_sprite = get_node_or_null("AnimatedSprite2D")
@onready var detection_area = get_node_or_null("DetectionArea")

# ============================================
# SINAIS
# ============================================
signal health_changed(new_health: int)
signal enemy_died
signal attacked_player

# ============================================
# INICIALIZAÇÃO
# ============================================
func _ready():
	current_health = max_health
	start_position = global_position
	
	# Configurar área de detecção se existir
	if detection_area:
		detection_area.body_entered.connect(_on_detection_area_body_entered)
		detection_area.body_exited.connect(_on_detection_area_body_exited)
	
	# Adicionar ao grupo de inimigos
	add_to_group("enemies")

# ============================================
# LOOP PRINCIPAL DE FÍSICA
# ============================================
func _physics_process(delta):
	# Aplicar gravidade
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Comportamento baseado no tipo
	match behavior:
		0:  # Patrol
			_patrol_behavior()
		1:  # Chase
			_chase_behavior()
		2:  # Static
			velocity.x = 0
	
	# Atualizar sprite
	_update_sprite_direction()
	
	# Mover
	move_and_slide()

# ============================================
# COMPORTAMENTOS
# ============================================
func _patrol_behavior():
	velocity.x = speed * patrol_direction
	
	# Verificar limites de patrulha
	var distance_from_start = global_position.x - start_position.x
	
	if abs(distance_from_start) >= patrol_distance:
		patrol_direction *= -1
	
	# Inverter se bater na parede
	if is_on_wall():
		patrol_direction *= -1

func _chase_behavior():
	if target == null:
		# Sem alvo, patrulhar
		_patrol_behavior()
		return
	
	var distance_to_target = global_position.distance_to(target.global_position)
	
	if distance_to_target <= attack_range:
		# Perto o suficiente para atacar
		velocity.x = 0
		_try_attack()
	elif distance_to_target <= chase_range:
		# Perseguir
		var direction = sign(target.global_position.x - global_position.x)
		velocity.x = speed * direction
	else:
		# Muito longe, patrulhar
		_patrol_behavior()

func _try_attack():
	if not can_attack or target == null:
		return
	
	can_attack = false
	
	# Causar dano ao player
	if target.has_method("take_damage"):
		target.take_damage(damage)
		attacked_player.emit()
	
	# Cooldown
	await get_tree().create_timer(attack_cooldown).timeout
	can_attack = true

# ============================================
# DETECÇÃO DO PLAYER
# ============================================
func _on_detection_area_body_entered(body):
	if body.is_in_group("player") or body is Player:
		target = body

func _on_detection_area_body_exited(body):
	if body == target:
		target = null

# ============================================
# SISTEMA DE VIDA
# ============================================
func take_damage(amount: int = 1):
	current_health -= amount
	health_changed.emit(current_health)
	
	# Efeito visual de dano (piscar vermelho)
	_flash_damage()
	
	if current_health <= 0:
		die()

func _flash_damage():
	if sprite:
		sprite.modulate = Color.RED
		await get_tree().create_timer(0.1).timeout
		sprite.modulate = Color.WHITE
	elif animated_sprite:
		animated_sprite.modulate = Color.RED
		await get_tree().create_timer(0.1).timeout
		animated_sprite.modulate = Color.WHITE

func die():
	enemy_died.emit()
	# Você pode adicionar animação de morte, partículas, etc.
	queue_free()

# ============================================
# FUNÇÕES AUXILIARES
# ============================================
func _update_sprite_direction():
	var facing_right = velocity.x > 0
	
	if sprite and velocity.x != 0:
		sprite.flip_h = not facing_right
	if animated_sprite and velocity.x != 0:
		animated_sprite.flip_h = not facing_right

# Função para knockback (empurrão ao ser atingido)
func knockback(direction: Vector2, force: float = 200.0):
	velocity = direction.normalized() * force
