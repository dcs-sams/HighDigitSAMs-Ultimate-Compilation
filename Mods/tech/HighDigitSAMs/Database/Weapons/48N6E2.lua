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

local SA48N6E2 = {
	Cx_pil = 8,
	D_max = 100000, -- Maximum range firing at low altitude, in meters
	D_min = 6000, -- minimum range in meters
	Damage = 357.5,
	Diam = 519, -- Missile diameter in mm
	Fi_excort = 2, -- tracking angle (sighting) of the target by the missile.
	Fi_rak = 3.14152, -- allowable angle of view of the target, in radians
	Fi_search = 99.9, -- limit angle of free search
	Fi_start = 3.14152, -- angle of tracking and sighting at launch, in radians
	H_max = 30000, -- Maximum target altitude
	H_min = 10, -- minimum target altitude
	H_min_t = 10, -- minimum target height above the terrain, m.
	Head_Form = 1, -- determines shape of the missile head for drag modeling; 0 for hemispherical, 1 for conical
	Escort = 3, -- Escort(Requires tracking?): 0 - no, 1 - launch aircraft, 2 - another aircraft, 3 - from the ground
	Head_Type = 6, -- Seeker type code, in our case 8 is for TVM (Track via missile). 1 = Passive IR homing, 2 = Active Radar Homing
	KillDistance = 25,
	Life_Time = 200, -- Battery life
	M = 1840, -- Mass of the missile at launch
	Mach_max = 8.6, -- maximum Mach of the missile. 
	PN_gain = 6.3,
	ModelData = { 
		58, -- model params count
		2, -- characteristic square
		
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
		0.9, 		0, 		12.0, 		0, 			0, 			0, 			1000000000, -- time of stage, sec
		0, 			0, 		116.6, 		0, 			0, 			0, 			0, 			-- fuel flow rate, kg/sec
		0, 			0, 		240000, 	0, 			0, 			0, 			0, 			-- thrust, newtons
		
		1000000000, --self destruct by timer
		200, --onboard power system operation time, sec
		0, -- absolute self-destruction altitude. Altitude of the radio fuse triggering self destruct. 
		1, -- control switch-on delay after launch, sec 

		20000, -- Range to the target at the moment of launch, above which the missile will boost to climb.
		20000, -- The range to the target at any given moment, below which the missile will end the boost phase and switch to pronav
		0, -- sine of the elevation angle of the trajectory of the slide. 
		650, -- longitude acceleration of the fuse cocking
		25, -- speed module reported by the ejection device, expelling charge, etc.
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
	Name = SA48N6E2, --48N6
	Nr_max = 25, -- Maximum g when turning
	OmViz_max = 99.9, -- line-of-sight speed limit
	Range_max = 200000, -- Max range in meters
	Reflection = 0.2,
	X_back = -5,
	Y_back = 0,
	Z_back = 0,
	_unique_resource_name = "weapons.missiles.SA48H6E2",
	SeekerGen = 4,
	ccm_k0 = 0.17, -- Countermeasures effectiveness
	display_name = _('48N6E2 S-300PMU-2 (SA-20B Gargoyle)'),
	display_name_short = _('48N6E2 S-300PMU2 (SA-20B Gargoyle)'),
	exhaust = { 1, 1, 1, 1 },
	exhaust_effect_type = 1,
	name = "SA48N6E2",
	nozzle_exit_area = 0.148,
	sigma = { 25, 25, 25 },
	supersonic_A_coef_skew = 0.17,
	t_acc = 12.0, -- motor burn time
	t_b = 0.9, -- Motor start delay
	t_marsh = 0, -- cruise time, 0.0 if not applicable
	v_mid = 1000,
	v_min = 170,
	warhead = simple_aa_warhead(180.0),
	wsTypeOfWeapon  = {wsType_Missile, wsType_Missile, wsType_SA_Missile,WSTYPE_PLACEHOLDER};
	shape_table_data = 
	{
		{
			name	 = "48N6E2";
			file  	 = "48h6e2_hds";
			life  	 = 1;
			fire  	 = { 0, 1};
			username = "48N6E2";
			index = WSTYPE_PLACEHOLDER;
		},
	}
};
declare_weapon(SA48N6E2)

GT_t.WS_t.S_300PMU2 = {} -- S-300PMUB (SA-20B Gargoyle)
GT_t.WS_t.S_300PMU2.angles = {
					{math.rad(180), math.rad(-180), math.rad(-90), math.rad(90)},
					};
GT_t.WS_t.S_300PMU2.reference_angle_Z = math.rad(90)
GT_t.WS_t.S_300PMU2.LN = {}
GT_t.WS_t.S_300PMU2.LN[1] = {}
GT_t.WS_t.S_300PMU2.LN[1].type = 4
GT_t.WS_t.S_300PMU2.LN[1].distanceMin = 6000
GT_t.WS_t.S_300PMU2.LN[1].distanceMax = 200000
GT_t.WS_t.S_300PMU2.LN[1].ECM_K = -1;
GT_t.WS_t.S_300PMU2.LN[1].reflection_limit = 0.02;
GT_t.WS_t.S_300PMU2.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.S_300PMU2.LN[1].sensor, GT_t.WSN_t[0])
GT_t.WS_t.S_300PMU2.LN[1].beamWidth = 0;
GT_t.WS_t.S_300PMU2.LN[1].PL = {}
GT_t.WS_t.S_300PMU2.LN[1].PL[1] = {}
GT_t.WS_t.S_300PMU2.LN[1].PL[1].type_ammunition = SA48N6E2.wsTypeOfWeapon;
