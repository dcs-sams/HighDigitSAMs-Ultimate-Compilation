-- FUNCTIONS --

local function calcPiercingMass(warhead)
	warhead.piercing_mass  = warhead.mass;
	if (warhead.expl_mass/warhead.mass > 0.1) then
		warhead.piercing_mass  = warhead.mass/5.0;
	end
end

local function simple_aa_warhead(power, caliber)
    local res = {};

	res.caliber 			 = caliber
	res.mass 				 = power;
    res.expl_mass 			 = power;
    res.other_factors 		 = {1, 1, 1};
    res.obj_factors 		 = {1, 1};
    res.concrete_factors 	 = {1, 1, 1};
    res.cumulative_factor 	 = 0;
    res.concrete_obj_factor  = 0.0;
    res.cumulative_thickness = 0.0;
    
	calcPiercingMass(res)
    return res;
end



-- 30MM SHELLS --

local AA30AP 			= {
	category 			= CAT_SHELLS,
	user_name 			= _("2A38M 30mm AP"),
	model_name  		= "tracer_bullet_red",
	v0    				= 1000.0,
	Dv0   				= 0.0081,
	Da0    				= 0.0005,
	Da1     			= 0.0,
	mass     			= 0.39,
	explosive			= 0.0000,
	life_time			= 10.0,
	caliber				= 30.0,
	subcalibre			= true,
	AP_cap_caliber		= 30.0,
	s         			= 0.0,
	j         			= 0.0,
	l         			= 0.0,
	charTime 			= 0,
	cx 		  			= { 0.7, 0.7, 0.25, 0.236, 2.31 },
	k1       			= 5.7e-09,
	tracer_off    		= 10,
	scale_tracer  		= 0.1,
	round_mass 	  		= 0.39,
	piercing_mass 		= 0.39,
	rebound_concrete	= {
		angle0				 = 50,
		angle100		 	 = 75,
		cx_factor			 = 5,
		deviation_angle 	 = 30,
		velocity_loss_factor = 0.5
	},
	rebound_ground 		= {
		angle0 				 = 55,
		angle100 			 = 73,
		cx_factor 			 = 5,
		deviation_angle 	 = 30,
		velocity_loss_factor = 0.5
	},
	name 	  			= "2A38M 30mm AP",
	cartridge 			= 0,
	};
declare_weapon(AA30AP);

local AA30HE 			= {
	category 			= CAT_SHELLS,
	user_name 			= _("2A38M 30mm HE"),
	model_name  		= "tracer_bullet_white",
	v0    				= 980.0,
	Dv0   				= 0.0081,
	Da0    				= 0.0005,
	Da1     			= 0.0,
	mass     			= 0.39,
	explosive   		= 0.30,
	life_time   		= 10.0,
	caliber     		= 30.0,
	subcalibre  		= true,
	AP_cap_caliber 		= 30.0,
	s         			= 0.0,
	j         			= 0.0,
	l         			= 0.0,
	charTime  			= 0,
	cx 		  			= { 0.7, 0.7, 0.25, 0.236, 2.31 },
	k1        			= 5.7e-09,
	tracer_off    		= 10,
	scale_tracer  		= 0.1,
	round_mass 	  		= 0.39,
	piercing_mass 		= 0.09,
	rebound_concrete 	= {
		angle0				 = 50,
		angle100		 	 = 75,
		cx_factor			 = 5,
		deviation_angle 	 = 30,
		velocity_loss_factor = 0.5
	},
	rebound_ground = {
		angle0 				 = 55,
		angle100 			 = 73,
		cx_factor 			 = 5,
		deviation_angle 	 = 30,
		velocity_loss_factor = 0.5
	},
	name 	  			= "2A38M 30mm HE",
	cartridge 			= 0,
	};
declare_weapon(AA30HE);



-- GUN --

GT_t.LN_t.automatic_gun_2A38M										= {}; --name = "2A38M", display_name = _("2A38M")} 
GT_t.LN_t.automatic_gun_2A38M.type		  	  						= 3
GT_t.LN_t.automatic_gun_2A38M.useTargetAccelInSight 				= true
GT_t.LN_t.automatic_gun_2A38M.distanceMin  	  						= 200
GT_t.LN_t.automatic_gun_2A38M.distanceMax  	 	 					= 2500
GT_t.LN_t.automatic_gun_2A38M.max_trg_alt  	  						= 3000
GT_t.LN_t.automatic_gun_2A38M.maxTrackingSpeed						= 0.0;
GT_t.LN_t.automatic_gun_2A38M.maxShootingSpeed 						= 0.0;
GT_t.LN_t.automatic_gun_2A38M.reflection_limit 						= 0.03;
GT_t.LN_t.automatic_gun_2A38M.sensor = {}
set_recursive_metatable(GT_t.LN_t.automatic_gun_2A38M.sensor, GT_t.WSN_t[0])
GT_t.LN_t.automatic_gun_2A38M.PL									= {}
GT_t.LN_t.automatic_gun_2A38M.PL[1]									= {}
GT_t.LN_t.automatic_gun_2A38M.PL[1].shell_name						= {"2A38M 30mm AP", "2A38M 30mm HE", "2A38M 30mm HE", "2A38M 30mm HE", "2A38M 30mm HE"};
GT_t.LN_t.automatic_gun_2A38M.PL[1].shell_display_name 				= "2A38M 30mm AP+HE";



-- MISSILE --

