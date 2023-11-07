extends Camera3D

@onready var initalCameraState = global_transform

@export var speed = 24.0

var dragMousePos
var dragStartPos
var dragging = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$ScreenRef.get_local_mouse_position()
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("reset"):
		global_transform = initalCameraState
	if event.is_action_pressed("LMB") and !dragging:
		dragging = true
		dragStartPos = $ScreenRef.get_local_mouse_position()
	if event.is_action_released("LMB"):
		dragging = false
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x +=( int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left")) ) * speed * delta
	position.z +=( int(Input.is_action_pressed("out")) - int(Input.is_action_pressed("in")) ) * speed * delta
	position.y +=( int(Input.is_action_pressed("up")) - int(Input.is_action_pressed("down")) ) * speed * delta
	
	if dragging :
		dragMousePos = $ScreenRef.get_local_mouse_position()
		rotation.y = (dragMousePos.x - dragStartPos.x) * 0.005
		rotation.x = (dragMousePos.y - dragStartPos.y) * 0.005
