-- aster 30 block 2 by zahnatom

local nameaster302 = "Aster 30 Block 2"
SAMPT_ASTER_30_Blk_2 = {
    category        = CAT_MISSILES,
    name            = nameaster302,
    user_name       = _(nameaster302),
    model           = 'aster_30_blk_2',
    mass            = 750.0,
    wsTypeOfWeapon  =  {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER},

    Escort 			= 0,
    Head_Type 		= 2,
	sigma 			= {2.5, 2.5, 2.5},
    M 				= 750.0,
    H_max 			= 30000.0,
    H_min 			= 200.0,
    Diam 			= 450.0,
    Cx_pil 			= 1,
    D_max 			= 120000.0,
    D_min 			= 3500.0,
    Head_Form 		= 1,
    Life_Time 		= 360.0,
    Nr_max 			= 75,
    v_min 			= 50.0,
    v_mid 			= 5000.0,
    Mach_max 		= 7.0,
    t_b 			= 0.0,
    t_acc 			= 10.0,
    t_marsh 		= 3.0,
    Range_max 		= 200000.0,
    H_min_t 		= 10.0,
    Fi_start     	= 3.14152, -- angle of tracking at firing
    Fi_rak       	= 3.14152,
    Fi_excort    	= 2.0,
    Fi_search    	= 99.9, --search angle limit
    OmViz_max    	= 99.9, --search line speed limit
	exhaust1 	 	= { 1, 1, 1, 1},
    X_back       	= -0.6,
    Y_back       	= 0.0,
    Z_back       	= 0.0,	
	exhaust2 	 	= { 0.63, 0.67, 0.75, 0.2 },
	X_back_acc 	 	= -4,
    Y_back_acc 	 	= 0.0,
    Z_back_acc 	 	= 0.0,	
    Reflection 		= 0.1,
    KillDistance 	= 15.0,
	tail_scale 	 	= 1.4,		
	ccm_k0 			= 0.1,
	rad_correction = 1,
	radar_synced = true,	
	
	active_radar_lock_dist	= 25500.0,
	SeekerGen				= 4,
	hoj						= 1,

	PN_gain = 7.5,
	ModelData = { 
		58, -- model params count
		0.7, -- characteristic square
		
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
		0,   		10, 	0,  		2,			0, 			0,			1000000000, -- time of stage, sec
		0, 			43.143, 0,			6.66,		0, 			0,			0, 			-- fuel flow rate, kg/sec
		0, 			150000, 0,			32000,		0, 			0,			0, 			-- thrust, newtons
		
		1000000000, --self destruct by timer
		240, --onboard power system operation time, sec
		0, -- absolute self-destruction altitude. Altitude of the radio fuse triggering self destruct. 
		0.6, -- control switch-on delay after launch, sec 

		20000, -- Range to the target at the moment of launch, above which the missile will boost to climb.
		20000, -- The range to the target at any given moment, below which the missile will end the boost phase and switch to pronav
		0, -- sine of the elevation angle of the trajectory of the slide. 
		150, -- longitude acceleration of the fuse cocking
		0, -- speed module reported by the ejection device, expelling charge, etc.
		12, -- characteristic of the ACS-RAKETA system, the coefficient of the second order filter K0
		30,  -- characteristic of the SAU-RAKETA system, second-order filter coefficient K1
		2, -- characteristic of the SAU-RAKETA system, bandwidth of the control loop
		
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

	self_destruct = {
        delay 					= 1,
        trigger_dist            = 1000,
        inactivation_dist       = 900,
    },

	warhead = enhanced_a2a_warhead(30.0); 

    shape_table_data = {
        {
            name     = nameaster302,
            file     = 'aster_30_blk_2',
            life     = 1,
            fire     = {0, 1},
            username = nameaster302,
            index    = WSTYPE_PLACEHOLDER,
        },
    },

};

declare_weapon(SAMPT_ASTER_30_Blk_2)

GT_t.LN_t.Aster30_2 = {}; 
GT_t.LN_t.Aster30_2.type = 4;
GT_t.LN_t.Aster30_2.distanceMin = 10000;
GT_t.LN_t.Aster30_2.distanceMax = 200000;
GT_t.LN_t.Aster30_2.reflection_limit = 0.0001;
GT_t.LN_t.Aster30_2.ECM_K = -1;
GT_t.LN_t.Aster30_2.sensor = {};
set_recursive_metatable(GT_t.LN_t.Aster30_2.sensor, GT_t.WSN_t[0]);
GT_t.LN_t.Aster30_2.PL = {};
GT_t.LN_t.Aster30_2.PL[1] = {};
GT_t.LN_t.Aster30_2.PL[1].type_ammunition = SAMPT_ASTER_30_Blk_2.wsTypeOfWeapon;