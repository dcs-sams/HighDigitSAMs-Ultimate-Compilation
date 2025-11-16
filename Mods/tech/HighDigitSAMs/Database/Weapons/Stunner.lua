
local Stunner				= {
	Name				= Stunner,
	display_name		= _("Stunner (David's Sling)"),
	name				= "Stunner",
	Escort				= 0,
	Head_Type			= 2, 
	sigma				= {0, 0, 0},
	M					= 400.0,
	H_max				= 25000.0,
	H_min				= 5.0,
	Diam				= 350.0,
	Cx_pil				= 1,
	D_max				= 150000.0,
	D_min				= 1000,
	Head_Form			= 1,
	Life_Time			= 180.0,
	Nr_max				= 40,
	v_min				= 400.0,
	v_mid				= 2572.5,
	Mach_max			= 7.5,
	t_b					= 0.0,
	t_acc				= 4.0,
	t_marsh				= 13.0,
	Range_max			= 300000.0,
	H_min_t				= 5.0,
	Fi_start 			= 3.14152,
	Fi_rak				= 3.14152,
	Fi_excort 			= 3.14152,
	Fi_search 			= 99.99,
	OmViz_max 			= 99.99,
	tail_scale			= 1.0, 
	exhaust1 			= { 1.0, 1.0, 1.0, 1.0 },
	X_back_acc 	 		= -2.30,
    Y_back_acc 	 		= 0.0,
    Z_back_acc 	 		= 0.0,
	exhaust2 			= { 1.0, 1.0, 1.0, 0.1 },
	exhaust3 			= { 1.0, 1.0, 1.0, 0.1 },
	exhaust_effect_type = 1,
	X_back 	 			= -0.8,
    Y_back 	 			= 0.0,
    Z_back 	 			= 0.0,
	Reflection			= 0.01,
	KillDistance		= 1.0, -- kinetic interception
	warhead				= enhanced_a2a_warhead(5.0);
	category			= CAT_MISSILES,
	wsTypeOfWeapon		= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER};
	SeekerGen 			= 4,
	active_radar_lock_dist	= 24500.0,
	hoj					= 1,
	ccm_k0				= 0.03,

	PN_gain = 10,
	PN_coeffs = {7,
				1000.0 ,1.0,
				5000.0, 0.80,
				15000.0, 0.60,
				20000.0, 0.40,
				25000.0, 0.30,
				30000.0, 0.10,
				40000.0, 0};
	ModelData = { 
		58, -- model params count
		0.39, -- characteristic square
		
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
		0,	 		0,		4,	 		13.5,		60,			3, 			100, 	-- time of stage, sec
		0, 			0, 		31.5, 		9.1,		0, 			6,			0,		-- fuel flow rate, kg/sec
		0, 			0, 		80000,	 	30000,		0,			20000,		0,		-- thrust, newtons
		
		190, --self destruct by timer
		180, --onboard power system operation time, sec
		0, -- absolute self-destruction altitude. Altitude of the radio fuse triggering self destruct.
		0, -- control switch-on delay after launch, sec 

		20000, -- Range to the target at the moment of launch, above which the missile will boost to climb.
		20000, -- The range to the target at any given moment, below which the missile will end the boost phase and switch to pronav
		0, -- sine of the elevation angle of the trajectory of the slide. 
		650, -- longitude acceleration of the fuse cocking
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
			name		= "Stunner";
			file		= "Stunner";
			life		= 1;
			fire		= { 0, 1};
			username	= "Stunner";
			index		= WSTYPE_PLACEHOLDER;
		},
	}


};
declare_weapon(Stunner)


GT_t.WS_t.DAVID_SLING_LN 								= {}
GT_t.WS_t.DAVID_SLING_LN.angles 						= {
															{math.rad(180), math.rad(-180), math.rad(0), math.rad(90)},
															};
GT_t.WS_t.DAVID_SLING_LN.reference_angle_Z = 1.5708;
GT_t.WS_t.DAVID_SLING_LN.LN 							= {}
GT_t.WS_t.DAVID_SLING_LN.LN[1] 							= {}
GT_t.WS_t.DAVID_SLING_LN.LN[1].type 					= 4;
GT_t.WS_t.DAVID_SLING_LN.LN[1].distanceMin 				= 7500;
GT_t.WS_t.DAVID_SLING_LN.LN[1].distanceMax 				= 300000.0;
GT_t.WS_t.DAVID_SLING_LN.LN[1].ECM_K 					= -1;
GT_t.WS_t.DAVID_SLING_LN.LN[1].reflection_limit 		= 0.011;
GT_t.WS_t.DAVID_SLING_LN.LN[1].sensor 					= {}
set_recursive_metatable(GT_t.WS_t.DAVID_SLING_LN.LN[1].sensor, GT_t.WSN_t[0])
GT_t.WS_t.DAVID_SLING_LN.LN[1].beamWidth 				= 0;
GT_t.WS_t.DAVID_SLING_LN.LN[1].PL 						= {}
GT_t.WS_t.DAVID_SLING_LN.LN[1].PL[1] 					= {}
GT_t.WS_t.DAVID_SLING_LN.LN[1].PL[1].type_ammunition 	= Stunner.wsTypeOfWeapon;