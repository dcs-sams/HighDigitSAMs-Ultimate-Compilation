
GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_stationary);
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);
GT.chassis.life = 2;

GT.visual.shape = "DAVID_SLING_LN";
GT.visual.shape_dstr = "DAVID_SLING_LN";

--chassis

GT.IR_emission_coeff = 0.1

GT.toggle_alarm_state_interval = 0.01;

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

GT.visual.dust_pos    = {0.0, 0.0, 0.0}
GT.visual.dirt_pos    = {0,0, 0.0, 0.0}

-- weapon systems

GT.WS = {};
GT.WS.requiredUnits = {{"Iron_Dome_David_Sling_CP", 10000, GT_t.REQUIRED_UNIT.NEED_AI_ON}};
GT.WS.maxTargetDetectionRange = 420000.0;

local ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.DAVID_SLING_LN);
GT.WS[ws].pos = {0,0,0};
GT.WS[ws].moveable = false;
GT.WS[ws].LN[1].barrels_reload_type = 3; -- BarrelsReloadTypes.SEQUENTIALY
GT.WS[ws].LN[1].depends_on_unit = {{{"ELM2084_MMR_AD_RT"},},{{"ELM2084_MMR_WLR"},},{{"ELM2084_MMR_AD_SC"},},{{"SAM Patriot STR"},},
-- CurrentHill's Patriot Sites integration
{{"MIM104_ANMPQ65_HEMTT"},},{{"CH_THAAD_ANTPY2"},},{{"MIM104_ANMPQ65A_HEMTT"},},{{"MIM104_LTAMDS_HEMTT"},},{{"MIM104_ANMPQ65"},},{{"MIM104_ANMPQ65A"},},{{"MIM104_LTAMDS"},},{{"CH_MIM104_ANMPQ53_KAT1"},},};

GT.WS[ws].LN[1].reactionTime = 0.1;
GT.WS[ws].LN[1].show_external_missile = true;
GT.WS[ws].LN[1].PL[1].ammo_capacity = 12;
GT.WS[ws].LN[1].PL[1].shot_delay = 0.1;
GT.WS[ws].LN[1].PL[1].reload_time = 50;

GT.WS[ws].LN[1].BR = {};
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


GT.Name = "DAVID_SLING_LN";
GT.DisplayName = _("SAM IDF David's Sling LN");
GT.Rate = 10;

GT.EPLRS = true

GT.DetectionRange  = 0;
GT.ThreatRange = 300000;
GT.ThreatRangeMin = 7500;
GT.mapclasskey = "P0091000082";
GT.attribute = {wsType_Ground,wsType_SAM,wsType_Miss,WSTYPE_PLACEHOLDER,
				"AA_missile",
				"SAM LL",
				"Datalink",
				};
GT.category = "Air Defence";
GT.Countries = {"Israel", "Finland", "Germany"}

add_surface_unit(GT)