LIST FITUR YANG SAYA TAMBAHKAN 

Animasi walk, crouch & idle 
    Saya menambahkan children note "animatedsprite2D" pada scene player, lalu menambahkan animatien idle, crouch & walk
    lalu saya menambahkan kode ini : 	
    if Input.is_action_pressed("ui_left"):
		move_direction = -1
		sprite.flip_h = true
		if not is_crouching:
			sprite.play("walk")
	elif Input.is_action_pressed("ui_right"):
		move_direction = 1
		sprite.flip_h = false
		if not is_crouching:
			sprite.play("walk")
   untuk mengaktifkan animasi ketika player melakukan sesuatu