extends Node




var spawn_array: Array = [
	{
		"name": "IL113",
		"type": RadarObjectTypes.type.CIVILIAN,
		"spawn_time": 15,
		"spawn_point": "CivilianAirlinesSouthToEast"
	},
	{
		"name": "TR442",
		"type": RadarObjectTypes.type.CIVILIAN,
		"spawn_time": 27,
		"spawn_point": "CivilianAirlinesEastToSouth"
	},
		{
		"name": "IL313",
		"type": RadarObjectTypes.type.CIVILIAN,
		"spawn_time": 29,
		"spawn_point": "CivilianAirlinesWestToEast"
	},
		{
		"name": "LI264",
		"type": RadarObjectTypes.type.ENEMY_AIR,
		"spawn_time": 91,
		"spawn_point": "CivilianAirlinesWestToEast"
	},
	{
		"name": "IL264",
		"type": RadarObjectTypes.type.CIVILIAN,
		"spawn_time": 91,
		"spawn_point": "CivilianAirlinesSouthToEast"
	},
	{
		"name": "TR264",
		"type": RadarObjectTypes.type.CIVILIAN,
		"spawn_time": 95,
		"spawn_point": "CivilianAirlinesEastToWest"
	},
	{
		"name": "IL121", # This is a meditransport with conversation
		"type": RadarObjectTypes.type.CIVILIAN,
		"spawn_time": 165,
		"spawn_point": "CivilianAirlinesEastToWest"
	},
	{
		"name": "IL411", 
		"type": RadarObjectTypes.type.ENEMY_AIR,
		"spawn_time": 170,
		"spawn_point": "CivilianAirlinesEastToSouth"
	},
	{
		"name": "HYPERSONIC MISSILE", 
		"type": RadarObjectTypes.type.ENEMY_HYPERSONIC,
		"spawn_time": 210,
		"spawn_point": "NorthBarrageLeft"
	},
	
	{
		"name": "IL422", 
		"type": RadarObjectTypes.type.CIVILIAN,
		"spawn_time": 212,
		"spawn_point": "CivilianAirlinesEastToSouth"
	},
	
	{
		"name": "HYPERSONIC MISSILE",
		"type": RadarObjectTypes.type.ENEMY_HYPERSONIC,
		"spawn_time": 312,
		"spawn_point": "NorthBarrageLeft"
	},
	{
		"name": "HYPERSONIC MISSILE",
		"type": RadarObjectTypes.type.ENEMY_HYPERSONIC,
		"spawn_time": 312,
		"spawn_point": "NorthBarrageRight"
	},
	{
		"name": "HYPERSONIC MISSILE",
		"type": RadarObjectTypes.type.ENEMY_HYPERSONIC,
		"spawn_time": 322,
		"spawn_point": "SouthBarrageRight"
	},
	{
		"name": "IL312",
		"type": RadarObjectTypes.type.CIVILIAN,
		"spawn_time": 342,
		"spawn_point": "CivilianAirlinesSouthToEast"
	},
	
	{
		"name": "???",
		"type": RadarObjectTypes.type.GLITCH,
		"spawn_time": 362,
		"spawn_point": "GlitchSpawnBL2"
	},
	
		{
		"name": "BR213",
		"type": RadarObjectTypes.type.ENEMY_AIR,
		"spawn_time": 392,
		"spawn_point": "CivilianAirlinesSouthToEast"
	},
	
	{
		"name": "BR313",
		"type": RadarObjectTypes.type.ENEMY_AIR,
		"spawn_time": 402,
		"spawn_point": "CivilianAirlinesEastToSouth"
	},
	
	{
		"name": "IL313",
		"type": RadarObjectTypes.type.CIVILIAN,
		"spawn_time": 422,
		"spawn_point": "CivilianAirlinesWestToEast"
	},
	
	{
		"name": "IL449",
		"type": RadarObjectTypes.type.CIVILIAN,
		"spawn_time": 452,
		"spawn_point": "CivilianAirlinesEastToWest"
	},
	
	# GLITCH WAVE

	{
		"name": "???",
		"type": RadarObjectTypes.type.GLITCH,
		"spawn_time": 500,
		"spawn_point": "GlitchSpawnBL1"
	},
		{
		"name": "???",
		"type": RadarObjectTypes.type.GLITCH,
		"spawn_time": 500,
		"spawn_point": "GlitchSpawnBL2"
	},
		{
		"name": "???",
		"type": RadarObjectTypes.type.GLITCH,
		"spawn_time": 510,
		"spawn_point": "GlitchSpawnBR1"
	},
		{
		"name": "???",
		"type": RadarObjectTypes.type.GLITCH,
		"spawn_time": 505,
		"spawn_point": "GlitchSpawnBR1"
	},
		{
		"name": "???",
		"type": RadarObjectTypes.type.GLITCH,
		"spawn_time": 507,
		"spawn_point": "GlitchSpawnTR"
	},
		{
		"name": "???",
		"type": RadarObjectTypes.type.GLITCH,
		"spawn_time": 512,
		"spawn_point": "GlitchSpawnTL1"
	},
		{
		"name": "???",
		"type": RadarObjectTypes.type.GLITCH,
		"spawn_time": 516,
		"spawn_point": "GlitchSpawnTL1"
	},
	
	# End Glitch wave
	{
		"name": "IL141",
		"type": RadarObjectTypes.type.CIVILIAN,
		"spawn_time": 556,
		"spawn_point": "CivilianAirlinesWestToEast"
	},
	{
		"name": "IL126",
		"type": RadarObjectTypes.type.CIVILIAN,
		"spawn_time": 586,
		"spawn_point": "CivilianAirlinesWestToEast"
	},
		{
		"name": "IL146",
		"type": RadarObjectTypes.type.CIVILIAN,
		"spawn_time": 616,
		"spawn_point": "CivilianAirlinesWestToEast"
	},
	
		{
		"name": "IL176",
		"type": RadarObjectTypes.type.ENEMY_AIR,
		"spawn_time": 646,
		"spawn_point": "CivilianAirlinesWestToEast"
	},
			{
		"name": "IL196",
		"type": RadarObjectTypes.type.ENEMY_AIR,
		"spawn_time": 646,
		"spawn_point": "CivilianAirlinesEastToWest"
	},
	{
		"name": "IL145",
		"type": RadarObjectTypes.type.ENEMY_AIR,
		"spawn_time": 656,
		"spawn_point": "CivilianAirlinesSouthToEast"
	},
	
	{
		"name": "HYPERSONIC MISSILE",
		"type": RadarObjectTypes.type.ENEMY_HYPERSONIC,
		"spawn_time": 696,
		"spawn_point": "NorthBarrageLeft"
	},
	
		{
		"name": "HYPERSONIC MISSILE",
		"type": RadarObjectTypes.type.ENEMY_HYPERSONIC,
		"spawn_time": 698,
		"spawn_point": "NorthBarrageRight"
	},
	
	{
		"name": "HYPERSONIC MISSILE",
		"type": RadarObjectTypes.type.ENEMY_HYPERSONIC,
		"spawn_time": 702,
		"spawn_point": "NorthBarrageLeft"
	},
	
		{
		"name": "???",
		"type": RadarObjectTypes.type.GLITCH,
		"spawn_time": 707,
		"spawn_point": "GlitchSpawnBL1"
	},
	
		{
		"name": "HYPERSONIC MISSILE",
		"type": RadarObjectTypes.type.ENEMY_HYPERSONIC,
		"spawn_time": 712,
		"spawn_point": "SouthBarrageLeft"
	},
	
			{
		"name": "HYPERSONIC MISSILE",
		"type": RadarObjectTypes.type.ENEMY_HYPERSONIC,
		"spawn_time": 716,
		"spawn_point": "SouthBarrageRight"
	},
	
	

]
