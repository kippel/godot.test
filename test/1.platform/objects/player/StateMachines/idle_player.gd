extends State

func state_enter_state(_msg := {}):
	#owner.anim.play("idle") #"idle")
	owner.label.text = "idle"
	pass
	
func state_process(_delta):
	owner.anim.play("idle")
	#if owner.weapon_un:
	#	state_machine.transition_to("idle_weapon")
	
	
	var _dir = Input.get_axis("un_ui_a", "un_ui_d")
	#owner.detectar()
	owner.move_and_slide()
	if not owner.is_on_floor():
		#print("fff")
		print("dddd")
		owner.velocity.y += owner.gravity * _delta
	#print(dir != 0)
	
	if _dir != 0:
		state_machine.transition_to("run")
	
	elif !owner.is_on_floor():
		state_machine.transition_to("jump")
##		#print("jump")
	elif Input.is_action_just_pressed("ui_accept"):
		state_machine.transition_to("jump", { Salto = true})
##		#print("jump salto")	
##	elif Input.is_action_just_released("ui_f") and owner.AIRS:
##		#print("ffffff")
##		state_machine.transition_to("airs")
	#owner.Detectar()
