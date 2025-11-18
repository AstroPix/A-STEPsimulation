Constant RocketMat Alu6061

Constant Rocket_Thickness 2.5
Constant Rocket_Height 15
# From previous version of mass model
Constant Rocket_ID 28.575 

//// Rocket body
Volume AlR
AlR.Material RocketMat
AlR.Color 7
AlR.Visibility {ShowRocket}
AlR.Shape TUBE {.5*Rocket_ID} {.5*Rocket_ID + Rocket_Thickness} {.5*Rocket_Height} 0 360
AlR.Position {Wall1_x} {Wall1_y + .5*Wall_Thickness + 2*Foot_Outer_Radius - sqrt((.5*Rocket_ID)*(.5*Rocket_ID) - (.5*Wall1_Length)*(.5*Wall1_Length))} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + .5*Rocket_Height}
AlR.Mother World

// Rocket top
Volume Al_lid
Al_lid.Material RocketMat
Al_lid.Color 7
Al_lid.Visibility {ShowRocket}
Al_lid.Shape TUBE 0 {.5*Rocket_ID + Rocket_Thickness} {.5*Rocket_Thickness} 0 360

Al_lid.Copy Alt
Alt.Position {Wall1_x} {Wall1_y + .5*Wall_Thickness + 2*Foot_Outer_Radius - sqrt((.5*Rocket_ID)*(.5*Rocket_ID) - (.5*Wall1_Length)*(.5*Wall1_Length))} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Rocket_Height + .5*Rocket_Thickness}
Alt.Mother World

// Rocket bottom
Al_lid.Copy Alb
Alb.Position {Wall1_x} {Wall1_y + .5*Wall_Thickness + 2*Foot_Outer_Radius - sqrt((.5*Rocket_ID)*(.5*Rocket_ID) - (.5*Wall1_Length)*(.5*Wall1_Length))} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width - .5*Rocket_Thickness}
Alb.Mother World