Constant RocketMat Vacuum
#Constant RocketMat Aluminium

//// Rocket body
Volume AlR
AlR.Material RocketMat
AlR.Color 7
AlR.Visibility {ShowRocket}
AlR.Shape TUBE 14.2875 15.24 5.365 0 360
AlR.Position 0 0 -3
AlR.Mother World

// Rocket top
Volume Al_lid
Al_lid.Material RocketMat
Al_lid.Color 7
Al_lid.Visibility {ShowRocket}
Al_lid.Shape TUBE 0 15.24 0.3175 0 360

Al_lid.Copy Alt
Alt.Position 0 0 2.6825
Alt.Mother World

// Rocket bottom
Al_lid.Copy Alb
Alb.Position 0.0 0.0 -8.6825
Alb.Mother World