local SA57E6ME			= {
	Name				= SA57E6ME,
	display_name		= _('57E6ME SA-22'),
	name				= "SA57E6ME",
	Escort				= 3,
	Head_Type			= 4,
	sigma				= {10, 10, 10},
	M					= 82.5,
	H_max				= 14000.0,
	H_min				= 1.0,
	Diam				= 100.0,
	Cx_pil				= 6,
	D_max				= 18000.0,
	D_min				= 1500.0,
	Head_Form			= 1,
	Life_Time			= 65.0,
	Nr_max				= 25,
	v_min				= 200.0,
	v_mid				= 770.0,
	Mach_max			= 5.0,
	t_b					= 0.1,
	t_acc				= 2.0,
	t_marsh				= 0.0,
	Range_max			= 30000.0,
	H_min_t				= 1.0,
	Fi_start			= 3.14152,
	Fi_rak				= 3.14152,
	Fi_excort			= 2.0,
	Fi_search			= 99.9,
	OmViz_max			= 99.9,
	warhead				= simple_aa_warhead(25.0, 100),
	effect_max_length 	= 10000,
	exhaust1			= { 0.7, 0.7, 0.7, 0.9 },
	exhaust_effect_type = 1,
	tail_scale			= 0.6,
	effect_max_length	= 2000.0,
	X_back				= 0.0,
	Y_back				= 0.0,
	Z_back				= 0.0,
	X_back_acc			= -1.7,
	Reflection			= 0.03,
	KillDistance		= 7.0,
	ccm_k0				= 0.23,
	SeekerGen 			= 4,
	category			= CAT_MISSILES,
	wsTypeOfWeapon		= {wsType_Weapon,wsType_Missile,wsType_SA_Missile,WSTYPE_PLACEHOLDER};
	ModelData = { 
		58, -- model params count
		0.75, -- characteristic square
		
		-- Cx dependent parameters
		0.004, -- Cx_k0 bar Cx0 on subsonic (M << 1)
		0.008,  -- Cx_k1 height of the peak of the wave crisis 
		0.01,  -- Cx_k2 steepness of the front on the approach to the wave crisis
		-0.007, -- Cx_k3 bar Cx0 at supersonic (M >> 1)
		0.22,  -- Cx_k4 steepness of the decline after the wave crisis
		4, -- coefficient of dumping of a polar

		-- Cy dependent parameters
		0.87, --Cy_k0 bar Сy0 at subsonic (M << 1)
		0.01, -- Cy_k1 bar Cy0 at supersonic (M >> 1)
		0.21, -- Cy_k2 steepness of the decline (front) behind the wave crisis

		0.6, -- 7 Alfa_max maximum balancing angle, radians
		0, -- angular velocity created by the moment of gas rudders
		
		--t_statr 	t_b 	t_accel 	t_march 	t_inertial 	t_break 	t_end
		0.1, 		0, 		2.0, 		0, 			0, 			0, 			1000000000, -- time of stage, sec
		0, 			0, 		27.5, 		0, 			0, 			0, 			0, 			-- fuel flow rate, kg/sec
		0, 			0, 		45000,	 	0, 			0, 			0, 			0, 			-- thrust, newtons
		
		60, --self destruct by timer
		65, --onboard power system operation time, sec
		0, -- absolute self-destruction altitude. Altitude of the radio fuse triggering self destruct. 
		0.1, -- control switch-on delay after launch, sec 

		12000, -- Range to the target at the moment of launch, above which the missile will boost to climb.
		12000, -- The range to the target at any given moment, below which the missile will end the boost phase and switch to pronav
		0.3, -- sine of the elevation angle of the trajectory of the slide. 
		650, -- longitude acceleration of the fuse cocking
		35, -- speed module reported by the ejection device, expelling charge, etc.
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
	loft = 1,
	loft_factor = 1.1,
	PN_gain = 8,
	shape_table_data	= 
	{
		{
			name		= "ERO_57E6ME";
			file		= "ERO_57E6ME";
			life		= 1;
			fire		= { 0, 1};
			username	= "57E6ME";
			index		= WSTYPE_PLACEHOLDER;
		},
	}
};
declare_weapon(SA57E6ME)



-- MISSILE WS --

GT_t.LN_t._96K6									= {}
GT_t.LN_t._96K6.type 							= 4;
GT_t.LN_t._96K6.xc 								= -1.072;
GT_t.LN_t._96K6.distanceMin 					= 1500;
GT_t.LN_t._96K6.distanceMax 					= 30000;
GT_t.LN_t._96K6.radialDisperse 					= 0.0;
GT_t.LN_t._96K6.dispertionReductionFactor 		= 0.0;
GT_t.LN_t._96K6.missileControlInterval 			= 0.01;
GT_t.LN_t._96K6.reflection_limit 				= 0.05
GT_t.LN_t._96K6.maxTrackingSpeed 				= 0.0;
GT_t.LN_t._96K6.maxShootingSpeed 				= 0.0;
GT_t.LN_t._96K6.sensor = {};
set_recursive_metatable(GT_t.LN_t._96K6.sensor, GT_t.WSN_t[0]);
GT_t.LN_t._96K6.ECM_K 							= -1;
GT_t.LN_t._96K6.PL 								= {};
GT_t.LN_t._96K6.PL[1] 							= {};
GT_t.LN_t._96K6.PL[1].type_ammunition 			= SA57E6ME.wsTypeOfWeapon;