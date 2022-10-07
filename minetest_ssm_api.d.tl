
global enum PlayerControlKey
	"up"
	"down"
	"left"
	"right"
	"jump"
	"aux1"
	"sneak"
	"dig"
	"place"
	"LMB"
	"RMB"
	"zoom"
end

global record ObjectRef
	userdata
	is_player: function(self: ObjectRef): boolean
	is_fake_player: boolean
	get_luaentity: function(self: ObjectRef): table
	get_pos: function(self: ObjectRef): vector
	get_velocity: function(self: ObjectRef): vector
	set_velocity: function(self: ObjectRef, vel: vector)
	set_acceleration: function(self: ObjectRef, acc: vector)
	get_player_control: function(self: ObjectRef): {PlayerControlKey : boolean}
	get_inventory: function(self: ObjectRef): InvRef
	get_player_name: function(self: ObjectRef): string
	get_hp: function(self: ObjectRef): number
end

global record MetaRef
	userdata
	to_table: function(self: MetaRef): table
end

global record InvRef
	userdata
	room_for_item: function(self: InvRef, listname: string, stack: ItemStack): boolean
end

global record vector
	x: number
	y: number
	z: number

	equals: function(v1: vector, v2: vector): boolean
	add: function(v1: vector, v2: vector): vector
	subtract: function(v1: vector, v2: vector): vector
	multiply: function(v1: vector, v2: vector | number): vector
	distance: function(v1: vector, v2: vector): number
end

global enum NodeDrawtype
	"normal"
	"airlike"
	"liquid"
	"flowingliquid"
	"glasslike"
	"glasslike_framed"
	"glasslike_framed_optional"
	"allfaces"
	"allfaces_optional"
	"torchlike"
	"signlike"
	"plantlike"
	"firelike"
	"fencelike"
	"raillike"
	"nodebox"
	"mesh"
	"plantlike_rooted"
end

global record SimpleSoundSpecTable
	name: string
	gain: number
	pitch: number
	fade: number
end

global record SoundParameterTable
	gain: number
	pitch: number
	fade: number
	loop: boolean
	pos: vector
	object: ObjectRef
	exclude_player: string
	to_player: string
	max_hear_distance: number
end

global record ItemStack
	userdata
	metamethod __call: function(ItemStack, string | ItemStack): ItemStack
	get_count: function(self: ItemStack): integer
	get_wear: function(self: ItemStack): number
	get_meta: function(self: ItemStack): MetaRef
	get_name: function(self: ItemStack): string
end

global enum PointedThingType
	"nothing"
	"node"
	"object"
end

global record PointedThing
	type: PointedThingType
	above: vector
	under: vector
	ref: ObjectRef
	intersection_point: vector
	box_id: integer
	intersection_normal: vector
end

global record Node
	name: string
	param1: integer
	param2: integer
end

global record ToolCapabilities
	full_punch_interval: number
	max_drop_level: number
	--~ groupcaps: {string : record
			--~ times: {number}
			--~ uses: number
			--~ maxlevel: number
		--~ end}
	groupcaps: table
	damage_groups: {string : number}
	punch_attack_uses: nil | number
end

global record ItemDefSound
	breaks:        string | SimpleSoundSpecTable
	eat:           string | SimpleSoundSpecTable
	punch_use:     string | SimpleSoundSpecTable
	punch_use_air: string | SimpleSoundSpecTable
end

global record NodeDefSounds
	footstep:     string | SimpleSoundSpecTable
	dig:          string | SimpleSoundSpecTable
	dug:          string | SimpleSoundSpecTable
	place:        string | SimpleSoundSpecTable
	place_failed: string | SimpleSoundSpecTable
	fall:         string | SimpleSoundSpecTable
end

global enum NodeBoxesType
	"regular"
	"fixed"
	"leveled"
	"wallmounted"
	"connected"
end

