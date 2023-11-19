extends Camera3D

@onready var initalCameraState = global_transform

@export var speed = 15.0

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("reset"):
		global_transform = initalCameraState
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x +=( int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left")) ) * speed * delta
	position.z +=( int(Input.is_action_pressed("out")) - int(Input.is_action_pressed("in")) ) * speed * delta
	position.y +=( int(Input.is_action_pressed("up")) - int(Input.is_action_pressed("down")) ) * speed * delta
	
