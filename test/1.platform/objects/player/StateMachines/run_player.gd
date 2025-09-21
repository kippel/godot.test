extends State

func state_enter_state(_msg := {}):
	owner.label.text = "run"
	

func state_physics_process(_delta):
	owner.anim.play("run")
	
	var dir = Input.get_axis("un_ui_a", "un_ui_d")
	#print(dir)
	#owner.detectar()
	owner.player.flip_h = dir < 0 if dir != 0 else owner.player.flip_h 
	if not owner.is_on_floor():
		owner.velocity.y += owner.gravity * _delta
	
	owner.velocity.x = dir * owner.SPEED
	owner.move_and_slide()
	
	
	
	if dir == 0:
		state_machine.transition_to("idle")
	elif !owner.is_on_floor():
		state_machine.transition_to("jump")
	elif Input.is_action_just_pressed("ui_accept"):
		state_machine.transition_to("jump", { Salto = true})
