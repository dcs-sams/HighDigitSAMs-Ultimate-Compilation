-- Missile
local function calcPiercingMass(warhead)
	warhead.piercing_mass  = warhead.mass;
	if (warhead.expl_mass/warhead.mass > 0.1) then
		warhead.piercing_mass  = warhead.mass/5.0;
	end
end

local function directional_a2a_warhead(power, caliber)
    local res = {};

	res.caliber 			 = caliber
    res.expl_mass 			 = 15.5*power;
	res.mass 				 = res.expl_mass;
    res.other_factors 		 = {1, 1, 1};
    res.obj_factors 		 = {1, 1};
    res.concrete_factors 	 = {1, 1, 1};
    res.cumulative_factor 	 = 0;
    res.concrete_obj_factor	 = 0.0;
    res.cumulative_thickness = 0.0;

	calcPiercingMass(res)
    return res;
end

local TAMIR				= {
	Name				= TAMIR,
	display_name		= _('Tamir (Iron Dome)'),
	name				= "TAMIR",
	Escort				= 3,
	Head_Type			= 2,
	sigma				= {1, 1, 1},
	M					= 90.0,
	H_max				= 13716,
	H_min				= 3.0,
	Diam				= 160.0,
	Cx_pil				= 4,
	D_max				= 40000.0,
	D_min				= 600,
	Head_Form			= 1,
	Life_Time			= 110.0,
	Nr_max				= 65,
	v_min				= 100.0,
	v_mid				= 1020.9,
	Mach_max			= 2.2,
	t_b					= 0.0,
	t_acc				= 13.5,
	t_marsh				= 41.0,
	Range_max			= 70000.0,
	H_min_t				= 3.0,
	Fi_start 			= 3.14152,
	Fi_rak				= 3.14152,
	Fi_excort 			= 4.19,
	Fi_search 			= 99.99,
	OmViz_max 			= 99.99,
	Engine_Type 		= 1,
	warhead				= enhanced_a2a_warhead(11.0);
	exhaust1 			= { 1.0, 1.0, 1.0, 1.0 };
	exhaust2 			= { 1.0, 1.0, 1.0, 0.1 };
	exhaust_effect_type = 1,
	tail_scale			= 1.0, 
	X_back				= -1.45,
	Y_back				= 0.0,
	Z_back				= 0.0,
	X_back_acc			= -1.45,
	Reflection			= 0.05,
	KillDistance		= 20.0,
	ccm_k0 				= 0.2,	
	SeekerGen 			= 4,
	hoj					= 1,
	active_radar_lock_dist	= 16000.0,
	rad_correction = 1,
	radar_synced = true,
	category			= CAT_MISSILES,
	wsTypeOfWeapon		= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER};

	PN_gain = 7,
	ModelData = { 
		58, -- model params count
		0.3, -- characteristic square
		
		-- Cx dependent parameters
		0.05, -- Cx_k0 bar Cx0 on subsonic (M << 1)
		0.092,  -- Cx_k1 height of the peak of the wave crisis 
		0.014,  -- Cx_k2 steepness of the front on the approach to the wave crisis
		-0.015, -- Cx_k3 bar Cx0 at supersonic (M >> 1)
		0.72,  -- Cx_k4 steepness of the decline after the wave crisis
		1.13, -- coefficient of dumping of a polar

		-- Cy dependent parameters
		0.87, --Cy_k0 bar Сy0 at subsonic (M << 1)
		0.01, -- Cy_k1 bar Cy0 at supersonic (M >> 1)
		0.21, -- Cy_k2 steepness of the decline (front) behind the wave crisis

		0.3, -- 7 Alfa_max maximum balancing angle, radians
		0, -- angular velocity created by the moment of gas rudders
		
		--t_statr 	t_b 	t_accel 	t_march 	t_inertial 	t_break 	t_end
		0,	 		0,		13.5, 		82.6,		15,			0, 			0, 		-- time of stage, sec
		0, 			0, 		2.72, 		0.46,		0, 			0, 			0, 		-- fuel flow rate, kg/sec
		0, 			0, 		6350,	 	1150,		0, 			0, 			0, 		-- thrust, newtons
		
		120, --self destruct by timer
		110, --onboard power system operation time, sec
		0, -- absolute self-destruction altitude. Altitude of the radio fuse triggering self destruct.
		0, -- control switch-on delay after launch, sec 

		20000, -- Range to the target at the moment of launch, above which the missile will boost to climb.
		20000, -- The range to the target at any given moment, below which the missile will end the boost phase and switch to pronav
		0, -- sine of the elevation angle of the trajectory of the slide. 
		115, -- longitude acceleration of the fuse cocking
		0, -- speed module reported by the ejection device, expelling charge, etc.
		4, -- characteristic of the ACS-RAKETA system, the coefficient of the second order filter K0
		8,  -- characteristic of the SAU-RAKETA system, second-order filter coefficient K1
		1, -- characteristic of the SAU-RAKETA system, bandwidth of the control loop
		
		-- DLZ. Data for calculating launch ranges (indication on the sight), also used by AI
		0, 
		0, 
		0, 
		0, 
		0, 
		0, 
		0, 
		0, 
		0, 
		0, 
		0, 
		0, 
		0 
	},
	shape_table_data	=
	{
		{
			name		= "TAMIR";
			file		= "TAMIR";
			life		= 1;
			fire		= { 0, 1};
			username	= "Tamir";
			index		= WSTYPE_PLACEHOLDER;
		},
	}


};
declare_weapon(TAMIR)


GT_t.WS_t.IRONDOME 								= {}
GT_t.WS_t.IRONDOME.angles 						= {
												{math.rad(180), math.rad(-180), math.rad(0), math.rad(180)},
												};
GT_t.WS_t.IRONDOME.reference_angle_Z = 1.22173;
GT_t.WS_t.IRONDOME.LN 							= {}
GT_t.WS_t.IRONDOME.LN[1] 						= {}
GT_t.WS_t.IRONDOME.LN[1].type 					= 4;
GT_t.WS_t.IRONDOME.LN[1].distanceMin 			= 600;
GT_t.WS_t.IRONDOME.LN[1].distanceMax 			= 70000;
GT_t.WS_t.IRONDOME.LN[1].ECM_K 					= -1;
GT_t.WS_t.IRONDOME.LN[1].reflection_limit 		= 0.004;
GT_t.WS_t.IRONDOME.LN[1].sensor 				= {};
set_recursive_metatable(GT_t.WS_t.IRONDOME.LN[1].sensor, GT_t.WSN_t[0])
GT_t.WS_t.IRONDOME.LN[1].beamWidth 				= 0;
GT_t.WS_t.IRONDOME.LN[1].PL 					= {}
GT_t.WS_t.IRONDOME.LN[1].PL[1] 					= {}
GT_t.WS_t.IRONDOME.LN[1].PL[1].type_ammunition 	= TAMIR.wsTypeOfWeapon;