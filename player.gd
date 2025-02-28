extends CharacterBody2D
@export var walk_speed = 200
@export var gravity = 200.0
@export var jump_speed = -300
@onready var sprite = $AnimatedSprite2D  # Pastikan node AnimatedSprite2D ada sebagai child dari CharacterBody2D

var jumps_left = 2  # Menyimpan jumlah lompatan yang tersisa

# Called every frame. 'delta' is the elapsed time since the previous frame.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		velocity.x = -walk_speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = walk_speed
	else:
		velocity.x = 0
	move_and_slide()

func _physics_process(delta):
	velocity.y += delta * gravity

	if is_on_floor():
		jumps_left = 2  # Reset jumlah lompatan saat menyentuh tanah

	if Input.is_action_just_pressed("ui_up") and jumps_left > 0:
		velocity.y = jump_speed
		jumps_left -= 1  # Mengurangi jumlah lompatan yang tersisa

	if Input.is_action_pressed("ui_left"):
		velocity.x = -walk_speed
		sprite.flip_h = true  # Balik sprite jika berjalan ke kiri
		sprite.play("walk")
	elif Input.is_action_pressed("ui_right"):
		velocity.x = walk_speed
		sprite.flip_h = false  # Kembali ke posisi normal jika berjalan ke kanan
		sprite.play("walk")
	else:
		velocity.x = 0
		sprite.play("idle")  # Jika tidak bergerak, mainkan animasi idle

	move_and_slide()