global record NodeBoxes
	type: NodeBoxesType
	fixed:               {number, number, number, number, number, number} | {{number, number, number, number, number, number}}
	wall_top:            {number, number, number, number, number, number} | {{number, number, number, number, number, number}}
	wall_bottom:         {number, number, number, number, number, number} | {{number, number, number, number, number, number}}
	wall_side:           {number, number, number, number, number, number} | {{number, number, number, number, number, number}}
	connect_top:         {number, number, number, number, number, number} | {{number, number, number, number, number, number}}
	connect_bottom:      {number, number, number, number, number, number} | {{number, number, number, number, number, number}}
	connect_front:       {number, number, number, number, number, number} | {{number, number, number, number, number, number}}
	connect_left:        {number, number, number, number, number, number} | {{number, number, number, number, number, number}}
	connect_back:        {number, number, number, number, number, number} | {{number, number, number, number, number, number}}
	connect_right:       {number, number, number, number, number, number} | {{number, number, number, number, number, number}}
	disconnected_top:    {number, number, number, number, number, number} | {{number, number, number, number, number, number}}
	disconnected_bottom: {number, number, number, number, number, number} | {{number, number, number, number, number, number}}
	disconnected_front:  {number, number, number, number, number, number} | {{number, number, number, number, number, number}}
	disconnected_left:   {number, number, number, number, number, number} | {{number, number, number, number, number, number}}
	disconnected_back:   {number, number, number, number, number, number} | {{number, number, number, number, number, number}}
	disconnected_right:  {number, number, number, number, number, number} | {{number, number, number, number, number, number}}
	disconnected:        {number, number, number, number, number, number} | {{number, number, number, number, number, number}}
	disconnected_sides:  {number, number, number, number, number, number} | {{number, number, number, number, number, number}}
end

global enum NodeDefConnectedSide
	"top"
	"bottom"
	"front"
	"left"
	"back"
	"right"
end

global enum NodeDefLiquidType
	"none"
	"source"
	"flowing"
end

global enum NodeDefParamtype1
	"none"
	"light"
end

global enum NodeDefParamtype2
	"none"
	"flowingliquid"
	"wallmounted"
	"facedir"
	"4dir"
	"leveled"
	"degrotate"
	"meshoptions"
	"color"
	"colorfacedir"
	"color4dir"
	"colorwallmounted"
	"glasslikeliquidlevel"
	"colordegrotate"
end

global enum NodeDefUseTextureAlpha
	"opaque"
	"clip"
	"blend"
end

global record ItemDef
	description: string
	short_description: string
	groups: {string: integer}
	inventory_image: string
	inventory_overlay: string
	wield_image: string
	wield_overlay: string
	wield_scale: vector
	palette: string
	color: string
	stack_max: integer
	range: number
	liquids_pointable: boolean
	light_source: integer
	tool_capabilities: ToolCapabilities
	node_placement_prediction: nil | string
	node_dig_prediction: string
	sound: ItemDefSound
	on_place:               function(itemstack: ItemStack, placer:  ObjectRef | nil, pointed_thing: PointedThing):      nil | ItemStack | string
	on_secondary_use: nil | function(itemstack: ItemStack, user:    ObjectRef | nil, pointed_thing: PointedThing):      nil | ItemStack | string
	on_drop:                function(itemstack: ItemStack, dropper: ObjectRef | nil, pos: vector):                      ItemStack | string
	on_pickup:              function(itemstack: ItemStack, picker:  ObjectRef | nil, pointed_thing: PointedThing,
			time_from_last_punch: number | nil, tool_capabilities: table | nil, dir: vector, damage: number):           nil | ItemStack | string
	on_use:           nil | function(itemstack: ItemStack, user:    ObjectRef | nil, pointed_thing: PointedThing):      nil | ItemStack | string
	after_use:        nil | function(itemstack: ItemStack, user:    ObjectRef | nil, node: Node, digparams: table):     nil | ItemStack | string
end

