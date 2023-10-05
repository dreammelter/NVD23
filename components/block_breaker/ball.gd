class_name Ball
extends CharacterBody2D
## Ball class with manually implemented "physics"


signal ball_lost(ball_id, is_super)

@export_category("Status Flags")
## Did an enemy launch this ball?
@export var is_dangerous := false

## Super Ball mode
@export var is_super := false

@export_group("Attack Data")
# using integers to keep it simple
## base amount of damage the ball deals to blocks/enemies
@export var base_attack_pt: int = 10

## How much more damage does going super do?
@export var super_attack_multiplier := 2.0

@export_group("Speed Settings")
## How fast should this thing move?
@export var base_speed := 250.0
## How much faster should this thing move when super?
@export var super_speed_multiplier := 1.5

## Use this for adjusting/calculating the damage to be dealt
var _dmg_dealt: int = base_attack_pt
## Use this for adjusting/calculating the ball's speed
var _ball_speed: float = base_speed

## Ball should go poof for whatever reason
var _is_gone := false

@onready var anim_sprite = $AnimatedSprite as AnimatedSprite2D


func _ready() -> void:
	# play the main anim
	if not is_dangerous:
		anim_sprite.play("safe_main")
	else:
		anim_sprite.play("dangerous_main")


func _physics_process(delta) -> void:
	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta
	
	# handle movement first
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())

	pass


func _process(delta) -> void:
	if _is_gone:
		destroy()


## Move in the direction it is fired in
# this'll do but I wonder how we get this info back into the physics process
# maybe I should send this thru _ready and use signals or something?
func launch(direction: Vector2) -> void:
	position = direction
	velocity = Vector2(direction).normalized() * _ball_speed
	prints("BALL: starting at", direction, "moving at", velocity)


func destroy():
	anim_sprite.play("pop")
	emit_signal("ball_lost",get_instance_id(),is_super)

# this could be made more generic but this is simple + straightfwd
func pacify():
	# dangerous ball collides with safe paddle:
	if is_super: # and player is also Super (Sugar Rushed)
		anim_sprite.play("safe_super")
	elif is_dangerous:
		anim_sprite.play("safe_main")
	
	is_dangerous = false


func endanger():
	# safe ball collides with dangerous paddle:
	is_dangerous = true
	
	# if dangerous paddle wielder is super but ball is not
	# make the ball super
	# otherwise:
	anim_sprite.play("dangerous_main")


## up attack power and change animation
func power_up():
	anim_sprite.play("super")
	pass


## reset attack power and change animation
func power_down():
	
	anim_sprite.play("main")
	pass
