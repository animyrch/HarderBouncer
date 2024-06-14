extends ColorRect

var velocity = Vector2(200, 150)  # Initial speed
var speed_multiplier = 1.1  # Speed increase multiplier

func _ready():
	randomize()  # Ensure randomness for initial position
	position = Vector2(randi() % int(get_viewport().size.x - get_rect().size.x), randi() % int(get_viewport().size.y - get_rect().size.y))

func _process(delta):
	position += velocity * delta

	# Bounce off the edges of the screen
	if position.x <= 0 or position.x + get_rect().size.x >= get_viewport().size.x:
		velocity.x = -velocity.x
	if position.y <= 0 or position.y + get_rect().size.y >= get_viewport().size.y:
		velocity.y = -velocity.y

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.position.x >= position.x and event.position.x <= position.x + get_rect().size.x and event.position.y >= position.y and event.position.y <= position.y + get_rect().size.y:
			velocity *= speed_multiplier  # Increase speed when clicked
			change_color()  # Change color when clicked

func change_color():
	modulate = Color(randf(), randf(), randf(), 1.0)  # Set to a random color
