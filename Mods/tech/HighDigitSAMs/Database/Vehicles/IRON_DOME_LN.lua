
GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_stationary);
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);
GT.chassis.life = 2;

GT.visual.shape = "IRON_DOME_LN";
GT.visual.shape_dstr = "IRON_DOME_LN";

--chassis

GT.IR_emission_coeff = 0.1

GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 5.0;

--Burning after hit
GT.visual.fire_size = 0.4; --relative burning size
GT.visual.fire_pos[1] = 0; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0.6; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 500; --burning time (seconds)

GT.visual.min_time_agony = 5;
GT.visual.max_time_agony = 120;
GT.visual.agony_explosion_size = 19;

--IR.coefs[1..4] ={heat collect coef, heat loose coef}
--IR.coefs[5] = {0.3 - initial value for FLIR param C0 for dead model, 0.3/1800 - param C0 decrease speed (0.3 in 1800 secs)}
GT.visual.IR = { coeffs = {GT_t.IR_COEFFS_ENGINE_APC, {0.0, 0.0}, GT_t.IR_COEFFS_Hot_SAM, {0.0, 0.00}, {0.15, 0.15/550}}}


GT.sound = {};

-- Engine params
GT.sound.engine = {};
GT.sound.engine.idle = "GndTech/BradleyEngineIdle";
GT.sound.engine.max = "GndTech/BradleyEngineMax";

GT.sound.engine.acc_start = "GndTech/BradleyEngineAccStart";
GT.sound.engine.acc_end = "GndTech/BradleyEngineAccEnd";

GT.sound.engine.idle_formula_gain = "0.625 x * 0.875 +";
GT.sound.engine.idle_formula_pitch = "0.55 x * 0.89 +";

GT.sound.engine.max_formula_gain = "0.95 x * 0.25 +";
GT.sound.engine.max_formula_pitch = "0.9025 x * 0.4195 +";

-- weapon systems

GT.WS = {};
GT.WS.requiredUnits = {{"Iron_Dome_David_Sling_CP", 10000, GT_t.REQUIRED_UNIT.NEED_AI_ON}};
GT.WS.maxTargetDetectionRange = 90000;

local ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.IRONDOME);
GT.WS[ws].pos = {0,0,0};
GT.WS[ws].moveable = false;
GT.WS[ws].LN[1].barrels_reload_type = 3;
GT.WS[ws].LN[1].depends_on_unit = {{{"ELM2084_MMR_AD_RT"},},{{"ELM2084_MMR_WLR"},},{{"ELM2084_MMR_AD_SC"},},};
GT.WS[ws].LN[1].reactionTime = 0.1;
GT.WS[ws].LN[1].show_external_missile = true
GT.WS[ws].LN[1].PL[1].ammo_capacity = 20;
GT.WS[ws].LN[1].PL[1].shot_delay = 0.5;
GT.WS[ws].LN[1].PL[1].reload_time = 50;

GT.WS[ws].LN[1].BR = {};
 GT.WS[ws].LN[1].BR[20] = {connector_name = 'POINT_20',drawArgument = 199 };
 GT.WS[ws].LN[1].BR[19] = {connector_name = 'POINT_19',drawArgument = 198 };
 GT.WS[ws].LN[1].BR[18] = {connector_name = 'POINT_18',drawArgument = 197 };
 GT.WS[ws].LN[1].BR[17] = {connector_name = 'POINT_17',drawArgument = 196 };
 GT.WS[ws].LN[1].BR[16] = {connector_name = 'POINT_16',drawArgument = 195 };
 GT.WS[ws].LN[1].BR[15] = {connector_name = 'POINT_15',drawArgument = 194 };
 GT.WS[ws].LN[1].BR[14] = {connector_name = 'POINT_14',drawArgument = 193 };
 GT.WS[ws].LN[1].BR[13] = {connector_name = 'POINT_13',drawArgument = 192 };
 GT.WS[ws].LN[1].BR[12] = {connector_name = 'POINT_12',drawArgument = 191 };
 GT.WS[ws].LN[1].BR[11] = {connector_name = 'POINT_11',drawArgument = 190 };
 GT.WS[ws].LN[1].BR[10] = {connector_name = 'POINT_10',drawArgument = 189 };
 GT.WS[ws].LN[1].BR[9] = {connector_name = 'POINT_09',drawArgument = 188 };
 GT.WS[ws].LN[1].BR[8] = {connector_name = 'POINT_08',drawArgument = 187 };
 GT.WS[ws].LN[1].BR[7] = {connector_name = 'POINT_07',drawArgument = 186 };
 GT.WS[ws].LN[1].BR[6] = {connector_name = 'POINT_06',drawArgument = 185 };
 GT.WS[ws].LN[1].BR[5] = {connector_name = 'POINT_05',drawArgument = 184 };
 GT.WS[ws].LN[1].BR[4] = {connector_name = 'POINT_04',drawArgument = 183 };
 GT.WS[ws].LN[1].BR[3] = {connector_name = 'POINT_03',drawArgument = 182 };
 GT.WS[ws].LN[1].BR[2] = {connector_name = 'POINT_02',drawArgument = 181 };
 GT.WS[ws].LN[1].BR[1] = {connector_name = 'POINT_01',drawArgument = 180 };


GT.Name = "IRON_DOME_LN";
GT.DisplayName = _("SAM IDF Iron Dome LN");
GT.Rate = 10;

GT.EPLRS = true

GT.DetectionRange  = 0;
GT.ThreatRange = 70000;
GT.mapclasskey = "P0091000079";
GT.attribute = {wsType_Ground,wsType_SAM,wsType_Miss, WSTYPE_PLACEHOLDER,
				"AA_missile",
				"SAM LL",
				"Datalink",
				};
GT.category = "Air Defence";
GT.Countries = {"Israel"}

add_surface_unit(GT)