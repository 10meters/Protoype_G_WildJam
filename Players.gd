extends TileMap
var pick = -1
var should_move = false
var move_to
var delete 
var B = {
	#classic Pawn Movement but +2
	#can capture 
	reach = 2,
	tile_index = 2,
	moved = false}
var F = {
	#can lock an X axis based on graph y = X
	x_ = 0,
	y_ = 0,
	tile_index = 1,
	moved = false}
var M = {
	#can lock a Y axis based on graph x = Y
	x_ = 0,
	y_ = 0,
	tile_index = 0,
	moved = false}

func _process(delta):
	if Input.is_action_pressed("left_click"):
		move_to = get_clicked()#get a position to move to
		if pick != -1:
			set_cellv(delete,-1)
			set_cellv(move_to, pick)#move
			pick = -1
		pick =  get_cellv(get_clicked())#click a piece to move
		should_move = true
		delete = get_clicked()





func get_clicked():
	var value
	value = world_to_map(get_global_mouse_position())
	value.x -= 1
	value.y -= 2
	return value

func _ready():
	set_cell(0,0, 2)