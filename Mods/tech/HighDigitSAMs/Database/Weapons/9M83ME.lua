-- Missile
local function calcPiercingMass(warhead)
	warhead.piercing_mass  = warhead.mass;
	if (warhead.expl_mass/warhead.mass > 0.1) then
		warhead.piercing_mass  = warhead.mass/5.0;
	end
end

local function simple_aa_warhead(power, caliber) -- By Saint
    local res = {};

	res.caliber = caliber
	res.mass = power; --old explosion damage effect
    res.expl_mass = power;
    res.other_factors = {1, 1, 1};
    res.obj_factors = {1, 1};
    res.concrete_factors = {1, 1, 1};
    res.cumulative_factor = 0;
    res.concrete_obj_factor = 0.0;
    res.cumulative_thickness = 0.0;
    
	calcPiercingMass(res)
    return res;
end

local SA9M83ME = {
	Name = SA9M83ME,
	display_name = _('SA9M83ME'),
	display_name = _('9M83MV S-300V4 (SA-23A Gladiator)'),
	name = "SA9M83ME",
	Escort = 3, -- Escort(Requires tracking?): 0 - no, 1 - launch aircraft, 2 - another aircraft, 3 - from the ground
	Head_Type = 6, -- Seeker type code, in our case 8 is for TVM (Track via missile). 1 = Passive IR homing, 2 = Active Radar Homing
	sigma = {30, 30, 30}, -- maximum aiming error in meters, in target coordinates. x - longitudinal axis of the target, y - vertical axis of the target, z - transverse axis of the target
	M = 2290.0, -- Mass of the missile at launch
	H_max = 25000.0, -- Maximum target altitude
	H_min = 25.0, -- minimum target altitude
	Diam = 810.0, -- Missile diameter in cm
	Cx_pil = 8, -- "Cx like pendants" - Moment of inertia??
	D_max = 90000.0, -- Maximum range firing at low altitude, in meters
	D_min = 1000.0, -- minimum range in meters
	Head_Form = 1, -- determines shape of the missile head for drag modeling; 0 for hemispherical, 1 for conical
	Life_Time = 240.0, -- Battery life
	Nr_max = 30, -- Maximum g when turning
	v_min = 0.0, -- Minimum speed in m/s
	v_mid = 800.0, -- average speed in m/s
	Mach_max = 5.25, -- maximum Mach of the missile
	t_b = 1.2, -- Motor start delay
	t_acc = 5.0, -- motor burn time
	t_marsh = 16.0, -- cruise time, 0.0 if not applicable
	Range_max = 150000.0, -- Max range in meters
	H_min_t = 10.0, -- minimum target height above the terrain, m.
	Fi_start = 3.14152, -- angle of tracking and sighting at launch, in radians
	Fi_rak = 3.14152, -- allowable angle of view of the target, in radians
	Fi_excort = 2.0, -- tracking angle (sighting) of the target by the missile.
	Fi_search = 99.9, -- limit angle of free search
	OmViz_max = 99.9, -- line-of-sight speed limit
	warhead 		= 
	{
		mass 					= 150; 
		expl_mass 				= 150; 
		other_factors 			= {1, 1, 1};
		obj_factors 			= {1, 1};
		concrete_factors 		= {1, 1, 1};
		cumulative_factor 		= 0;
		concrete_obj_factor 	= 0.0;
		cumulative_thickness 	= 0.0;
        piercing_mass			= 60.0;
		caliber					= 500,
	},
	exhaust1 = { 1, 1, 1, 1 },
	X_back = -2.37,
	Y_back = 0.0,
	Z_back = 0.0,
	exhaust2 = { 1, 1, 1, 1 },
	exhaust_effect_type = 1,
	X_back_acc = -4.35,
	Y_back_acc = 0.0,
	Z_back_acc = 0.0,
	Reflection = 0.39,
	KillDistance = 15.0,
	category = CAT_MISSILES,
	ccm_k0 = 0.12,
	SeekerGen = 4,
	PN_gain = 8,
	ModelData = { 
		58, -- model params count
		2.7, -- characteristic square
		
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
		1, -- angular velocity created by the moment of gas rudders
		
		--t_statr 	t_b 	t_accel 	t_march 	t_inertial 	t_break 	t_end
		1.2, 		5.2,	14.185,		0, 			0, 			0, 			1000000000, -- time of stage, sec
		0, 			76.92,	49.35, 		0, 			0, 			0, 			0, 			-- fuel flow rate, kg/sec
		0, 			350000,	180000, 	0, 			0, 			0, 			0, 			-- thrust, newtons
		
		1000000000, --self destruct by timer
		240, --onboard power system operation time, sec
		0, -- absolute self-destruction altitude. Altitude of the radio fuse triggering self destruct. 
		1, -- control switch-on delay after launch, sec 

		20000, -- Range to the target at the moment of launch, above which the missile will boost to climb.
		20000, -- The range to the target at any given moment, below which the missile will end the boost phase and switch to pronav
		0, -- sine of the elevation angle of the trajectory of the slide. 
		650, -- longitude acceleration of the fuse cocking
		40, -- speed module reported by the ejection device, expelling charge, etc.
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
	wsTypeOfWeapon  = {wsType_Weapon,wsType_Missile,wsType_SA_Missile,WSTYPE_PLACEHOLDER};
	shape_table_data = 
	{
		{
			name	 = "ERO_9M83ME";
			file  	 = "ERO_9M83ME";
			life  	 = 1;
			fire  	 = { 0, 1};
			username = "SA9M83ME";
			index = WSTYPE_PLACEHOLDER;
		},
	}
};
declare_weapon(SA9M83ME)

GT_t.WS_t.Antey4000_9M83ME = {}
GT_t.WS_t.Antey4000_9M83ME.angles = {
					{math.rad(180), math.rad(-180), math.rad(-90), math.rad(90)},
					};
GT_t.WS_t.Antey4000_9M83ME.reference_angle_Z = math.rad(90)
GT_t.WS_t.Antey4000_9M83ME.LN = {}
GT_t.WS_t.Antey4000_9M83ME.LN[1] = {}
GT_t.WS_t.Antey4000_9M83ME.LN[1].type = 4
GT_t.WS_t.Antey4000_9M83ME.LN[1].distanceMin = 5000
GT_t.WS_t.Antey4000_9M83ME.LN[1].distanceMax = 150000
GT_t.WS_t.Antey4000_9M83ME.LN[1].ECM_K = -1;
GT_t.WS_t.Antey4000_9M83ME.LN[1].reflection_limit = 0.019;
GT_t.WS_t.Antey4000_9M83ME.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.Antey4000_9M83ME.LN[1].sensor, GT_t.WSN_t[0])
GT_t.WS_t.Antey4000_9M83ME.LN[1].beamWidth = 0;
GT_t.WS_t.Antey4000_9M83ME.LN[1].PL = {}
GT_t.WS_t.Antey4000_9M83ME.LN[1].PL[1] = {}
GT_t.WS_t.Antey4000_9M83ME.LN[1].PL[1].type_ammunition = SA9M83ME.wsTypeOfWeapon;