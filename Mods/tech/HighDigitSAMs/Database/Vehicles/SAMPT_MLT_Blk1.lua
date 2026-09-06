-- SAMP/T MLT Launcher by zahnatom

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_stationary);
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);

GT.visual.shape = "sampt_mlt";
GT.visual.shape_dstr = "sampt_mlt_Destroyed";

-- chassis

GT.swing_on_run = false
GT.IR_emission_coeff = 0.06;

GT.toggle_alarm_state_interval = 0.01;

GT.encyclopediaAnimation = {
	args = {
		[1] = 1.0,
		[2] = 1.0,
		[3] = 1.0,
		[4] = 1.0,
		[5] = 1.0,
		[6] = 1.0,
		[7] = 1.0,
		[8] = 1.0,
	}
};

GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 8.225;

-- Burning after hit
GT.visual.fire_size = 1.1; -- relative burning size
GT.visual.fire_pos[1] = 2; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 1100; -- burning time (seconds)

GT.visual.min_time_agony = 5;
GT.visual.max_time_agony = 120;
GT.visual.agony_explosion_size = 19;

-- weapon systems

GT.WS = {};
GT.WS.maxTargetDetectionRange = 250000;
GT.WS.requiredUnits = {{"SAMPT_ME", 10000, GT_t.REQUIRED_UNIT.NEED_AI_ON}};

local ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].pos = {0, 0,0};
GT.WS[ws].angles = {
					{math.rad(180), math.rad(-180), math.rad(0), math.rad(90)},
					};
GT.WS[ws].moveable = false;
GT.WS[ws].reference_angle_Z = math.rad(90);

__LN = add_launcher(GT.WS[ws], GT_t.LN_t.Aster30_1);
__LN.depends_on_unit = {{{"SAMPT_MRI_ARABEL"},},{{"SAMPT_MRI_GF300"},},};
__LN.external_tracking_awacs = false;
__LN.show_external_missile = true;
__LN.PL[1].shot_delay = 0.1;
__LN.PL[1].switch_on_delay = 0.1;
__LN.PL[1].ammo_capacity = 8;
__LN.PL[1].reload_time = 3600;
__LN.BR = {
	{pos = {2.6, 3.35, -0.45},	drawArgument = 11},
	{pos = {2.6, 3.35, -0.18},		drawArgument = 12},
	{pos = {2.6, 3.35, 0.18}, 		drawArgument = 13},
	{pos = {2.6, 3.35, 0.45}, 	drawArgument = 14},
	{pos = {2.6, 3.5, -0.45}, 	drawArgument = 15},
	{pos = {2.6, 3.5, -0.18}, 		drawArgument = 16},
	{pos = {2.6, 3.5, 0.18}, 		drawArgument = 17},
	{pos = {2.6, 3.5, 0.45}, 		drawArgument = 18},
};

GT.Name = "SAMPT_MLT_Blk1";
GT.DisplayName = _('SAMP/T TEL Block 1');
GT.DisplayNameShort = _("SAMP/T TEL Blk 1");
GT.Rate = 10;

GT.EPLRS = true

GT.DetectionRange = 0;
GT.ThreatRange = 120000;
GT.mapclasskey = "P0091000079";
GT.attribute = {wsType_Ground, wsType_SAM, wsType_Miss, WSTYPE_PLACEHOLDER, 
	"AA_missile",
    "SAM LL",
	"Datalink",
};
GT.category = "Air Defence";
GT.tags = {"Air Defence", "Launcher"};
GT.Countries = {"France", "Italy", "Ukraine", "Singapore"}

add_surface_unit(GT)
