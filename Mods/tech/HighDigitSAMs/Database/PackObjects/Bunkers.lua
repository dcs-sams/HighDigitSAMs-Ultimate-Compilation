GT = {};
set_recursive_metatable(GT, GT_t.generic_stationary)
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);
GT.chassis.life = 1000

GT.visual.shape = "ERO_HQ"
GT.visual.shape_dstr = "ERO_HQ" --ERO_HQ_d
GT.CustomAimPoint = {1,1,0}
GT.visual.fire_size = 2.0
GT.visual.fire_pos = {0,0,0};
GT.visual.fire_time = 120
GT.time_agony = 0;
GT.canExplode = true;

GT.Name = "ERO HQ Bunker"
GT.DisplayName = _("ERO HQ Bunker")
GT.Rate = 200

GT.DetectionRange  = 0;
GT.ThreatRange = 0;
GT.mapclasskey = "P0091000046";
GT.attribute = {wsType_Ground,wsType_Tank,wsType_NoWeapon,wsType_GenericFort,
                "Trucks",
				"SAM CC",
                };
GT.category = "Fortification";
       
add_surface_unit(GT)

GT = {};
set_recursive_metatable(GT, GT_t.generic_stationary)
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);
GT.chassis.life = 500

GT.visual.shape = "ERO_Ammunition_Bunker3"
GT.visual.shape_dstr = "ERO_Ammunition_Bunker3_d"
GT.CustomAimPoint = {1,1,0}
GT.visual.fire_size = 2.0
GT.visual.fire_pos = {0,0,0};
GT.visual.fire_time = 120
GT.time_agony = 0;
GT.canExplode = true;

GT.Name = "ERO Ammunition Bunker A"
GT.DisplayName = _("ERO Ammunition Bunker A")
GT.Rate = 100

GT.DetectionRange  = 0;
GT.ThreatRange = 0;
GT.mapclasskey = "P0091000046";
GT.attribute = {wsType_Ground,wsType_Tank,wsType_NoWeapon,wsType_GenericFort,
                "Trucks",
				"SAM CC",
                };
GT.category = "Fortification";         
                
add_surface_unit(GT)

GT = {};
set_recursive_metatable(GT, GT_t.generic_stationary)
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);
GT.chassis.life = 500

GT.visual.shape = "ERO_Ammunition_Bunker5"
GT.visual.shape_dstr = "ERO_Ammunition_Bunker5_d"
GT.CustomAimPoint = {1,1,0}
GT.visual.fire_size = 2.0
GT.visual.fire_pos = {0,0,0};
GT.visual.fire_time = 120
GT.time_agony = 0;
GT.canExplode = true;

GT.Name = "ERO Ammunition Bunker B"
GT.DisplayName = _("ERO Ammunition Bunker B")
GT.Rate = 200

GT.DetectionRange  = 0;
GT.ThreatRange = 0;
GT.mapclasskey = "P0091000046";
GT.attribute = {wsType_Ground,wsType_Tank,wsType_NoWeapon,wsType_GenericFort,
                "Trucks",
				"SAM CC",
				};
GT.category = "Fortification";
                
add_surface_unit(GT)

GT = {};
set_recursive_metatable(GT, GT_t.generic_stationary)
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);
GT.chassis.life = 1000

GT.visual.shape = "ERO_HQ2"
GT.visual.shape_dstr = "ERO_HQ2" --ERO_HQ2_D
GT.CustomAimPoint = {1,1,0}
GT.visual.fire_size = 2.0
GT.visual.fire_pos = {0,0,0};
GT.visual.fire_time = 120
GT.time_agony = 0;
GT.canExplode = true;

GT.Name = "ERO HQ Bunker2"
GT.DisplayName = _("ERO HQ Bunker2")
GT.Rate = 200

GT.DetectionRange  = 0;
GT.ThreatRange = 0;
GT.mapclasskey = "P0091000046";
GT.attribute = {wsType_Ground,wsType_Tank,wsType_NoWeapon,wsType_GenericFort,
                "Trucks",
				"SAM CC",
                };
GT.category = "Fortification";
       
add_surface_unit(GT)