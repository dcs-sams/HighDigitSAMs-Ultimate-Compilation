-- aster 30 block 1 by zahnatom

local nameaster301 = "Aster 30 Block 1"
SAMPT_ASTER_30_Blk_1 = {
    category        = CAT_MISSILES,
    name            = nameaster301,
    user_name       = _(nameaster301),
    model           = 'aster_30_blk_1',
    mass            = 450.0,
    wsTypeOfWeapon  =  {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER},

    Escort 			= 3,
    Head_Type 		= 2,
	sigma 			= {5, 5, 5},
    M 				= 450.0,
    H_max 			= 20000.0,
    H_min 			= 3.0,
    Diam 			= 180.0,
    Cx_pil 			= 1,
    D_max 			= 40000.0,
    D_min 			= 1200.0,
    Head_Form 		= 1,
    Life_Time 		= 180.0,
    Nr_max 			= 60,
    v_min 			= 250.0,
    v_mid 			= 1000.0,
    Mach_max 		= 4.5,
    t_b 			= 0.0,
    t_acc 			= 3.75,
    t_marsh 		= 6.55,
    Range_max 		= 120000.0,
    H_min_t 		= 3.0,
    Fi_start     	= 3.14152, -- angle of tracking at firing
    Fi_rak       	= 3.14152,
    Fi_excort    	= 2,
    Fi_search    	= 99.9, --search angle limit
    OmViz_max    	= 99.9, --search line speed limit
	exhaust1 	 	= { 1, 0.9, 0.6, 1},
    X_back       	= -0.55,
    Y_back       	= 0.0,
    Z_back       	= 0.0,	
	exhaust2 	 	= { 0.63, 0.67, 0.75, 0.2 },
	X_back_acc 	 	= -2.88,
    Y_back_acc 	 	= 0.0,
    Z_back_acc 	 	= 0.0,	
    Reflection 		= 0.1,
    KillDistance 	= 20.0,
	tail_scale 	 	= 1.4,		
	ccm_k0 			= 0.1,	
	rad_correction = 1,
	radar_synced = true,
	active_radar_lock_dist	= 22000.0,
	SeekerGen				= 4,
	hoj						= 1,

	PN_gain = 5,
	ModelData = { 
		58, -- model params count
		0.4, -- characteristic square
		
		-- Cx dependent parameters
		0.026, -- Cx_k0 bar Cx0 on subsonic (M << 1)
		0.053,  -- Cx_k1 height of the peak of the wave crisis 
		0.01,  -- Cx_k2 steepness of the front on the approach to the wave crisis
		-0.245, -- Cx_k3 bar Cx0 at supersonic (M >> 1)
		0.075,  -- Cx_k4 steepness of the decline after the wave crisis
		0.7, -- coefficient of dumping of a polar

		-- Cy dependent parameters
		1.5, --Cy_k0 bar Сy0 at subsonic (M << 1)
		0.8, -- Cy_k1 bar Cy0 at supersonic (M >> 1)
		1.2, -- Cy_k2 steepness of the decline (front) behind the wave crisis

		0.4, -- 7 Alfa_max maximum balancing angle, radians
		6, -- angular velocity created by the moment of gas rudders
		
		--t_statr 	t_b 	t_accel 	t_march 	t_inertial 	t_break 	t_end
		0,   		3.75, 	0,			10.1,		0, 			0, 			1000000000, -- time of stage, sec
		0, 			91, 	0,			3.4,		0, 			0, 			0, 			-- fuel flow rate, kg/sec
		0, 			95000, 	0, 			6100,		0, 			0, 			0, 			-- thrust, newtons
		
		1000000000, --self destruct by timer
		180, --onboard power system operation time, sec
		0, -- absolute self-destruction altitude. Altitude of the radio fuse triggering self destruct. 
		0.6, -- control switch-on delay after launch, sec 

		20000, -- Range to the target at the moment of launch, above which the missile will boost to climb.
		20000, -- The range to the target at any given moment, below which the missile will end the boost phase and switch to pronav
		0, -- sine of the elevation angle of the trajectory of the slide. 
		150, -- longitude acceleration of the fuse cocking
		0, -- speed module reported by the ejection device, expelling charge, etc.
		80, -- characteristic of the ACS-RAKETA system, the coefficient of the second order filter K0
		160,  -- characteristic of the SAU-RAKETA system, second-order filter coefficient K1
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

	warhead = enhanced_a2a_warhead(15.0); 

    shape_table_data = {
        {
            name     = nameaster301,
            file     = 'aster_30_blk_1',
            life     = 1,
            fire     = {0, 1},
            username = nameaster301,
            index    = WSTYPE_PLACEHOLDER,
        },
    },
};

declare_weapon(SAMPT_ASTER_30_Blk_1)

GT_t.LN_t.Aster30_1 = {}; 
GT_t.LN_t.Aster30_1.type = 4;
GT_t.LN_t.Aster30_1.distanceMin = 1000;
GT_t.LN_t.Aster30_1.distanceMax = 120000;
GT_t.LN_t.Aster30_1.reflection_limit = 0.0001;
GT_t.LN_t.Aster30_1.ECM_K = -1;
GT_t.LN_t.Aster30_1.sensor = {};
set_recursive_metatable(GT_t.LN_t.Aster30_1.sensor, GT_t.WSN_t[0]);
GT_t.LN_t.Aster30_1.PL = {};
GT_t.LN_t.Aster30_1.PL[1] = {};
GT_t.LN_t.Aster30_1.PL[1].type_ammunition = SAMPT_ASTER_30_Blk_1.wsTypeOfWeapon;