global record NodeDef
	-- copy from ItemDef:
	description: string
	short_description: string
	groups: {string: integer}
	inventory_image: string
	inventory_overlay: string
	wield_image: string
	wield_overlay: string
	wield_scale: vector
	palette: string
	color: any
	stack_max: integer
	range: number
	liquids_pointable: boolean
	light_source: integer
	tool_capabilities: ToolCapabilities
	node_placement_prediction: nil | string
	node_dig_prediction: string
	sound: ItemDefSound
	on_place:               function(itemstack: ItemStack, placer:  ObjectRef | nil, pointed_thing: PointedThing):      nil | ItemStack | string
	on_secondary_use: nil | function(itemstack: ItemStack, user:    ObjectRef | nil, pointed_thing: PointedThing):      nil | ItemStack | string
	on_drop:                function(itemstack: ItemStack, dropper: ObjectRef | nil, pos: vector):                      ItemStack | string
	on_pickup:              function(itemstack: ItemStack, picker:  ObjectRef | nil, pointed_thing: PointedThing,
			time_from_last_punch: number | nil, tool_capabilities: table | nil, dir: vector, damage: number):           nil | ItemStack | string
	on_use:           nil | function(itemstack: ItemStack, user:    ObjectRef | nil, pointed_thing: PointedThing):      nil | ItemStack | string
	after_use:        nil | function(itemstack: ItemStack, user:    ObjectRef | nil, node: Node, digparams: table):     nil | ItemStack | string

	drawtype: NodeDrawtype
	visual_scale: number
	tiles: {string | table}
	overlay_tiles: {string | table}
	special_tiles: {string | table}
	use_texture_alpha: NodeDefUseTextureAlpha
	post_effect_color: any
	paramtype: NodeDefParamtype1
	paramtype2: NodeDefParamtype2
	place_param2: integer
	is_ground_content: boolean
	sunlight_propagates: boolean
	walkable: boolean
	pointable: boolean
	diggable: boolean
	climbable: boolean
	move_resistance: number
	buildable_to: boolean
	floodable: boolean
	liquidtype: NodeDefLiquidType
	liquid_alternative_flowing: string
	liquid_alternative_source: string
	liquid_viscosity: number
	liquid_renewable: boolean
	liquid_move_physics: nil | boolean
	leveled: number
	leveled_max: number
	liquid_range: integer
	drowning: number
	damage_per_second: number
	node_box: NodeBoxes
	connects_to: {string} | string
	connect_sides: {NodeDefConnectedSide}
	mesh: string
	selection_box: NodeBoxes
	collision_box: NodeBoxes
	legacy_facedir_simple: boolean
	legacy_wallmounted: boolean
	waving: integer
	sounds: NodeDefSounds
	drop: string | table
	on_construct: nil | function(pos: vector)
	on_destruct: nil | function(pos: vector)
	after_destruct: nil | function(pos: vector, oldnode: Node)
	on_flood: nil | function(pos: vector, oldnode: Node, newnode: Node): boolean | nil
	preserve_metadata: nil | function(pos: vector, oldnode: Node, oldmeta: table, drops: {ItemStack})
	after_place_node: nil | function(pos: vector, placer: ObjectRef | nil, itemstack: ItemStack, pointed_thing: PointedThing)
	after_dig_node: nil | function(pos: vector, oldnode: Node, oldmetadata: table, digger: ObjectRef)
	can_dig: nil | function(pos: vector, player: ObjectRef): boolean
	on_punch: function(pos: vector, node: Node, puncher: ObjectRef, pointed_thing: PointedThing)
	on_rightclick: nil | function(pos: vector, node: Node, clicker: ObjectRef, itemstack: ItemStack, pointed_thing: PointedThing): ItemStack
	on_dig: function(pos: vector, node: Node, digger: ObjectRef): boolean
	on_timer: nil | function(pos: vector, elapsed: number): boolean | nil
	on_receive_fields: nil | function(pos: vector, formname: string, fields: {string : string}, sender: ObjectRef)
	allow_metadata_inventory_move: nil | function(pos: vector, from_list: string, from_index: integer,
			to_list: string, to_index: integer, count: number, player: ObjectRef): integer
	allow_metadata_inventory_put:  nil | function(pos: vector, listname: string, index: integer, stack: ItemStack, player: ObjectRef): integer
	allow_metadata_inventory_take: nil | function(pos: vector, listname: string, index: integer, stack: ItemStack, player: ObjectRef): integer
	on_metadata_inventory_move: nil | function(pos: vector, from_list: string, from_index: integer,
			to_list: string, to_index: integer, count: number, player: ObjectRef)
	on_metadata_inventory_put:  nil | function(pos: vector, listname: string, index: integer, stack: ItemStack, player: ObjectRef)
	on_metadata_inventory_take: nil | function(pos: vector, listname: string, index: integer, stack: ItemStack, player: ObjectRef)
	on_blast: nil | function(pos: vector, intensity: number)
	mod_origin: string
end

global record minetest
	get_us_time: function(): integer
	colorspec_to_colorstring: function(any): string
	inventorycube: function(img1: string, img2: string, img3: string): string
	sound_play: function(spec: string | SimpleSoundSpecTable, parameters: table, ephemeral: boolean): integer
	add_particle: function(def: any)
	add_item: function(pos: vector, item: ItemStack | string): ObjectRef
	handle_node_drops: function(pos: vector, drops: {ItemStack}, digger: ObjectRef)
	log: function(level_or_msg: string, msg: string)
	after: function(time: number, func: function(...: any), ...: any)
	get_connected_players: function(): {ObjectRef}
	get_objects_inside_radius: function(pos: vector, radius: number): {ObjectRef}
	get_player_privs: function(player_name: string): {string : boolean}

	registered_entities: {string: table}
	registered_nodes: {string: NodeDef}
	registered_items: {string: ItemDef}

	record settings
		userdata
		get: function(self: settings, key: string): string
		get_bool: function(self: settings, key: string, default: boolean): boolean
	end
end

global dump: function(any): string
