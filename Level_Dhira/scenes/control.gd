extends Control

# Member variables here, examples:
var scroll_speed = Vector2(50, 0)
var texture_rect

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Access the TextureRect node
	if not texture_rect:
		texture_rect = $TextureRect

	# Update the texture offset based on time and speed
	var offset = texture_rect.rect_position
	offset.x += scroll_speed.x * delta
	offset.y += scroll_speed.y * delta

	# Apply the new offset to create the scrolling effect
	texture_rect.rect_position = offset

	# Reset the offset if it goes beyond the image size
	if offset.x > texture_rect.texture.get_width():
		offset.x = 0
	if offset.y > texture_rect.texture.get_height():
		offset.y = 0
