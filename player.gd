extends RigidBody2D

var bounceVectorUp: Vector2 = Vector2(20, -50);
var bounceVectorDown: Vector2 = Vector2(5, 60);

func _physics_process(delta: float) -> void:
	pass

func ApplyForce(dir: Vector2, angl: float = 0) -> void:
	var angle = angl if angl else get_angle_to(dir);
	var force = Vector2(
		clamp(dir.x, -100, 100),
		clamp(dir.y, -100, 100)
	);
	rotation = lerp_angle(rotation, deg_to_rad(clampf(angle, -40, 60)), 0.5);
	linear_velocity = force * 10

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		ApplyForce(bounceVectorUp, 0.1);
	if event.is_action_pressed("ui_down"):
		ApplyForce(bounceVectorDown, 60);
