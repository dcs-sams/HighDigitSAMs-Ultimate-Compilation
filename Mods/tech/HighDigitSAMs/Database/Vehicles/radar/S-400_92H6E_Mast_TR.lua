GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_stationary);
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);
GT.chassis.life = 4;

GT.visual.shape = "ERO_92N6E_TR_Mast";
GT.visual.shape_dstr = "ERO_30N6_TR_Mast_D";  --ERO_92N6E_TR_Mast_D
GT.visual.fire_pos[2] = 1;
GT.toggle_alarm_state_interval = 6;
GT.defaultStartAlarmState = GT_t.START_ALARM_STATES.GREEN;

GT.snd.radarRotation = "GndTech/RadarRotation";

GT.sensor = {};
GT.sensor.max_range_finding_target = 450000;
GT.sensor.min_range_finding_target = 200;
GT.sensor.max_alt_finding_target = 90000;
GT.sensor.height = 38.8;

GT.EPLRS = true;

--Burning after hit
GT.visual.fire_size = 0.5; --relative burning size
GT.visual.fire_pos[1] = 0; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 900; --burning time (seconds)

GT.CustomAimPoint = {0,1.5,0}

-- weapon systems

GT.WS = {};
GT.WS.maxTargetDetectionRange = 450000;
GT.WS.radar_type = 102;
GT.WS.requiredUnits = {{"S-400 55K6 cp", 10000, GT_t.REQUIRED_UNIT.NEED_AI_ON}};

-- We would like to engage targets using the radar without locking them up
-- But how can we do this?
-- It turns out that the beamWidth parameter of the LN object, when set to zero, will result in a target not
-- getting a lock or launch warning when engaged using command-guided (headValue = 8) missiles.
-- But then, we have a different problem: the radar has no detectable emissions at all!
-- To circumvent this issue, we can have the first WS on the unit be a dummy, which is not hooked up to the animations
-- and has an engagement area volume of zero (distanceMin = distanceMax)
-- The unit must also have the radar_rotation_type set to 0.


-- 0 tracker, dummy
local ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].pos = {0,42,0};
GT.WS[ws].angles = {
					{math.rad(180), math.rad(-180), math.rad(-10), math.rad(80)},
					};
GT.WS[ws].drawArgument1 = 0;
GT.WS[ws].omegaY = 0.174533;
GT.WS[ws].omegaZ = 0.174533;
GT.WS[ws].pidY = { p = 10, i = 0.1, d = 4};
GT.WS[ws].pidZ = { p = 10, i = 0.1, d = 4};
GT.WS[ws].LN = {};
GT.WS[ws].LN[1] = {};
GT.WS[ws].LN[1].depends_on_unit = {{{"S-400 91N6E sr",},},{{"S-400 96L6E mast sr",},},{{"S-400 96L6E sr",},},};
GT.WS[ws].LN[1].reactionTime = 2.3;
GT.WS[ws].LN[1].max_number_of_missiles_channels = 2;
GT.WS[ws].LN[1].type = 102;
GT.WS[ws].LN[1].distanceMin = 2000;
GT.WS[ws].LN[1].distanceMax = 450000;
GT.WS[ws].LN[1].reflection_limit = 0.039;
GT.WS[ws].LN[1].ECM_K = 0.65;
GT.WS[ws].LN[1].min_trg_alt = 10;
GT.WS[ws].LN[1].max_trg_alt = 90000;
GT.WS[ws].LN[1].beamWidth = math.rad(90);

-- "The S-300PMU-2 is referred in the West as SA-20B Gargoyle. The systems' fire control radar can detect 100 targets, track and engage 36 of them and guide 72 missiles.
-- It is worth noting that earlier radars of the S-300 family could simultaneously engage only 6 targets and guide 12 missiles."

for i = 1,35 do -- 35 tracker's
    ws = GT_t.inc_ws();
	GT.WS[ws] = {}
    GT.WS[ws].base = 1
    GT.WS[ws].pos = {0,0,0}
	GT.WS[ws].angles = {
					{math.rad(45), math.rad(-45), math.rad(-10), math.rad(80)},
					};
    GT.WS[ws].omegaY = 3
    GT.WS[ws].omegaZ = 3
    GT.WS[ws].LN = {}
    GT.WS[ws].LN[1] = {}
	set_recursive_metatable(GT.WS[ws].LN[1], GT.WS[1].LN[1])
end --for

GT.Name = "S-400 92N6E mast tr";
GT.DisplayName = _("SAM SA-21 S-400 Grave Stone (mast) TR");
GT.DisplayNameShort = _("SA-21 mast TR");
GT.Rate = 20;

GT.Sensors = { RADAR = "S-400 92N6E tr", };

GT.DetectionRange  = GT.sensor.max_range_finding_target;
GT.ThreatRange = 0;
GT.mapclasskey = "P0091000083";
GT.attribute = {wsType_Ground,wsType_SAM,wsType_Radar,V_40B6M,
				"LR SAM",
				"SAM TR",
				"RADAR_BAND1_FOR_ARM",
				"CustomAimPoint",
				"Datalink"
				};
GT.category = "Air Defence";
GT.tags = { "Air Defence", "Tracking Radar" };
GT.Countries = {"Russia", "Turkey", "Algeria", "Belarus", "India", "China"}
