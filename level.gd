extends Node2D

@onready var Player = $Player as RigidBody2D;

var isDragging: bool = false;
var direction: Vector2 = Vector2.UP;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _draw() -> void:
	if isDragging:
		var from = Player.position;
		var mouse = get_local_mouse_position();
		var offset = mouse - from;
		var to = mouse + (-offset * 2);
		direction = -offset;
		draw_line(from, to, Color.RED, 1.0);

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and isDragging:
		queue_redraw();
	
	if event.is_action_pressed("LeftMouseButton"):
		isDragging = true;
		queue_redraw();
	
	if event.is_action_released("LeftMouseButton"):
		isDragging = false;
		Player.ApplyForce(direction);
		queue_redraw();
