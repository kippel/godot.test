extends State

func state_enter_state(msg := {}):
	owner.label.text = "jump"
	if msg.has("Salto"):
		
		owner.velocity.y -= owner.JUMP
	owner.anim.play("jump") #"idle")

func state_process(_delta):
	var dir = Input.get_axis("un_ui_a", "un_ui_d")
	
	owner.player.flip_h = dir < 0 if dir != 0 else owner.player.flip_h 
	
	owner.velocity.x = dir * owner.SPEED
	
	
	owner.velocity.y += owner.gravity * _delta
	
	owner.move_and_slide()
	
	if owner.is_on_floor():
		state_machine.transition_to("idle")
