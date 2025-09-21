extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const JUMP = 400

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim := $AnimationPlayer
@onready var player := $Character0001
@onready var label := $Label
