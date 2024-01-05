extends CharacterBody2D

var SPEED = 30
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false

func _physics_process(delta):
	#Gravity
	velocity.y += gravity * delta
	if chase == true:
		if get_node("AnimatedSprite2D").animation != "death":
			get_node("AnimatedSprite2D").play("jump")
		player = get_node("../../Player/Player")
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = direction.x * SPEED
	else:
		get_node("AnimatedSprite2D").play("idle")
		velocity.x = 0
	move_and_slide()

func _on_playerdetect_body_entered(body):
	if body.name == "Player":
		chase = true


func _on_playerdetect_body_exited(body):
	if body.name == "Player":
		chase = false


#Player attacks frog
func _on_playerdeath_body_entered(body):
	if body.name == "Player":
		get_node("AnimatedSprite2D").play("death")
		await get_node("AnimatedSprite2D").animation_finished
		self.queue_free()
		Game.gold += 3
		Game.frog += 1
		Utils.saveGame()

#Dealing damage to player
func _on_playercollision_body_entered(body):
	if body.name == "Player":
		body.get_node("AnimatedSprite2D").play("death")
		Game.playerHP -= 2 
