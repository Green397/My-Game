extends CharacterBody2D

var screen_size

@export var speed = 400

var starting_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	global_position.x= 300
	starting_position = global_position
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
	#Controls Inputs
	
	position += velocity * delta #Keeps Screen Borders
	position = position.clamp(Vector2.ZERO, screen_size)
	
	move_and_slide()
	
func reset_position(_on_body_entered):
	global_position = starting_position
	 
	
