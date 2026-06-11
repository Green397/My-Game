extends Node2D

var screen_size

@export var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	global_position.x= 300
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	show()
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("Movement_Up"):
		velocity.y -= 2000
	if Input.is_action_just_released("Movement_Up"):
		velocity.y = 0
	if not Input.is_action_just_pressed("Movement_Up"):
		velocity.y += 200
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
