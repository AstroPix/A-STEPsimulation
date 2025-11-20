Constant PayloadWallMat Alu6061
Constant PayloadScrewMat Steel_18_8
Constant PayloadPCBMat PCB

Material PBT
PBT.Density         1.31
PBT.Component       H   12   
PBT.Component       C   12  
PBT.Component       O   4  

// Payload Housing
Constant Wall_Thickness 0.4
Constant Wall1_Length 16.51
Constant Wall1_Width 8.89
Constant Wall1_Offset_Width {0.6096 + PCB_Screw_Radius}
Constant Wall1_Offset_Length {3.11912 + PCB_Screw_Radius}
Constant Wall1_2_Offset 16.11376

Constant Wall1_Cutout_Depth .1524
Constant Wall1_Cutout_Width 4.6482
Constant Wall1_Cutout_Offset_Width .8128
Constant Wall1_Cutout_Offset_Length 3.4
Constant Wall1_Cutout_Rim_Width .4

Constant Wall2_Hole_Width 1.524
Constant Wall2_Hole_Length 1.6256
Constant Wall2_Hole_Offset_Width 1.6256
Constant Wall2_Hole_Offset_Length 3.8354

Constant Bottom_Hole_Width 2.54
Constant Bottom_Hole_Length 12.7
Constant Bottom_Hole_Offset_Width 0.3556
Constant Bottom_Hole_Offset_Length 1.524

Constant Foot_Outer_Radius 1.0668
Constant Foot_Height 1.27
Constant Foot_Screw_Hole_Ledge_Depth 0.4064
Constant Foot_Screw_Hole_Ledge_Diameter 0.7874
Constant Foot_Screw_Hole_Diameter 0.4572
Constant Foot_Side_Offset 1.9812

Constant Bottom_Screw_ID 0.1143
Constant Bottom_Screw_OD 0.2794
Constant Bottom_Short_Screw_Height 0.635
Constant Bottom_Short_Screw_Width_Offset 2.2606
Constant Bottom_Short_Screw_Length_Offset 4.18084
Constant Bottom_Short_Screw_Width_Spacing 4.7
Constant Bottom_Short_Screw_Length_Spacing 3.4

Constant Bottom_Tall_Screw_Height 1.27
Constant Bottom_Tall_Screw_Width_Offset 1.3462
Constant Bottom_Tall_Screw_Length_Offset 1.0414
Constant Bottom_Tall_Screw_Width_Spacing 4.826
Constant Bottom_Tall_Screw_Length_Spacing 6.604

Constant BB_Width 5.461
Constant BB_Length 8.636
Constant BB_Depth {PCBThickness}

Constant FPGA_Width 6.4
Constant FPGA_Length 7.5184
Constant FPGA_Depth {PCBThickness}
Constant FPGA_Width_Offset 1.2573

Constant HV_Width 6.4
Constant HV_Length 4.9
Constant HV_Depth {PCBThickness}
Constant FPGA_HV_Offset 1.27

Constant Screw_Head_Diameter 0.436372
Constant Screw_Head_Height 0.27051
Constant Screw_Helix_Length 0.79375

Constant PDU_Wall_Width 2.54

Constant PDU_Wall2_Hole_Center_Width 1.905
Constant PDU_Wall2_Hole_Center_Height 1.0668

Constant PDU_Wall2_Hole_Wing_Width 0.4318
Constant PDU_Wall2_Hole_Wing_Radius 0.2794

Constant PDU_Wall2_Hole_Ledge_Width 0.2286
Constant PDU_Wall2_Hole_Ledge_Depth 0.1524

Constant PDU_Wall2_Hole_Width_Offset 0.381
Constant PDU_Wall2_Hole_Length_Offset 5.207
Constant PDU_Wall2_Hole_Length_Spacing 5.588

Constant PDU_Screw_ID 0.2286
Constant PDU_Screw_OD 0.635
Constant PDU_Screw_Height 0.508
Constant PDU_Screw_Width_Offset 1.9812
Constant PDU_Screw_Length_Offset 0.5334
Constant PDU_Screw_Spacing 5.4864

Constant PDU_Rectangle_Length 1.27
Constant PDU_Rectangle_Width 2.54
Constant PDU_Rectangle_Height .254
Constant PDU_Rectangle_Length_Offset 7.4168
Constant PDU_Rectangle_Width_Offset 3.8862
Constant PDU_Rectangle_Spacing 3.0734

Constant PDU_Width 11.8745
Constant PDU_Length 12.1031
Constant PDU_Height 0.16002
Constant PDU_Offset 1.8034

// Aluminum box, 0.4 cm thick*/

// Wall1 is going to be the side with the detector mounted

Constant Wall1_x {-.5*QCLength + LayerLength - FEELength + .5*OverlapL + .5*QCLength - .5*ActiveAreaLength - DigitalPeriphery - .5*ActiveAreaLength - .5*StructuralPitchL - PCB_Screw_Offset_Length + Wall1_Offset_Length - .5*Wall1_Length}
Constant Wall1_y {3*LayerSpacing - .5*PCBThickness + .5*BBThickness - .5*(ChipThickness-DepletionDepth) - .5*QCThickness + .5*Wall_Thickness}
Constant Wall1_z {-.5*QCWidth + LayerWidth - PCBLeftW + .5*OverlapW - PCB_Screw_Offset_Width + Wall1_Offset_Width - .5*Wall1_Width}

Volume Wall1
Wall1.Material PayloadWallMat
Wall1.Visibility {ShowPayload}
Wall1.Shape Box {.5*Wall1_Length} {.5*Wall_Thickness} {.5*Wall1_Width}
Wall1.Position Wall1_x Wall1_y Wall1_z
Wall1.Mother World

Volume Wall2
Wall2.Material PayloadWallMat
Wall2.Visibility {ShowPayload}
Wall2.Shape Box {.5*Wall1_Length} {.5*Wall_Thickness} {.5*Wall1_Width}
Wall2.Position Wall1_x {Wall1_y - Wall1_2_Offset} Wall1_z
Wall2.Mother World

Volume Wall3
Wall3.Material PayloadWallMat
Wall3.Visibility {ShowPayload}
Wall3.Shape Box {.5*Wall_Thickness} {.5*Wall1_2_Offset - .5*Wall_Thickness} {.5*Wall1_Width}
Wall3.Position {Wall1_x - .5*Wall1_Length + .5*Wall_Thickness} {Wall1_y - .5*Wall1_2_Offset} Wall1_z
Wall3.Mother World

Volume Wall4
Wall4.Material PayloadWallMat
Wall4.Visibility {ShowPayload}
Wall4.Shape Box {.5*Wall_Thickness} {.5*Wall1_2_Offset - .5*Wall_Thickness} {.5*Wall1_Width}
Wall4.Position {Wall1_x + .5*Wall1_Length - .5*Wall_Thickness} {Wall1_y - .5*Wall1_2_Offset} Wall1_z
Wall4.Mother World

// Make Bottom inside of the 4 walls
Volume Bottom
Bottom.Material PayloadWallMat
Bottom.Visibility {ShowPayload}
Bottom.Shape Box {.5*Wall1_Length - Wall_Thickness} {.5*Wall1_2_Offset - .5*Wall_Thickness} {.5*Wall_Thickness}
Bottom.Position Wall1_x {Wall1_y - .5*Wall1_2_Offset} {Wall1_z - .5*Wall1_Width + .5*Wall_Thickness}
Bottom.Mother World

// Need to confirm Top is .4 cm thick
// Top sits on top of the walls
Volume Top
Top.Material PayloadWallMat
Top.Visibility {ShowPayload}
Top.Shape Box {.5*Wall1_Length} {.5*Wall1_2_Offset + .5*Wall_Thickness} {.5*Wall_Thickness}
Top.Position Wall1_x {Wall1_y - .5*Wall1_2_Offset} {Wall1_z + .5*Wall1_Width + .5*Wall_Thickness}
Top.Mother World

// Aluminum Box Features

Volume Wall1_Cutout
Wall1_Cutout.Material Vacuum
Wall1_Cutout.Visibility {ShowPayload}
Wall1_Cutout.Shape BOX {.5*Wall1_Cutout_Width} {.5*Wall1_Cutout_Depth} {.5*Wall1_Cutout_Width}
Wall1_Cutout.Position {.5*Wall1_Length - Wall1_Cutout_Offset_Length - .5*Wall1_Cutout_Width} {.5*Wall_Thickness - .5*Wall1_Cutout_Depth} {.5*Wall1_Width - Wall1_Cutout_Offset_Width - .5*Wall1_Cutout_Width}
Wall1_Cutout.Mother Wall1

Volume Wall1_Hole
Wall1_Hole.Material Vacuum
Wall1_Hole.Visibility {ShowPayload}
Wall1_Hole.Shape BOX {.5*Wall1_Cutout_Width - Wall1_Cutout_Rim_Width} {.5*Wall_Thickness - .5*Wall1_Cutout_Depth} {.5*Wall1_Cutout_Width - Wall1_Cutout_Rim_Width}
Wall1_Hole.Position {.5*Wall1_Length - Wall1_Cutout_Offset_Length - .5*Wall1_Cutout_Width} {-.5*Wall1_Cutout_Depth} {.5*Wall1_Width - Wall1_Cutout_Offset_Width - .5*Wall1_Cutout_Width}
Wall1_Hole.Mother Wall1

Volume Wall2_Hole
Wall2_Hole.Material Vacuum
Wall2_Hole.Visibility {ShowPayload}
Wall2_Hole.Shape BOX {.5*Wall2_Hole_Length} {.5*Wall_Thickness} {.5*Wall2_Hole_Width}
Wall2_Hole.Position {.5*Wall1_Length - Wall2_Hole_Offset_Length - .5*Wall2_Hole_Length} 0 {-.5*Wall1_Width + Wall2_Hole_Offset_Width + .5*Wall2_Hole_Width}
Wall2_Hole.Mother Wall2

Volume Bottom_Hole
Bottom_Hole.Material Vacuum
Bottom_Hole.Visibility {ShowPayload}
Bottom_Hole.Shape BOX {.5*Bottom_Hole_Length} {.5*Bottom_Hole_Width} {.5*Wall_Thickness}
Bottom_Hole.Position {{.5*Wall1_Length - Wall_Thickness} - Bottom_Hole_Offset_Length - .5*Bottom_Hole_Length} {{.5*Wall1_2_Offset - .5*Wall_Thickness} - Bottom_Hole_Offset_Width - .5*Bottom_Hole_Width} 0
Bottom_Hole.Mother Bottom

####################################################################################

Volume FootA
FootA.Material Vacuum
FootA.Visibility 0
FootA.Shape BOX {2*Foot_Outer_Radius} {2*Foot_Outer_Radius} {.5*Foot_Height}

Volume FootA_Subset1
FootA_Subset1.Material PayloadWallMat
FootA_Subset1.Visibility {ShowPayload}
FootA_Subset1.Shape TUBE 0 Foot_Outer_Radius {.5*Foot_Height} 0 180
FootA_Subset1.Position 0 0 0
FootA_Subset1.Mother FootA

Volume FootA_Subset1_Ledge_Subtraction
FootA_Subset1_Ledge_Subtraction.Material PayloadScrewMat
FootA_Subset1_Ledge_Subtraction.Visibility {ShowPayload}
FootA_Subset1_Ledge_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Ledge_Diameter} {.5*Foot_Screw_Hole_Ledge_Depth} 0 180
FootA_Subset1_Ledge_Subtraction.Position 0 0 {.5*Foot_Height - .5*Foot_Screw_Hole_Ledge_Depth}
FootA_Subset1_Ledge_Subtraction.Mother FootA_Subset1

Volume FootA_Subset1_Hole_Subtraction
FootA_Subset1_Hole_Subtraction.Material PayloadScrewMat
FootA_Subset1_Hole_Subtraction.Visibility {ShowPayload}
FootA_Subset1_Hole_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Diameter} {.5*Foot_Height - .5*Foot_Screw_Hole_Ledge_Depth} 0 180
FootA_Subset1_Hole_Subtraction.Position 0 0 {-.5*Foot_Screw_Hole_Ledge_Depth}
FootA_Subset1_Hole_Subtraction.Mother FootA_Subset1

Volume FootA_Subset2
FootA_Subset2.Material PayloadWallMat
FootA_Subset2.Visibility {ShowPayload}
FootA_Subset2.Shape BOX {1.5*Foot_Outer_Radius} {.5*Foot_Outer_Radius} {.5*Foot_Height}
FootA_Subset2.Position {.5*Foot_Outer_Radius} {-.5*Foot_Outer_Radius} 0
FootA_Subset2.Mother FootA

Volume FootA_Subset2_Ledge_Subtraction
FootA_Subset2_Ledge_Subtraction.Material PayloadScrewMat
FootA_Subset2_Ledge_Subtraction.Visibility {ShowPayload}
FootA_Subset2_Ledge_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Ledge_Diameter} {.5*Foot_Screw_Hole_Ledge_Depth} 180 360
FootA_Subset2_Ledge_Subtraction.Position {-.5*Foot_Outer_Radius} {.5*Foot_Outer_Radius} {.5*Foot_Height - .5*Foot_Screw_Hole_Ledge_Depth}
FootA_Subset2_Ledge_Subtraction.Mother FootA_Subset2

Volume FootA_Subset2_Hole_Subtraction
FootA_Subset2_Hole_Subtraction.Material PayloadScrewMat
FootA_Subset2_Hole_Subtraction.Visibility {ShowPayload}
FootA_Subset2_Hole_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Diameter} {.5*Foot_Height - .5*Foot_Screw_Hole_Ledge_Depth} 180 360
FootA_Subset2_Hole_Subtraction.Position {-.5*Foot_Outer_Radius} {.5*Foot_Outer_Radius} {-.5*Foot_Screw_Hole_Ledge_Depth}
FootA_Subset2_Hole_Subtraction.Mother FootA_Subset2

Volume FootA_Subset2_Edge_Subtraction
FootA_Subset2_Edge_Subtraction.Material Vacuum
FootA_Subset2_Edge_Subtraction.Visibility {ShowPayload}
FootA_Subset2_Edge_Subtraction.Shape TUBE 0 {Foot_Outer_Radius} {.5*Foot_Height} 180 270
FootA_Subset2_Edge_Subtraction.Position {1.5*Foot_Outer_Radius} {.5*Foot_Outer_Radius} 0
FootA_Subset2_Edge_Subtraction.Mother FootA_Subset2

FootA.Copy FootA1
FootA1.Position {Wall1_x - .5*Wall1_Length + Foot_Outer_Radius} {Wall1_y + .5*Wall_Thickness + Foot_Outer_Radius} {Wall1_z - .5*Wall1_Width + .5*Foot_Height}
FootA1.Mother World

FootA.Copy FootA2
FootA2.Position {Wall1_x + .5*Wall1_Length - Foot_Outer_Radius} {Wall1_y - .5*Wall_Thickness - Foot_Outer_Radius - Wall1_2_Offset} {Wall1_z - .5*Wall1_Width + .5*Foot_Height}
FootA2.Rotation 0 0 180
FootA2.Mother World

########################################################################

Volume FootB
FootB.Material Vacuum
FootB.Visibility 0
FootB.Shape BOX {2*Foot_Outer_Radius} {2*Foot_Outer_Radius} {.5*Foot_Height}

Volume FootB_Subset1
FootB_Subset1.Material PayloadWallMat
FootB_Subset1.Visibility {ShowPayload}
FootB_Subset1.Shape TUBE 0 Foot_Outer_Radius {.5*Foot_Height} 0 180
FootB_Subset1.Position 0 0 0
FootB_Subset1.Mother FootB

Volume FootB_Subset1_Ledge_Subtraction
FootB_Subset1_Ledge_Subtraction.Material PayloadScrewMat
FootB_Subset1_Ledge_Subtraction.Visibility {ShowPayload}
FootB_Subset1_Ledge_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Ledge_Diameter} {.5*Foot_Screw_Hole_Ledge_Depth} 0 180
FootB_Subset1_Ledge_Subtraction.Position 0 0 {.5*Foot_Height - .5*Foot_Screw_Hole_Ledge_Depth}
FootB_Subset1_Ledge_Subtraction.Mother FootB_Subset1

Volume FootB_Subset1_Hole_Subtraction
FootB_Subset1_Hole_Subtraction.Material PayloadScrewMat
FootB_Subset1_Hole_Subtraction.Visibility {ShowPayload}
FootB_Subset1_Hole_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Diameter} {.5*Foot_Height - .5*Foot_Screw_Hole_Ledge_Depth} 0 180
FootB_Subset1_Hole_Subtraction.Position 0 0 {-.5*Foot_Screw_Hole_Ledge_Depth}
FootB_Subset1_Hole_Subtraction.Mother FootB_Subset1

Volume FootB_Subset2
FootB_Subset2.Material PayloadWallMat
FootB_Subset2.Visibility {ShowPayload}
FootB_Subset2.Shape BOX {1.5*Foot_Outer_Radius} {.5*Foot_Outer_Radius} {.5*Foot_Height}
FootB_Subset2.Position {-.5*Foot_Outer_Radius} {-.5*Foot_Outer_Radius} 0
FootB_Subset2.Mother FootB

Volume FootB_Subset2_Ledge_Subtraction
FootB_Subset2_Ledge_Subtraction.Material PayloadScrewMat
FootB_Subset2_Ledge_Subtraction.Visibility {ShowPayload}
FootB_Subset2_Ledge_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Ledge_Diameter} {.5*Foot_Screw_Hole_Ledge_Depth} 180 360
FootB_Subset2_Ledge_Subtraction.Position {.5*Foot_Outer_Radius} {.5*Foot_Outer_Radius} {.5*Foot_Height - .5*Foot_Screw_Hole_Ledge_Depth}
FootB_Subset2_Ledge_Subtraction.Mother FootB_Subset2

Volume FootB_Subset2_Hole_Subtraction
FootB_Subset2_Hole_Subtraction.Material PayloadScrewMat
FootB_Subset2_Hole_Subtraction.Visibility {ShowPayload}
FootB_Subset2_Hole_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Diameter} {.5*Foot_Height - .5*Foot_Screw_Hole_Ledge_Depth} 180 360
FootB_Subset2_Hole_Subtraction.Position {.5*Foot_Outer_Radius} {.5*Foot_Outer_Radius} {-.5*Foot_Screw_Hole_Ledge_Depth}
FootB_Subset2_Hole_Subtraction.Mother FootB_Subset2

Volume FootB_Subset2_Edge_Subtraction
FootB_Subset2_Edge_Subtraction.Material Vacuum
FootB_Subset2_Edge_Subtraction.Visibility {ShowPayload}
FootB_Subset2_Edge_Subtraction.Shape TUBE 0 {Foot_Outer_Radius} {.5*Foot_Height} 270 360
FootB_Subset2_Edge_Subtraction.Position {-1.5*Foot_Outer_Radius} {.5*Foot_Outer_Radius} 0
FootB_Subset2_Edge_Subtraction.Mother FootB_Subset2

FootB.Copy FootB1
FootB1.Position {Wall1_x + .5*Wall1_Length - Foot_Outer_Radius} {Wall1_y + .5*Wall_Thickness + Foot_Outer_Radius} {Wall1_z - .5*Wall1_Width + .5*Foot_Height}
FootB1.Mother World

FootB.Copy FootB2
FootB2.Position {Wall1_x - .5*Wall1_Length + Foot_Outer_Radius} {Wall1_y - .5*Wall_Thickness - Foot_Outer_Radius - Wall1_2_Offset} {Wall1_z - .5*Wall1_Width + .5*Foot_Height}
FootB2.Rotation 0 0 180
FootB2.Mother World

########################################################################

Volume FootC
FootC.Material Vacuum
FootC.Visibility 0
FootC.Shape BOX {2*Foot_Outer_Radius} {2*Foot_Outer_Radius} {.5*Foot_Height}

Volume FootC_Subset1
FootC_Subset1.Material PayloadWallMat
FootC_Subset1.Visibility {ShowPayload}
FootC_Subset1.Shape TUBE 0 Foot_Outer_Radius {.5*Foot_Height} 0 180
FootC_Subset1.Position 0 0 0
FootC_Subset1.Mother FootC

Volume FootC_Subset1_Ledge_Subtraction
FootC_Subset1_Ledge_Subtraction.Material PayloadScrewMat
FootC_Subset1_Ledge_Subtraction.Visibility {ShowPayload}
FootC_Subset1_Ledge_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Ledge_Diameter} {.5*Foot_Screw_Hole_Ledge_Depth} 0 180
FootC_Subset1_Ledge_Subtraction.Position 0 0 {.5*Foot_Height - .5*Foot_Screw_Hole_Ledge_Depth}
FootC_Subset1_Ledge_Subtraction.Mother FootC_Subset1

Volume FootC_Subset1_Hole_Subtraction
FootC_Subset1_Hole_Subtraction.Material PayloadScrewMat
FootC_Subset1_Hole_Subtraction.Visibility {ShowPayload}
FootC_Subset1_Hole_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Diameter} {.5*Foot_Height - .5*Foot_Screw_Hole_Ledge_Depth} 0 180
FootC_Subset1_Hole_Subtraction.Position 0 0 {-.5*Foot_Screw_Hole_Ledge_Depth}
FootC_Subset1_Hole_Subtraction.Mother FootC_Subset1

Volume FootC_Subset2
FootC_Subset2.Material PayloadWallMat
FootC_Subset2.Visibility {ShowPayload}
FootC_Subset2.Shape BOX {2*Foot_Outer_Radius} {.5*Foot_Outer_Radius} {.5*Foot_Height}
FootC_Subset2.Position 0 {-.5*Foot_Outer_Radius} 0
FootC_Subset2.Mother FootC

Volume FootC_Subset2_Ledge_Subtraction
FootC_Subset2_Ledge_Subtraction.Material PayloadScrewMat
FootC_Subset2_Ledge_Subtraction.Visibility {ShowPayload}
FootC_Subset2_Ledge_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Ledge_Diameter} {.5*Foot_Screw_Hole_Ledge_Depth} 180 360
FootC_Subset2_Ledge_Subtraction.Position 0 {.5*Foot_Outer_Radius} {.5*Foot_Height - .5*Foot_Screw_Hole_Ledge_Depth}
FootC_Subset2_Ledge_Subtraction.Mother FootC_Subset2

Volume FootC_Subset2_Hole_Subtraction
FootC_Subset2_Hole_Subtraction.Material PayloadScrewMat
FootC_Subset2_Hole_Subtraction.Visibility {ShowPayload}
FootC_Subset2_Hole_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Diameter} {.5*Foot_Height - .5*Foot_Screw_Hole_Ledge_Depth} 180 360
FootC_Subset2_Hole_Subtraction.Position 0 {.5*Foot_Outer_Radius} {-.5*Foot_Screw_Hole_Ledge_Depth}
FootC_Subset2_Hole_Subtraction.Mother FootC_Subset2

Volume FootC_Subset2_Edge_Subtraction1
FootC_Subset2_Edge_Subtraction1.Material Vacuum
FootC_Subset2_Edge_Subtraction1.Visibility {ShowPayload}
FootC_Subset2_Edge_Subtraction1.Shape TUBE 0 {Foot_Outer_Radius} {.5*Foot_Height} 270 360
FootC_Subset2_Edge_Subtraction1.Position {-2*Foot_Outer_Radius} {.5*Foot_Outer_Radius} 0
FootC_Subset2_Edge_Subtraction1.Mother FootC_Subset2

Volume FootC_Subset2_Edge_Subtraction2
FootC_Subset2_Edge_Subtraction2.Material Vacuum
FootC_Subset2_Edge_Subtraction2.Visibility {ShowPayload}
FootC_Subset2_Edge_Subtraction2.Shape TUBE 0 {Foot_Outer_Radius} {.5*Foot_Height} 180 270
FootC_Subset2_Edge_Subtraction2.Position {2*Foot_Outer_Radius} {.5*Foot_Outer_Radius} 0
FootC_Subset2_Edge_Subtraction2.Mother FootC_Subset2

FootC.Copy FootC1
FootC1.Position {Wall1_x - .5*Wall1_Length - Foot_Outer_Radius} {Wall1_y + .5*Wall_Thickness - Foot_Side_Offset - 2*Foot_Outer_Radius} {Wall1_z - .5*Wall1_Width + .5*Foot_Height}
FootC1.Rotation 0 0 90
FootC1.Mother World

FootC.Copy FootC2
FootC2.Position {Wall1_x - .5*Wall1_Length - Foot_Outer_Radius} {Wall1_y - Wall1_2_Offset - .5*Wall_Thickness + Foot_Side_Offset + 2*Foot_Outer_Radius} {Wall1_z - .5*Wall1_Width + .5*Foot_Height}
FootC2.Rotation 0 0 90
FootC2.Mother World

FootC.Copy FootC3
FootC3.Position {Wall1_x + .5*Wall1_Length + Foot_Outer_Radius} {Wall1_y + .5*Wall_Thickness - Foot_Side_Offset - 2*Foot_Outer_Radius} {Wall1_z - .5*Wall1_Width + .5*Foot_Height}
FootC3.Rotation 0 0 270
FootC3.Mother World

FootC.Copy FootC4
FootC4.Position {Wall1_x + .5*Wall1_Length + Foot_Outer_Radius} {Wall1_y - Wall1_2_Offset - .5*Wall_Thickness + Foot_Side_Offset + 2*Foot_Outer_Radius} {Wall1_z - .5*Wall1_Width + .5*Foot_Height}
FootC4.Rotation 0 0 270
FootC4.Mother World

#############################################################################################

Volume Short_Screw_Hole
Short_Screw_Hole.Material PayloadWallMat
Short_Screw_Hole.Visibility {ShowPayload}
Short_Screw_Hole.Shape TUBE {.5*Bottom_Screw_ID} {.5*Bottom_Screw_OD} {.5*Bottom_Short_Screw_Height} 0 360

Volume Screw_in_Hole
Screw_in_Hole.Material PayloadScrewMat
Screw_in_Hole.Visibility {ShowPayload}
Screw_in_Hole.Shape TUBE 0 {.5*Bottom_Screw_ID} {.5*Screw_Helix_Length - .5*PCBThickness} 0 360

Volume Screw_Middle
Screw_Middle.Material PayloadScrewMat
Screw_Middle.Visibility {ShowPayload}
Screw_Middle.Shape TUBE 0 {.5*Screw_Head_Diameter} {.5*FPGA_HV_Offset - .5*PCBThickness} 0 360

Volume Screw_Top
Screw_Top.Material PayloadScrewMat
Screw_Top.Visibility {ShowPayload}
Screw_Top.Shape TUBE 0 {.5*Screw_Head_Diameter} {.5*Screw_Head_Height} 0 360



For I 2 {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD} {Bottom_Short_Screw_Width_Spacing}
	For J 3 {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD} {-Bottom_Short_Screw_Length_Spacing}
		Short_Screw_Hole.Copy Short_Screw_Hole_%I_%J
		Short_Screw_Hole_%I_%J.Position $I $J {Wall1_z - .5*Wall1_Width + Wall_Thickness + .5*Bottom_Short_Screw_Height}
		Short_Screw_Hole_%I_%J.Mother World
		
		Screw_in_Hole.Copy Short_Screw_in_Hole_%I_%J
		Short_Screw_in_Hole_%I_%J.Position $I $J {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height - .5*Screw_Helix_Length + .5*PCBThickness}
		Short_Screw_in_Hole_%I_%J.Mother World
	Done
Done

For I 2 {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD} {Bottom_Short_Screw_Width_Spacing}
	For J 2 {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing} {-Bottom_Short_Screw_Length_Spacing}
		
		Screw_Middle.Copy Screw_Middle_%I_%J
		Screw_Middle_%I_%J.Position $I $J {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + .5*PCBThickness + .5*FPGA_HV_Offset}
		Screw_Middle_%I_%J.Mother World
		
		Screw_Top.Copy Screw_Top_1_%I_%J
		Screw_Top_1_%I_%J.Position $I $J {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + 1.5*PCBThickness + FPGA_HV_Offset + .5*Screw_Head_Height}
		Screw_Top_1_%I_%J.Mother World
	Done
Done

For I 2 {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD} {Bottom_Short_Screw_Width_Spacing}
		
	Screw_Top.Copy Screw_Top_2_%I
	Screw_Top_2_%I.Position $I {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + .5*PCBThickness + .5*Screw_Head_Height}
	Screw_Top_2_%I.Mother World
Done

Volume Tall_Screw_Hole
Tall_Screw_Hole.Material PayloadWallMat
Tall_Screw_Hole.Visibility {ShowPayload}
Tall_Screw_Hole.Shape TUBE {.5*Bottom_Screw_ID} {.5*Bottom_Screw_OD} {.5*Bottom_Tall_Screw_Height} 0 360

For I 2 {Wall1_x + .5*Wall1_Length - Wall_Thickness - Bottom_Tall_Screw_Width_Offset - .5*Bottom_Screw_OD} {-Bottom_Tall_Screw_Width_Spacing}
	For J 2 {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + Bottom_Tall_Screw_Length_Offset + .5*Bottom_Screw_OD} {Bottom_Tall_Screw_Length_Spacing}
		Tall_Screw_Hole.Copy Tall_Screw_Hole_%I_%J
		Tall_Screw_Hole_%I_%J.Position $I $J {Wall1_z - .5*Wall1_Width + Wall_Thickness + .5*Bottom_Tall_Screw_Height}
		Tall_Screw_Hole_%I_%J.Mother World
		
		Screw_in_Hole.Copy Tall_Screw_in_Hole_%I_%J
		Tall_Screw_in_Hole_%I_%J.Position $I $J {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Tall_Screw_Height - .5*Screw_Helix_Length + .5*PCBThickness}
		Tall_Screw_in_Hole_%I_%J.Mother World
		
		Screw_Top.Copy Tall_Screw_Top_%I_%J
		Tall_Screw_Top_%I_%J.Position $I $J {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Tall_Screw_Height + PCBThickness + .5*Screw_Head_Height}
		Tall_Screw_Top_%I_%J.Mother World
		
	Done
Done

####################################################################################

Volume BB_Screw
BB_Screw.Material PayloadScrewMat
BB_Screw.Visibility {ShowPayload}
BB_Screw.Shape TUBE 0 {.5*Bottom_Screw_ID} {.5*PCBThickness} 0 360

Volume BeagleBone
BeagleBone.Visibility {ShowPayload}
BeagleBone.Material PayloadPCBMat
BeagleBone.Color 3
BeagleBone.Shape BOX {.5*BB_Width} {.5*BB_Length} {.5*BB_Depth}
BeagleBone.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - Bottom_Tall_Screw_Width_Offset - .5*Bottom_Screw_OD - .5*Bottom_Tall_Screw_Width_Spacing} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + Bottom_Tall_Screw_Length_Offset + .5*Bottom_Screw_OD + .5*Bottom_Tall_Screw_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Tall_Screw_Height + .5*BB_Depth}
BeagleBone.Mother World

For I 2 {-.5*Bottom_Tall_Screw_Width_Spacing} {Bottom_Tall_Screw_Width_Spacing}
	For J 2 {.5*Bottom_Tall_Screw_Length_Spacing} {-Bottom_Tall_Screw_Length_Spacing}
		
		BB_Screw.Copy BB_Screw_%I_%J
		BB_Screw_%I_%J.Position $I $J 0
		BB_Screw_%I_%J.Mother BeagleBone
		
	Done
Done

Volume FPGA_Screw
FPGA_Screw.Material PayloadScrewMat
FPGA_Screw.Visibility {ShowPayload}
FPGA_Screw.Shape TUBE 0 {.5*Bottom_Screw_ID} {.5*PCBThickness} 0 360

Volume FPGA
FPGA.Visibility {ShowPayload}
FPGA.Material PayloadPCBMat
FPGA.Color 3
FPGA.Shape BOX {.5*FPGA_Width} {.5*FPGA_Length} {.5*FPGA_Depth}
FPGA.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + .5*FPGA_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + .5*FPGA_Depth}
FPGA.Mother World

For I 2 {-.5*FPGA_Width + FPGA_Width_Offset} {Bottom_Short_Screw_Width_Spacing}
	For J 3 {Bottom_Short_Screw_Length_Spacing} {-Bottom_Short_Screw_Length_Spacing}
		
		FPGA_Screw.Copy FPGA_Screw_%I_%J
		FPGA_Screw_%I_%J.Position $I $J 0
		FPGA_Screw_%I_%J.Mother FPGA
		
	Done
Done

Volume HV_Screw
HV_Screw.Material PayloadScrewMat
HV_Screw.Visibility {ShowPayload}
HV_Screw.Shape TUBE 0 {.5*Bottom_Screw_ID} {.5*PCBThickness} 0 360

Volume HV
HV.Visibility {ShowPayload}
HV.Material PayloadPCBMat
HV.Color 3
HV.Shape BOX {.5*HV_Width} {.5*HV_Length} {.5*HV_Depth}
HV.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + .5*HV_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + .5*HV_Depth}
HV.Mother World

For I 2 {-.5*HV_Width + FPGA_Width_Offset} {Bottom_Short_Screw_Width_Spacing}
	For J 2 {.5*Bottom_Short_Screw_Length_Spacing} {-Bottom_Short_Screw_Length_Spacing}
		
		HV_Screw.Copy HV_Screw_%I_%J
		HV_Screw_%I_%J.Position $I $J 0
		HV_Screw_%I_%J.Mother HV
		
	Done
Done



##############################################################################

Volume PDU_Wall1
PDU_Wall1.Material PayloadWallMat
PDU_Wall1.Visibility {ShowPayload}
PDU_Wall1.Shape Box {.5*Wall1_Length} {.5*Wall_Thickness} {.5*PDU_Wall_Width}
PDU_Wall1.Position Wall1_x Wall1_y {Wall1_z - .5*Wall1_Width - .5*PDU_Wall_Width}
PDU_Wall1.Mother World

Volume PDU_Wall2
PDU_Wall2.Material PayloadWallMat
PDU_Wall2.Visibility {ShowPayload}
PDU_Wall2.Shape Box {.5*Wall1_Length} {.5*Wall_Thickness} {.5*PDU_Wall_Width}
PDU_Wall2.Position Wall1_x {Wall1_y - Wall1_2_Offset} {Wall1_z - .5*Wall1_Width - .5*PDU_Wall_Width}
PDU_Wall2.Mother World

Volume PDU_Wall3
PDU_Wall3.Material PayloadWallMat
PDU_Wall3.Visibility {ShowPayload}
PDU_Wall3.Shape Box {.5*Wall_Thickness} {.5*Wall1_2_Offset - .5*Wall_Thickness} {.5*PDU_Wall_Width}
PDU_Wall3.Position {Wall1_x - .5*Wall1_Length + .5*Wall_Thickness} {Wall1_y - .5*Wall1_2_Offset} {Wall1_z - .5*Wall1_Width - .5*PDU_Wall_Width}
PDU_Wall3.Mother World

Volume PDU_Wall4
PDU_Wall4.Material PayloadWallMat
PDU_Wall4.Visibility {ShowPayload}
PDU_Wall4.Shape Box {.5*Wall_Thickness} {.5*Wall1_2_Offset - .5*Wall_Thickness} {.5*PDU_Wall_Width}
PDU_Wall4.Position {Wall1_x + .5*Wall1_Length - .5*Wall_Thickness} {Wall1_y - .5*Wall1_2_Offset} {Wall1_z - .5*Wall1_Width - .5*PDU_Wall_Width}
PDU_Wall4.Mother World

Volume PDU_Bottom
PDU_Bottom.Material PayloadWallMat
PDU_Bottom.Visibility {ShowPayload}
PDU_Bottom.Shape Box {.5*Wall1_Length - Wall_Thickness} {.5*Wall1_2_Offset - .5*Wall_Thickness} {.5*Wall_Thickness}
PDU_Bottom.Position Wall1_x {Wall1_y - .5*Wall1_2_Offset} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + .5*Wall_Thickness}
PDU_Bottom.Mother World

############################################################################

Volume PDU_FootA
PDU_FootA.Material Vacuum
PDU_FootA.Visibility 0
PDU_FootA.Shape BOX {2*Foot_Outer_Radius} {2*Foot_Outer_Radius} {.5*PDU_Wall_Width}

Volume PDU_FootA_Subset1
PDU_FootA_Subset1.Material PayloadWallMat
PDU_FootA_Subset1.Visibility {ShowPayload}
PDU_FootA_Subset1.Shape TUBE 0 Foot_Outer_Radius {.5*PDU_Wall_Width} 0 180
PDU_FootA_Subset1.Position 0 0 0
PDU_FootA_Subset1.Mother PDU_FootA

Volume PDU_FootA_Subset1_Hole_Subtraction
PDU_FootA_Subset1_Hole_Subtraction.Material PayloadScrewMat
PDU_FootA_Subset1_Hole_Subtraction.Visibility {ShowPayload}
PDU_FootA_Subset1_Hole_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Diameter} {.5*PDU_Wall_Width} 0 180
PDU_FootA_Subset1_Hole_Subtraction.Position 0 0 0
PDU_FootA_Subset1_Hole_Subtraction.Mother PDU_FootA_Subset1

Volume PDU_FootA_Subset2
PDU_FootA_Subset2.Material PayloadWallMat
PDU_FootA_Subset2.Visibility {ShowPayload}
PDU_FootA_Subset2.Shape BOX {1.5*Foot_Outer_Radius} {.5*Foot_Outer_Radius} {.5*PDU_Wall_Width}
PDU_FootA_Subset2.Position {.5*Foot_Outer_Radius} {-.5*Foot_Outer_Radius} 0
PDU_FootA_Subset2.Mother PDU_FootA

Volume PDU_FootA_Subset2_Hole_Subtraction
PDU_FootA_Subset2_Hole_Subtraction.Material PayloadScrewMat
PDU_FootA_Subset2_Hole_Subtraction.Visibility {ShowPayload}
PDU_FootA_Subset2_Hole_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Diameter} {.5*PDU_Wall_Width} 180 360
PDU_FootA_Subset2_Hole_Subtraction.Position {-.5*Foot_Outer_Radius} {.5*Foot_Outer_Radius} 0
PDU_FootA_Subset2_Hole_Subtraction.Mother PDU_FootA_Subset2

Volume PDU_FootA_Subset2_Edge_Subtraction
PDU_FootA_Subset2_Edge_Subtraction.Material Vacuum
PDU_FootA_Subset2_Edge_Subtraction.Visibility {ShowPayload}
PDU_FootA_Subset2_Edge_Subtraction.Shape TUBE 0 {Foot_Outer_Radius} {.5*PDU_Wall_Width} 180 270
PDU_FootA_Subset2_Edge_Subtraction.Position {1.5*Foot_Outer_Radius} {.5*Foot_Outer_Radius} 0
PDU_FootA_Subset2_Edge_Subtraction.Mother PDU_FootA_Subset2

PDU_FootA.Copy PDU_FootA1
PDU_FootA1.Position {Wall1_x - .5*Wall1_Length + Foot_Outer_Radius} {Wall1_y + .5*Wall_Thickness + Foot_Outer_Radius} {Wall1_z - .5*Wall1_Width - .5*PDU_Wall_Width}
PDU_FootA1.Mother World

PDU_FootA.Copy PDU_FootA2
PDU_FootA2.Position {Wall1_x + .5*Wall1_Length - Foot_Outer_Radius} {Wall1_y - .5*Wall_Thickness - Foot_Outer_Radius - Wall1_2_Offset} {Wall1_z - .5*Wall1_Width - .5*PDU_Wall_Width}
PDU_FootA2.Rotation 0 0 180
PDU_FootA2.Mother World

############################################################################

Volume PDU_FootB
PDU_FootB.Material Vacuum
PDU_FootB.Visibility 0
PDU_FootB.Shape BOX {2*Foot_Outer_Radius} {2*Foot_Outer_Radius} {.5*PDU_Wall_Width}

Volume PDU_FootB_Subset1
PDU_FootB_Subset1.Material PayloadWallMat
PDU_FootB_Subset1.Visibility {ShowPayload}
PDU_FootB_Subset1.Shape TUBE 0 Foot_Outer_Radius {.5*PDU_Wall_Width} 0 180
PDU_FootB_Subset1.Position 0 0 0
PDU_FootB_Subset1.Mother PDU_FootB

Volume PDU_FootB_Subset1_Hole_Subtraction
PDU_FootB_Subset1_Hole_Subtraction.Material PayloadScrewMat
PDU_FootB_Subset1_Hole_Subtraction.Visibility {ShowPayload}
PDU_FootB_Subset1_Hole_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Diameter} {.5*PDU_Wall_Width} 0 180
PDU_FootB_Subset1_Hole_Subtraction.Position 0 0 0
PDU_FootB_Subset1_Hole_Subtraction.Mother PDU_FootB_Subset1

Volume PDU_FootB_Subset2
PDU_FootB_Subset2.Material PayloadWallMat
PDU_FootB_Subset2.Visibility {ShowPayload}
PDU_FootB_Subset2.Shape BOX {1.5*Foot_Outer_Radius} {.5*Foot_Outer_Radius} {.5*PDU_Wall_Width}
PDU_FootB_Subset2.Position {-.5*Foot_Outer_Radius} {-.5*Foot_Outer_Radius} 0
PDU_FootB_Subset2.Mother PDU_FootB

Volume PDU_FootB_Subset2_Hole_Subtraction
PDU_FootB_Subset2_Hole_Subtraction.Material PayloadScrewMat
PDU_FootB_Subset2_Hole_Subtraction.Visibility {ShowPayload}
PDU_FootB_Subset2_Hole_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Diameter} {.5*PDU_Wall_Width} 180 360
PDU_FootB_Subset2_Hole_Subtraction.Position {.5*Foot_Outer_Radius} {.5*Foot_Outer_Radius} 0
PDU_FootB_Subset2_Hole_Subtraction.Mother PDU_FootB_Subset2

Volume PDU_FootB_Subset2_Edge_Subtraction
PDU_FootB_Subset2_Edge_Subtraction.Material Vacuum
PDU_FootB_Subset2_Edge_Subtraction.Visibility {ShowPayload}
PDU_FootB_Subset2_Edge_Subtraction.Shape TUBE 0 {Foot_Outer_Radius} {.5*PDU_Wall_Width} 270 360
PDU_FootB_Subset2_Edge_Subtraction.Position {-1.5*Foot_Outer_Radius} {.5*Foot_Outer_Radius} 0
PDU_FootB_Subset2_Edge_Subtraction.Mother PDU_FootB_Subset2

PDU_FootB.Copy PDU_FootB1
PDU_FootB1.Position {Wall1_x + .5*Wall1_Length - Foot_Outer_Radius} {Wall1_y + .5*Wall_Thickness + Foot_Outer_Radius} {Wall1_z - .5*Wall1_Width - .5*PDU_Wall_Width}
PDU_FootB1.Mother World

PDU_FootB.Copy PDU_FootB2
PDU_FootB2.Position {Wall1_x - .5*Wall1_Length + Foot_Outer_Radius} {Wall1_y - .5*Wall_Thickness - Foot_Outer_Radius - Wall1_2_Offset} {Wall1_z - .5*Wall1_Width - .5*PDU_Wall_Width}
PDU_FootB2.Rotation 0 0 180
PDU_FootB2.Mother World

########################################################################

Volume PDU_FootC
PDU_FootC.Material Vacuum
PDU_FootC.Visibility 0
PDU_FootC.Shape BOX {2*Foot_Outer_Radius} {2*Foot_Outer_Radius} {.5*PDU_Wall_Width}

Volume PDU_FootC_Subset1
PDU_FootC_Subset1.Material PayloadWallMat
PDU_FootC_Subset1.Visibility {ShowPayload}
PDU_FootC_Subset1.Shape TUBE 0 Foot_Outer_Radius {.5*PDU_Wall_Width} 0 180
PDU_FootC_Subset1.Position 0 0 0
PDU_FootC_Subset1.Mother PDU_FootC

Volume PDU_FootC_Subset1_Hole_Subtraction
PDU_FootC_Subset1_Hole_Subtraction.Material PayloadScrewMat
PDU_FootC_Subset1_Hole_Subtraction.Visibility {ShowPayload}
PDU_FootC_Subset1_Hole_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Diameter} {.5*PDU_Wall_Width} 0 180
PDU_FootC_Subset1_Hole_Subtraction.Position 0 0 0
PDU_FootC_Subset1_Hole_Subtraction.Mother PDU_FootC_Subset1

Volume PDU_FootC_Subset2
PDU_FootC_Subset2.Material PayloadWallMat
PDU_FootC_Subset2.Visibility {ShowPayload}
PDU_FootC_Subset2.Shape BOX {2*Foot_Outer_Radius} {.5*Foot_Outer_Radius} {.5*PDU_Wall_Width}
PDU_FootC_Subset2.Position 0 {-.5*Foot_Outer_Radius} 0
PDU_FootC_Subset2.Mother PDU_FootC

Volume PDU_FootC_Subset2_Hole_Subtraction
PDU_FootC_Subset2_Hole_Subtraction.Material PayloadScrewMat
PDU_FootC_Subset2_Hole_Subtraction.Visibility {ShowPayload}
PDU_FootC_Subset2_Hole_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Diameter} {.5*PDU_Wall_Width} 180 360
PDU_FootC_Subset2_Hole_Subtraction.Position 0 {.5*Foot_Outer_Radius} 0
PDU_FootC_Subset2_Hole_Subtraction.Mother PDU_FootC_Subset2

Volume PDU_FootC_Subset2_Edge_Subtraction1
PDU_FootC_Subset2_Edge_Subtraction1.Material Vacuum
PDU_FootC_Subset2_Edge_Subtraction1.Visibility {ShowPayload}
PDU_FootC_Subset2_Edge_Subtraction1.Shape TUBE 0 {Foot_Outer_Radius} {.5*PDU_Wall_Width} 270 360
PDU_FootC_Subset2_Edge_Subtraction1.Position {-2*Foot_Outer_Radius} {.5*Foot_Outer_Radius} 0
PDU_FootC_Subset2_Edge_Subtraction1.Mother PDU_FootC_Subset2

Volume PDU_FootC_Subset2_Edge_Subtraction2
PDU_FootC_Subset2_Edge_Subtraction2.Material Vacuum
PDU_FootC_Subset2_Edge_Subtraction2.Visibility {ShowPayload}
PDU_FootC_Subset2_Edge_Subtraction2.Shape TUBE 0 {Foot_Outer_Radius} {.5*PDU_Wall_Width} 180 270
PDU_FootC_Subset2_Edge_Subtraction2.Position {2*Foot_Outer_Radius} {.5*Foot_Outer_Radius} 0
PDU_FootC_Subset2_Edge_Subtraction2.Mother PDU_FootC_Subset2

PDU_FootC.Copy PDU_FootC1
PDU_FootC1.Position {Wall1_x - .5*Wall1_Length - Foot_Outer_Radius} {Wall1_y + .5*Wall_Thickness - Foot_Side_Offset - 2*Foot_Outer_Radius} {Wall1_z - .5*Wall1_Width - .5*PDU_Wall_Width}
PDU_FootC1.Rotation 0 0 90
PDU_FootC1.Mother World

PDU_FootC.Copy PDU_FootC2
PDU_FootC2.Position {Wall1_x - .5*Wall1_Length - Foot_Outer_Radius} {Wall1_y - Wall1_2_Offset - .5*Wall_Thickness + Foot_Side_Offset + 2*Foot_Outer_Radius} {Wall1_z - .5*Wall1_Width - .5*PDU_Wall_Width}
PDU_FootC2.Rotation 0 0 90
PDU_FootC2.Mother World

PDU_FootC.Copy PDU_FootC3
PDU_FootC3.Position {Wall1_x + .5*Wall1_Length + Foot_Outer_Radius} {Wall1_y + .5*Wall_Thickness - Foot_Side_Offset - 2*Foot_Outer_Radius} {Wall1_z - .5*Wall1_Width - .5*PDU_Wall_Width}
PDU_FootC3.Rotation 0 0 270
PDU_FootC3.Mother World

PDU_FootC.Copy PDU_FootC4
PDU_FootC4.Position {Wall1_x + .5*Wall1_Length + Foot_Outer_Radius} {Wall1_y - Wall1_2_Offset - .5*Wall_Thickness + Foot_Side_Offset + 2*Foot_Outer_Radius} {Wall1_z - .5*Wall1_Width - .5*PDU_Wall_Width}
PDU_FootC4.Rotation 0 0 270
PDU_FootC4.Mother World

#################################################################################

Volume PDU_Wall2_Hole
PDU_Wall2_Hole.Material PayloadWallMat
PDU_Wall2_Hole.Visibility {ShowPayload}
PDU_Wall2_Hole.Shape Box {PDU_Wall2_Hole_Ledge_Width + PDU_Wall2_Hole_Wing_Radius + PDU_Wall2_Hole_Wing_Width + .5*PDU_Wall2_Hole_Center_Width} {.5*Wall_Thickness} {.5*PDU_Wall2_Hole_Center_Height}

Volume PDU_Wall2_Hole_Center
PDU_Wall2_Hole_Center.Material Vacuum
PDU_Wall2_Hole_Center.Visibility {ShowPayload}
PDU_Wall2_Hole_Center.Shape Box {.5*PDU_Wall2_Hole_Center_Width} {.5*Wall_Thickness} {.5*PDU_Wall2_Hole_Center_Height}
PDU_Wall2_Hole_Center.Position 0 0 0
PDU_Wall2_Hole_Center.Mother PDU_Wall2_Hole

Volume PDU_Wall2_Hole_Wing1_Rectangle
PDU_Wall2_Hole_Wing1_Rectangle.Material Vacuum
PDU_Wall2_Hole_Wing1_Rectangle.Visibility {ShowPayload}
PDU_Wall2_Hole_Wing1_Rectangle.Shape Box {.5*PDU_Wall2_Hole_Wing_Width} {.5*Wall_Thickness} {PDU_Wall2_Hole_Wing_Radius}
PDU_Wall2_Hole_Wing1_Rectangle.Position {-.5*PDU_Wall2_Hole_Center_Width - .5*PDU_Wall2_Hole_Wing_Width} 0 0
PDU_Wall2_Hole_Wing1_Rectangle.Mother PDU_Wall2_Hole

Volume PDU_Wall2_Hole_Wing2_Rectangle
PDU_Wall2_Hole_Wing2_Rectangle.Material Vacuum
PDU_Wall2_Hole_Wing2_Rectangle.Visibility {ShowPayload}
PDU_Wall2_Hole_Wing2_Rectangle.Shape Box {.5*PDU_Wall2_Hole_Wing_Width} {.5*Wall_Thickness} {PDU_Wall2_Hole_Wing_Radius}
PDU_Wall2_Hole_Wing2_Rectangle.Position {.5*PDU_Wall2_Hole_Center_Width + .5*PDU_Wall2_Hole_Wing_Width} 0 0
PDU_Wall2_Hole_Wing2_Rectangle.Mother PDU_Wall2_Hole

Volume PDU_Wall2_Hole_Wing1_Circle
PDU_Wall2_Hole_Wing1_Circle.Material Vacuum
PDU_Wall2_Hole_Wing1_Circle.Visibility {ShowPayload}
PDU_Wall2_Hole_Wing1_Circle.Shape Tube {0} {PDU_Wall2_Hole_Wing_Radius} {.5*Wall_Thickness} 90 270
PDU_Wall2_Hole_Wing1_Circle.Position {-.5*PDU_Wall2_Hole_Center_Width - PDU_Wall2_Hole_Wing_Width} 0 0
PDU_Wall2_Hole_Wing1_Circle.Rotation 90 0 0
PDU_Wall2_Hole_Wing1_Circle.Mother PDU_Wall2_Hole

Volume PDU_Wall2_Hole_Wing2_Circle
PDU_Wall2_Hole_Wing2_Circle.Material Vacuum
PDU_Wall2_Hole_Wing2_Circle.Visibility {ShowPayload}
PDU_Wall2_Hole_Wing2_Circle.Shape Tube {0} {PDU_Wall2_Hole_Wing_Radius} {.5*Wall_Thickness} 90 270
PDU_Wall2_Hole_Wing2_Circle.Position {.5*PDU_Wall2_Hole_Center_Width + PDU_Wall2_Hole_Wing_Width} 0 0
PDU_Wall2_Hole_Wing2_Circle.Rotation 90 0 180
PDU_Wall2_Hole_Wing2_Circle.Mother PDU_Wall2_Hole

Volume PDU_Wall2_Hole_Wing1_Edge
PDU_Wall2_Hole_Wing1_Edge.Material Vacuum
PDU_Wall2_Hole_Wing1_Edge.Visibility {ShowPayload}
PDU_Wall2_Hole_Wing1_Edge.Shape Tube {PDU_Wall2_Hole_Wing_Radius} {PDU_Wall2_Hole_Wing_Radius + PDU_Wall2_Hole_Ledge_Width} {.5*PDU_Wall2_Hole_Ledge_Depth} 90 270
PDU_Wall2_Hole_Wing1_Edge.Position {-.5*PDU_Wall2_Hole_Center_Width - PDU_Wall2_Hole_Wing_Width} {-.5*Wall_Thickness + .5*PDU_Wall2_Hole_Ledge_Depth} 0
PDU_Wall2_Hole_Wing1_Edge.Rotation 90 0 0
PDU_Wall2_Hole_Wing1_Edge.Mother PDU_Wall2_Hole

Volume PDU_Wall2_Hole_Wing2_Edge
PDU_Wall2_Hole_Wing2_Edge.Material Vacuum
PDU_Wall2_Hole_Wing2_Edge.Visibility {ShowPayload}
PDU_Wall2_Hole_Wing2_Edge.Shape Tube {PDU_Wall2_Hole_Wing_Radius} {PDU_Wall2_Hole_Wing_Radius + PDU_Wall2_Hole_Ledge_Width} {.5*PDU_Wall2_Hole_Ledge_Depth} 90 270
PDU_Wall2_Hole_Wing2_Edge.Position {.5*PDU_Wall2_Hole_Center_Width + PDU_Wall2_Hole_Wing_Width} {-.5*Wall_Thickness + .5*PDU_Wall2_Hole_Ledge_Depth} 0
PDU_Wall2_Hole_Wing2_Edge.Rotation 90 0 180
PDU_Wall2_Hole_Wing2_Edge.Mother PDU_Wall2_Hole

PDU_Wall2_Hole.Copy PDU_Wall2_Hole1
PDU_Wall2_Hole1.Position {.5*Wall1_Length - PDU_Wall2_Hole_Length_Offset} 0 {.5*PDU_Wall_Width - PDU_Wall2_Hole_Width_Offset - .5*PDU_Wall2_Hole_Center_Height}
PDU_Wall2_Hole1.Mother PDU_Wall2

PDU_Wall2_Hole.Copy PDU_Wall2_Hole2
PDU_Wall2_Hole2.Position {.5*Wall1_Length - PDU_Wall2_Hole_Length_Offset - PDU_Wall2_Hole_Length_Spacing} 0 {.5*PDU_Wall_Width - PDU_Wall2_Hole_Width_Offset - .5*PDU_Wall2_Hole_Center_Height}
PDU_Wall2_Hole2.Mother PDU_Wall2

################################################################################

Volume PDU_Screw_Hole
PDU_Screw_Hole.Material PayloadWallMat
PDU_Screw_Hole.Visibility {ShowPayload}
PDU_Screw_Hole.Shape Tube {.5*PDU_Screw_ID} {.5*PDU_Screw_OD} {.5*PDU_Screw_Height} 0 360

Volume PDU_Screw_Insert
PDU_Screw_Insert.Material PayloadScrewMat
PDU_Screw_Insert.Visibility {ShowPayload}
PDU_Screw_Insert.Shape Tube 0 {.5*PDU_Screw_ID} {.5*Screw_Helix_Length - .5*PDU_Height} 0 360

Volume PDU_Screw_Head
PDU_Screw_Head.Material PayloadScrewMat
PDU_Screw_Head.Visibility {ShowPayload}
PDU_Screw_Head.Shape Tube 0 {.5*Screw_Head_Diameter} {.5*Screw_Head_Height} 0 360

For I 3 {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Screw_Width_Offset - .5*PDU_Screw_OD} {-PDU_Screw_Spacing}
	For J 3 {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD} {PDU_Screw_Spacing}
		
		PDU_Screw_Hole.Copy PDU_Screw_Hole_%I_%J
		PDU_Screw_Hole_%I_%J.Position $I $J {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + .5*PDU_Screw_Height}
		PDU_Screw_Hole_%I_%J.Mother World
		
		PDU_Screw_Insert.Copy PDU_Screw_Insert_%I_%J
		PDU_Screw_Insert_%I_%J.Position $I $J {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height - .5*Screw_Helix_Length + .5*PDU_Height}
		PDU_Screw_Insert_%I_%J.Mother World
		
		PDU_Screw_Head.Copy PDU_Screw_Head_%I_%J
		PDU_Screw_Head_%I_%J.Position $I $J {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*Screw_Head_Height}
		PDU_Screw_Head_%I_%J.Mother World
		
	Done
Done

################################################################################

Volume PDU_Rectangle
PDU_Rectangle.Material PayloadWallMat
PDU_Rectangle.Visibility {ShowPayload}
PDU_Rectangle.Shape BOX {.5*PDU_Rectangle_Width} {.5*PDU_Rectangle_Length} {.5*PDU_Rectangle_Height}

For I 2 {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Rectangle_Width_Offset - .5*PDU_Rectangle_Width} {-PDU_Rectangle_Spacing - PDU_Rectangle_Width}
		
		PDU_Rectangle.Copy PDU_Rectangle_%I
		PDU_Rectangle_%I.Position $I {Wall1_y - .5*Wall_Thickness - PDU_Rectangle_Length_Offset - .5*PDU_Rectangle_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + .5*PDU_Rectangle_Height}
		PDU_Rectangle_%I.Mother World
		
	Done
Done

Volume PDU
PDU.Material PayloadPCBMat
PDU.Visibility {ShowPayload}
PDU.Color 3
PDU.Shape BOX {.5*PDU_Width} {.5*PDU_Length} {.5*PDU_Height}
PDU.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - .5*PDU_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + .5*PDU_Height}
PDU.Mother World

Volume PDU_Screw
PDU_Screw.Material PayloadScrewMat
PDU_Screw.Visibility {ShowPayload}
PDU_Screw.Shape Tube 0 {.5*PDU_Screw_ID} {.5*PDU_Height} 0 360

For I 3 {PDU_Screw_Spacing} {-PDU_Screw_Spacing}
	For J 3 {PDU_Screw_Spacing} {-PDU_Screw_Spacing}
				
		PDU_Screw.Copy PDU_Screw_%I_%J
		PDU_Screw_%I_%J.Position $I $J 0
		PDU_Screw_%I_%J.Mother PDU
		
	Done
Done

################################################################################

Constant DB9_Width 3.0734
Constant DB9_Length 1.143
Constant DB9_Height 1.0668
Constant DB9_Steel_Face_Thickness 0.1016
Constant DB9_Width_Offset 1.4732
Constant DB9_Width_Spacing 5.588

Volume DB9
DB9.Material Vacuum
DB9.Visibility 0
DB9.Shape BOX {.5*DB9_Width} {.5*DB9_Length + .5*DB9_Steel_Face_Thickness} {.5*DB9_Height}

Volume DB9_PBT
DB9_PBT.Material PBT
DB9_PBT.Visibility {ShowPayload}
DB9_PBT.Shape BOX {.5*DB9_Width} {.5*DB9_Length} {.5*DB9_Height}
DB9_PBT.Position 0 {-.5*DB9_Steel_Face_Thickness} 0
DB9_PBT.Mother DB9

Volume DB9_Steel
DB9_Steel.Material Steel_18_8
DB9_Steel.Visibility {ShowPayload}
DB9_Steel.Shape BOX {.5*DB9_Width} {.5*DB9_Steel_Face_Thickness} {.5*DB9_Height}
DB9_Steel.Position 0 {.5*DB9_Length} 0
DB9_Steel.Mother DB9

DB9.Copy DB9_1
DB9_1.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - DB9_Width_Offset - .5*DB9_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing + .5*PDU_Length - .5*DB9_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*DB9_Height}
DB9_1.Mother World

DB9.Copy DB9_2
DB9_2.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - DB9_Width_Offset - .5*DB9_Width - DB9_Width_Spacing} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing + .5*PDU_Length - .5*DB9_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*DB9_Height}
DB9_2.Mother World

DB9.Copy DB9_3
DB9_3.Rotation 0 0 180
DB9_3.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - DB9_Width_Offset - .5*DB9_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing - .5*PDU_Length + .5*DB9_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*DB9_Height}
DB9_3.Mother World

DB9.Copy DB9_4
DB9_4.Rotation 0 0 180
DB9_4.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - DB9_Width_Offset - .5*DB9_Width - DB9_Width_Spacing} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing - .5*PDU_Length + .5*DB9_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*DB9_Height}
DB9_4.Mother World

Constant PDU_Box2_Width 0.508
Constant PDU_Box2_Length 0.9398
Constant PDU_Box2_Height 0.4064
Constant PDU_Box2_Width_Offset 2.7432
Constant PDU_Box2_Length_Offset 2.2352

Volume PDU_Box2
PDU_Box2.Material PBT
PDU_Box2.Visibility {ShowPayload}
PDU_Box2.Shape BOX {.5*PDU_Box2_Width} {.5*PDU_Box2_Length} {.5*PDU_Box2_Height}

PDU_Box2.Copy PDU_Box2_1
PDU_Box2_1.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - PDU_Box2_Width_Offset - .5*PDU_Box2_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing - .5*PDU_Length + PDU_Box2_Length_Offset + .5*PDU_Box2_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*PDU_Box2_Height}
PDU_Box2_1.Mother World

PDU_Box2.Copy PDU_Box2_2
PDU_Box2_2.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - PDU_Box2_Width_Offset - .5*PDU_Box2_Width - DB9_Width_Spacing} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing - .5*PDU_Length + PDU_Box2_Length_Offset + .5*PDU_Box2_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*PDU_Box2_Height}
PDU_Box2_2.Mother World

Constant PDU_Box3_Width 0.6858
Constant PDU_Box3_Length 0.4064
Constant PDU_Box3_Height 0.127
Constant PDU_Box3_Width_Offset 2.921
Constant PDU_Box3_Length_Offset 3.7592

Volume PDU_Box3
PDU_Box3.Material PBT
PDU_Box3.Visibility {ShowPayload}
PDU_Box3.Shape BOX {.5*PDU_Box3_Width} {.5*PDU_Box3_Length} {.5*PDU_Box3_Height}

PDU_Box3.Copy PDU_Box3_1
PDU_Box3_1.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - PDU_Box3_Width_Offset - .5*PDU_Box3_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing - .5*PDU_Length + PDU_Box3_Length_Offset + .5*PDU_Box3_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*PDU_Box3_Height}
PDU_Box3_1.Mother World

PDU_Box3.Copy PDU_Box3_2
PDU_Box3_2.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - PDU_Box3_Width_Offset - .5*PDU_Box3_Width - DB9_Width_Spacing} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing - .5*PDU_Length + PDU_Box3_Length_Offset + .5*PDU_Box3_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*PDU_Box3_Height}
PDU_Box3_2.Mother World

Constant PDU_Box4_Width 0.7112
Constant PDU_Box4_Length 0.6858
Constant PDU_Box4_Height 0.381
Constant PDU_Box4_Width_Offset 2.4638
Constant PDU_Box4_Length_Offset 4.699
Constant PDU_Box4_Width_Spacing 0.889

Volume PDU_Box4
PDU_Box4.Material PBT
PDU_Box4.Visibility {ShowPayload}
PDU_Box4.Shape BOX {.5*PDU_Box4_Width} {.5*PDU_Box4_Length} {.5*PDU_Box4_Height}

PDU_Box4.Copy PDU_Box4_1
PDU_Box4_1.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - PDU_Box4_Width_Offset - .5*PDU_Box4_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing - .5*PDU_Length + PDU_Box4_Length_Offset + .5*PDU_Box4_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*PDU_Box4_Height}
PDU_Box4_1.Mother World

PDU_Box4.Copy PDU_Box4_1b
PDU_Box4_1b.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - PDU_Box4_Width_Offset - .5*PDU_Box4_Width - PDU_Box4_Width_Spacing} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing - .5*PDU_Length + PDU_Box4_Length_Offset + .5*PDU_Box4_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*PDU_Box4_Height}
PDU_Box4_1b.Mother World

PDU_Box4.Copy PDU_Box4_2
PDU_Box4_2.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - PDU_Box4_Width_Offset - .5*PDU_Box4_Width - DB9_Width_Spacing} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing - .5*PDU_Length + PDU_Box4_Length_Offset + .5*PDU_Box4_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*PDU_Box4_Height}
PDU_Box4_2.Mother World

PDU_Box4.Copy PDU_Box4_2b
PDU_Box4_2b.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - PDU_Box4_Width_Offset - .5*PDU_Box4_Width - PDU_Box4_Width_Spacing - DB9_Width_Spacing} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing - .5*PDU_Length + PDU_Box4_Length_Offset + .5*PDU_Box4_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*PDU_Box4_Height}
PDU_Box4_2b.Mother World

Constant PDU_Box5_Width 0.3048
Constant PDU_Box5_Length 0.1778
Constant PDU_Box5_Height 0.1016
Constant PDU_Box5_Width_Offset 3.1242
Constant PDU_Box5_Length_Offset 5.842

Volume PDU_Box5
PDU_Box5.Material PBT
PDU_Box5.Visibility {ShowPayload}
PDU_Box5.Shape BOX {.5*PDU_Box5_Width} {.5*PDU_Box5_Length} {.5*PDU_Box5_Height}

PDU_Box5.Copy PDU_Box5_1
PDU_Box5_1.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - PDU_Box5_Width_Offset - .5*PDU_Box5_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing - .5*PDU_Length + PDU_Box5_Length_Offset + .5*PDU_Box5_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*PDU_Box5_Height}
PDU_Box5_1.Mother World

PDU_Box5.Copy PDU_Box5_2
PDU_Box5_2.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - PDU_Box5_Width_Offset - .5*PDU_Box5_Width - DB9_Width_Spacing} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing - .5*PDU_Length + PDU_Box5_Length_Offset + .5*PDU_Box5_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*PDU_Box5_Height}
PDU_Box5_2.Mother World

Constant PDU_Box6_Width 2.54
Constant PDU_Box6_Length 2.54
Constant PDU_Box6_Height 1.016
Constant PDU_Box6_Width_Offset 2.0066
Constant PDU_Box6_Length_Offset 6.2738

Volume PDU_Box6
PDU_Box6.Material PBT
PDU_Box6.Visibility {ShowPayload}
PDU_Box6.Shape BOX {.5*PDU_Box6_Width} {.5*PDU_Box6_Length} {.5*PDU_Box6_Height}

PDU_Box6.Copy PDU_Box6_1
PDU_Box6_1.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - PDU_Box6_Width_Offset - .5*PDU_Box6_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing - .5*PDU_Length + PDU_Box6_Length_Offset + .5*PDU_Box6_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*PDU_Box6_Height}
PDU_Box6_1.Mother World

PDU_Box6.Copy PDU_Box6_2
PDU_Box6_2.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - PDU_Box6_Width_Offset - .5*PDU_Box6_Width - DB9_Width_Spacing} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing - .5*PDU_Length + PDU_Box6_Length_Offset + .5*PDU_Box6_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*PDU_Box6_Height}
PDU_Box6_2.Mother World

Constant PDU_Box7_Width 0.31496
Constant PDU_Box7_Length 0.1778
Constant PDU_Box7_Height 0.10668
Constant PDU_Box7_Width_Offset 2.8448
Constant PDU_Box7_Length_Offset 9.5123

Volume PDU_Box7
PDU_Box7.Material PBT
PDU_Box7.Visibility {ShowPayload}
PDU_Box7.Shape BOX {.5*PDU_Box7_Width} {.5*PDU_Box7_Length} {.5*PDU_Box7_Height}

PDU_Box7.Copy PDU_Box7_1
PDU_Box7_1.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - PDU_Box7_Width_Offset - .5*PDU_Box7_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing - .5*PDU_Length + PDU_Box7_Length_Offset + .5*PDU_Box7_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*PDU_Box7_Height}
PDU_Box7_1.Mother World

PDU_Box7.Copy PDU_Box7_2
PDU_Box7_2.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - PDU_Box7_Width_Offset - .5*PDU_Box7_Width - DB9_Width_Spacing} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing - .5*PDU_Length + PDU_Box7_Length_Offset + .5*PDU_Box7_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*PDU_Box7_Height}
PDU_Box7_2.Mother World

Constant PDU_Box8_Width 0.762
Constant PDU_Box8_Length 0.57912
Constant PDU_Box8_Height 0.2667
Constant PDU_Box8_Width_Offset 2.61874
Constant PDU_Box8_Length_Offset 9.83488

Volume PDU_Box8
PDU_Box8.Material PBT
PDU_Box8.Visibility {ShowPayload}
PDU_Box8.Shape BOX {.5*PDU_Box8_Width} {.5*PDU_Box8_Length} {.5*PDU_Box8_Height}

PDU_Box8.Copy PDU_Box8_1
PDU_Box8_1.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - PDU_Box8_Width_Offset - .5*PDU_Box8_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing - .5*PDU_Length + PDU_Box8_Length_Offset + .5*PDU_Box8_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*PDU_Box8_Height}
PDU_Box8_1.Mother World

PDU_Box8.Copy PDU_Box8_2
PDU_Box8_2.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - PDU_Offset - PDU_Box8_Width_Offset - .5*PDU_Box8_Width - DB9_Width_Spacing} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + PDU_Screw_Length_Offset + .5*PDU_Screw_OD + PDU_Screw_Spacing - .5*PDU_Length + PDU_Box8_Length_Offset + .5*PDU_Box8_Length} {Wall1_z - .5*Wall1_Width - PDU_Wall_Width + Wall_Thickness + PDU_Screw_Height + PDU_Height + .5*PDU_Box8_Height}
PDU_Box8_2.Mother World

##################################################################################

Constant BB_Box1_Width 1.6002
Constant BB_Box1_Length 2.1336
Constant BB_Box1_Height 1.27
Constant BB_Box1_Width_Offset 2.1844
Constant BB_Box1_Length_Offset -0.2286

Volume BB_Box1
BB_Box1.Material PBT
BB_Box1.Visibility {ShowPayload}
BB_Box1.Shape BOX {.5*BB_Box1_Width} {.5*BB_Box1_Length} {.5*BB_Box1_Height}
BB_Box1.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - Bottom_Tall_Screw_Width_Offset - .5*Bottom_Screw_OD - .5*Bottom_Tall_Screw_Width_Spacing + .5*BB_Width - BB_Box1_Width_Offset - .5*BB_Box1_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + Bottom_Tall_Screw_Length_Offset + .5*Bottom_Screw_OD + .5*Bottom_Tall_Screw_Length_Spacing - .5*BB_Length + BB_Box1_Length_Offset + .5*BB_Box1_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Tall_Screw_Height + BB_Depth + .5*BB_Box1_Height}
BB_Box1.Mother World

Constant BB_Box2_Width 0.6096
Constant BB_Box2_Length 0.6096
Constant BB_Box2_Height 0.127
Constant BB_Box2_Width_Offset 1.1938
Constant BB_Box2_Length_Offset 1.9304

Volume BB_Box2
BB_Box2.Material PBT
BB_Box2.Visibility {ShowPayload}
BB_Box2.Shape BOX {.5*BB_Box2_Width} {.5*BB_Box2_Length} {.5*BB_Box2_Height}
BB_Box2.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - Bottom_Tall_Screw_Width_Offset - .5*Bottom_Screw_OD - .5*Bottom_Tall_Screw_Width_Spacing + .5*BB_Width - BB_Box2_Width_Offset - .5*BB_Box2_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + Bottom_Tall_Screw_Length_Offset + .5*Bottom_Screw_OD + .5*Bottom_Tall_Screw_Length_Spacing - .5*BB_Length + BB_Box2_Length_Offset + .5*BB_Box2_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Tall_Screw_Height + BB_Depth + .5*BB_Box2_Height}
BB_Box2.Mother World

Constant BB_Box3_Width 1.1938
Constant BB_Box3_Length 1.2954
Constant BB_Box3_Height 0.127
Constant BB_Box3_Width_Offset 3.556
Constant BB_Box3_Length_Offset 2.3114

Volume BB_Box3
BB_Box3.Material PBT
BB_Box3.Visibility {ShowPayload}
BB_Box3.Shape BOX {.5*BB_Box3_Width} {.5*BB_Box3_Length} {.5*BB_Box3_Height}
BB_Box3.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - Bottom_Tall_Screw_Width_Offset - .5*Bottom_Screw_OD - .5*Bottom_Tall_Screw_Width_Spacing + .5*BB_Width - BB_Box3_Width_Offset - .5*BB_Box3_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + Bottom_Tall_Screw_Length_Offset + .5*Bottom_Screw_OD + .5*Bottom_Tall_Screw_Length_Spacing - .5*BB_Length + BB_Box3_Length_Offset + .5*BB_Box3_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Tall_Screw_Height + BB_Depth + .5*BB_Box3_Height}
BB_Box3.Mother World

Constant BB_Box4_Width 0.3302
Constant BB_Box4_Length 0.508
Constant BB_Box4_Height 0.127
Constant BB_Box4_Width_Offset 2.3876
Constant BB_Box4_Length_Offset 2.2098

Volume BB_Box4
BB_Box4.Material PBT
BB_Box4.Visibility {ShowPayload}
BB_Box4.Shape BOX {.5*BB_Box4_Width} {.5*BB_Box4_Length} {.5*BB_Box4_Height}
BB_Box4.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - Bottom_Tall_Screw_Width_Offset - .5*Bottom_Screw_OD - .5*Bottom_Tall_Screw_Width_Spacing + .5*BB_Width - BB_Box4_Width_Offset - .5*BB_Box4_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + Bottom_Tall_Screw_Length_Offset + .5*Bottom_Screw_OD + .5*Bottom_Tall_Screw_Length_Spacing - .5*BB_Length + BB_Box4_Length_Offset + .5*BB_Box4_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Tall_Screw_Height + BB_Depth + .5*BB_Box4_Height}
BB_Box4.Mother World

Constant BB_Box5_Width 0.4826
Constant BB_Box5_Length 0.4826
Constant BB_Box5_Height 0.127
Constant BB_Box5_Width_Offset 2.8448
Constant BB_Box5_Length_Offset 2.2352

Volume BB_Box5
BB_Box5.Material PBT
BB_Box5.Visibility {ShowPayload}
BB_Box5.Shape BOX {.5*BB_Box5_Width} {.5*BB_Box5_Length} {.5*BB_Box5_Height}
BB_Box5.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - Bottom_Tall_Screw_Width_Offset - .5*Bottom_Screw_OD - .5*Bottom_Tall_Screw_Width_Spacing + .5*BB_Width - BB_Box5_Width_Offset - .5*BB_Box5_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + Bottom_Tall_Screw_Length_Offset + .5*Bottom_Screw_OD + .5*Bottom_Tall_Screw_Length_Spacing - .5*BB_Length + BB_Box5_Length_Offset + .5*BB_Box5_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Tall_Screw_Height + BB_Depth + .5*BB_Box5_Height}
BB_Box5.Mother World

Constant BB_Box6_Width 1.4986
Constant BB_Box6_Length 1.4986
Constant BB_Box6_Height 0.127
Constant BB_Box6_Width_Offset 2.159
Constant BB_Box6_Length_Offset 3.7846

Volume BB_Box6
BB_Box6.Material PBT
BB_Box6.Visibility {ShowPayload}
BB_Box6.Shape BOX {.5*BB_Box6_Width} {.5*BB_Box6_Length} {.5*BB_Box6_Height}
BB_Box6.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - Bottom_Tall_Screw_Width_Offset - .5*Bottom_Screw_OD - .5*Bottom_Tall_Screw_Width_Spacing + .5*BB_Width - BB_Box6_Width_Offset - .5*BB_Box6_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + Bottom_Tall_Screw_Length_Offset + .5*Bottom_Screw_OD + .5*Bottom_Tall_Screw_Length_Spacing - .5*BB_Length + BB_Box6_Length_Offset + .5*BB_Box6_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Tall_Screw_Height + BB_Depth + .5*BB_Box6_Height}
BB_Box6.Mother World

Constant BB_Box7_Width 0.7874
Constant BB_Box7_Length 0.3302
Constant BB_Box7_Height 0.2286
Constant BB_Box7_Width_Offset 0.9906
Constant BB_Box7_Length_Offset 4.9022

Volume BB_Box7
BB_Box7.Material PBT
BB_Box7.Visibility {ShowPayload}
BB_Box7.Shape BOX {.5*BB_Box7_Width} {.5*BB_Box7_Length} {.5*BB_Box7_Height}
BB_Box7.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - Bottom_Tall_Screw_Width_Offset - .5*Bottom_Screw_OD - .5*Bottom_Tall_Screw_Width_Spacing + .5*BB_Width - BB_Box7_Width_Offset - .5*BB_Box7_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + Bottom_Tall_Screw_Length_Offset + .5*Bottom_Screw_OD + .5*Bottom_Tall_Screw_Length_Spacing - .5*BB_Length + BB_Box7_Length_Offset + .5*BB_Box7_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Tall_Screw_Height + BB_Depth + .5*BB_Box7_Height}
BB_Box7.Mother World

Constant BB_Box8_Width 0.6096
Constant BB_Box8_Length 0.6096
Constant BB_Box8_Height 0.127
Constant BB_Box8_Width_Offset 0.8128
Constant BB_Box8_Length_Offset 6.1214
Constant BB_Box8_Cylinder_Height 0.3556

Volume BB_Box8
BB_Box8.Material PBT
BB_Box8.Visibility {ShowPayload}
BB_Box8.Shape BOX {.5*BB_Box8_Width} {.5*BB_Box8_Length} {.5*BB_Box8_Height}
BB_Box8.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - Bottom_Tall_Screw_Width_Offset - .5*Bottom_Screw_OD - .5*Bottom_Tall_Screw_Width_Spacing + .5*BB_Width - BB_Box8_Width_Offset - .5*BB_Box8_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + Bottom_Tall_Screw_Length_Offset + .5*Bottom_Screw_OD + .5*Bottom_Tall_Screw_Length_Spacing - .5*BB_Length + BB_Box8_Length_Offset + .5*BB_Box8_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Tall_Screw_Height + BB_Depth + .5*BB_Box8_Height}
BB_Box8.Mother World

Volume BB_Box8_Cylinder
BB_Box8_Cylinder.Material PBT
BB_Box8_Cylinder.Visibility {ShowPayload}
BB_Box8_Cylinder.Shape TUBE 0 {.5*BB_Box8_Width} {.5*BB_Box8_Cylinder_Height} 0 360
BB_Box8_Cylinder.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - Bottom_Tall_Screw_Width_Offset - .5*Bottom_Screw_OD - .5*Bottom_Tall_Screw_Width_Spacing + .5*BB_Width - BB_Box8_Width_Offset - .5*BB_Box8_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + Bottom_Tall_Screw_Length_Offset + .5*Bottom_Screw_OD + .5*Bottom_Tall_Screw_Length_Spacing - .5*BB_Length + BB_Box8_Length_Offset + .5*BB_Box8_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Tall_Screw_Height + BB_Depth + BB_Box8_Height + .5*BB_Box8_Cylinder_Height}
BB_Box8_Cylinder.Mother World

Constant BB_Box9_Width 1.397
Constant BB_Box9_Length 0.889
Constant BB_Box9_Height 0.127
Constant BB_Box9_Width_Offset 1.8288
Constant BB_Box9_Length_Offset 5.8674

Volume BB_Box9
BB_Box9.Material PBT
BB_Box9.Visibility {ShowPayload}
BB_Box9.Shape BOX {.5*BB_Box9_Width} {.5*BB_Box9_Length} {.5*BB_Box9_Height}
BB_Box9.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - Bottom_Tall_Screw_Width_Offset - .5*Bottom_Screw_OD - .5*Bottom_Tall_Screw_Width_Spacing + .5*BB_Width - BB_Box9_Width_Offset - .5*BB_Box9_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + Bottom_Tall_Screw_Length_Offset + .5*Bottom_Screw_OD + .5*Bottom_Tall_Screw_Length_Spacing - .5*BB_Length + BB_Box9_Length_Offset + .5*BB_Box9_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Tall_Screw_Height + BB_Depth + .5*BB_Box9_Height}
BB_Box9.Mother World

Constant BB_Box10_Width 0.889
Constant BB_Box10_Length 0.889
Constant BB_Box10_Height 0.127
Constant BB_Box10_Width_Offset 3.5814
Constant BB_Box10_Length_Offset 5.8674

Volume BB_Box10
BB_Box10.Material PBT
BB_Box10.Visibility {ShowPayload}
BB_Box10.Shape BOX {.5*BB_Box10_Width} {.5*BB_Box10_Length} {.5*BB_Box10_Height}
BB_Box10.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - Bottom_Tall_Screw_Width_Offset - .5*Bottom_Screw_OD - .5*Bottom_Tall_Screw_Width_Spacing + .5*BB_Width - BB_Box10_Width_Offset - .5*BB_Box10_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + Bottom_Tall_Screw_Length_Offset + .5*Bottom_Screw_OD + .5*Bottom_Tall_Screw_Length_Spacing - .5*BB_Length + BB_Box10_Length_Offset + .5*BB_Box10_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Tall_Screw_Height + BB_Depth + .5*BB_Box10_Height}
BB_Box10.Mother World

Constant BB_Box11_Width 0.3048
Constant BB_Box11_Length 0.4064
Constant BB_Box11_Height 0.127
Constant BB_Box11_Width_Offset 3.3782
Constant BB_Box11_Length_Offset 7.3152

Volume BB_Box11
BB_Box11.Material PBT
BB_Box11.Visibility {ShowPayload}
BB_Box11.Shape BOX {.5*BB_Box11_Width} {.5*BB_Box11_Length} {.5*BB_Box11_Height}
BB_Box11.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - Bottom_Tall_Screw_Width_Offset - .5*Bottom_Screw_OD - .5*Bottom_Tall_Screw_Width_Spacing + .5*BB_Width - BB_Box11_Width_Offset - .5*BB_Box11_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + Bottom_Tall_Screw_Length_Offset + .5*Bottom_Screw_OD + .5*Bottom_Tall_Screw_Length_Spacing - .5*BB_Length + BB_Box11_Length_Offset + .5*BB_Box11_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Tall_Screw_Height + BB_Depth + .5*BB_Box11_Height}
BB_Box11.Mother World

Constant BB_Box12_Width 0.3048
Constant BB_Box12_Length 0.4064
Constant BB_Box12_Height 0.127
Constant BB_Box12_Width_Offset 3.8354
Constant BB_Box12_Length_Offset 7.3152

Volume BB_Box12
BB_Box12.Material PBT
BB_Box12.Visibility {ShowPayload}
BB_Box12.Shape BOX {.5*BB_Box12_Width} {.5*BB_Box12_Length} {.5*BB_Box12_Height}
BB_Box12.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - Bottom_Tall_Screw_Width_Offset - .5*Bottom_Screw_OD - .5*Bottom_Tall_Screw_Width_Spacing + .5*BB_Width - BB_Box12_Width_Offset - .5*BB_Box12_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + Bottom_Tall_Screw_Length_Offset + .5*Bottom_Screw_OD + .5*Bottom_Tall_Screw_Length_Spacing - .5*BB_Length + BB_Box12_Length_Offset + .5*BB_Box12_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Tall_Screw_Height + BB_Depth + .5*BB_Box12_Height}
BB_Box12.Mother World

Constant BB_Box13_Width 0.2794
Constant BB_Box13_Length 0.4572
Constant BB_Box13_Height 0.1524
Constant BB_Box13_Width_Offset 4.1656
Constant BB_Box13_Length_Offset 7.3152

Volume BB_Box13
BB_Box13.Material PBT
BB_Box13.Visibility {ShowPayload}
BB_Box13.Shape BOX {.5*BB_Box13_Width} {.5*BB_Box13_Length} {.5*BB_Box13_Height}
BB_Box13.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - Bottom_Tall_Screw_Width_Offset - .5*Bottom_Screw_OD - .5*Bottom_Tall_Screw_Width_Spacing + .5*BB_Width - BB_Box13_Width_Offset - .5*BB_Box13_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + Bottom_Tall_Screw_Length_Offset + .5*Bottom_Screw_OD + .5*Bottom_Tall_Screw_Length_Spacing - .5*BB_Length + BB_Box13_Length_Offset + .5*BB_Box13_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Tall_Screw_Height + BB_Depth + .5*BB_Box13_Height}
BB_Box13.Mother World

Constant BB_Box14_Width 1.1938
Constant BB_Box14_Length 1.2954
Constant BB_Box14_Height 0.635
Constant BB_Box14_Width_Offset 0.9906
Constant BB_Box14_Length_Offset {BB_Length - BB_Box14_Length}

Volume BB_Box14
BB_Box14.Material PBT
BB_Box14.Visibility {ShowPayload}
BB_Box14.Shape BOX {.5*BB_Box14_Width} {.5*BB_Box14_Length} {.5*BB_Box14_Height}
BB_Box14.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - Bottom_Tall_Screw_Width_Offset - .5*Bottom_Screw_OD - .5*Bottom_Tall_Screw_Width_Spacing + .5*BB_Width - BB_Box14_Width_Offset - .5*BB_Box14_Width} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + Bottom_Tall_Screw_Length_Offset + .5*Bottom_Screw_OD + .5*Bottom_Tall_Screw_Length_Spacing - .5*BB_Length + BB_Box14_Length_Offset + .5*BB_Box14_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Tall_Screw_Height + BB_Depth + .5*BB_Box14_Height}
BB_Box14.Mother World


#######################################################################################


Constant FPGA_Box1_Width 0.25908
Constant FPGA_Box1_Length 2.23774
Constant FPGA_Box1_Height 0.4064
Constant FPGA_Box1_Width_Offset 5.77088
Constant FPGA_Box1_Length_Offset 0.2286
Constant FPGA_Box1_Length_Spacing 2.3368

Volume FPGA_Box1a
FPGA_Box1a.Material PBT
FPGA_Box1a.Visibility {ShowPayload}
FPGA_Box1a.Shape BOX {.5*FPGA_Box1_Width} {.5*FPGA_Box1_Length} {.5*FPGA_Box1_Height}
FPGA_Box1a.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Box1_Width_Offset - .5*FPGA_Box1_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Box1_Length_Offset + .5*FPGA_Box1_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + .5*FPGA_Box1_Height}
FPGA_Box1a.Mother World

Volume FPGA_Box1b
FPGA_Box1b.Material PBT
FPGA_Box1b.Visibility {ShowPayload}
FPGA_Box1b.Shape BOX {.5*FPGA_Box1_Width} {.5*FPGA_Box1_Length} {.5*FPGA_Box1_Height}
FPGA_Box1b.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Box1_Width_Offset - .5*FPGA_Box1_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Box1_Length_Offset + .5*FPGA_Box1_Length + FPGA_Box1_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + .5*FPGA_Box1_Height}
FPGA_Box1b.Mother World

Volume FPGA_Box1c
FPGA_Box1c.Material PBT
FPGA_Box1c.Visibility {ShowPayload}
FPGA_Box1c.Shape BOX {.5*FPGA_Box1_Width} {.5*FPGA_Box1_Length} {.5*FPGA_Box1_Height}
FPGA_Box1c.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Box1_Width_Offset - .5*FPGA_Box1_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Box1_Length_Offset + .5*FPGA_Box1_Length + 2*FPGA_Box1_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + .5*FPGA_Box1_Height}
FPGA_Box1c.Mother World

Constant FPGA_Box2_Width 0.4318
Constant FPGA_Box2_Length 0.4826
Constant FPGA_Box2_Height 0.127
Constant FPGA_Box2_Width_Offset 4.7244
Constant FPGA_Box2_Length_Offset 0.7366

Volume FPGA_Box2
FPGA_Box2.Material PBT
FPGA_Box2.Visibility {ShowPayload}
FPGA_Box2.Shape BOX {.5*FPGA_Box2_Width} {.5*FPGA_Box2_Length} {.5*FPGA_Box2_Height}
FPGA_Box2.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Box2_Width_Offset - .5*FPGA_Box2_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Box2_Length_Offset + .5*FPGA_Box2_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + .5*FPGA_Box2_Height}
FPGA_Box2.Mother World

Constant FPGA_Box3_Width 0.3556
Constant FPGA_Box3_Length 0.4318
Constant FPGA_Box3_Height 0.1778
Constant FPGA_Box3_Width_Offset 1.7272
Constant FPGA_Box3_Length_Offset 0.635
Constant FPGA_Box3_Length_Spacing 0.7112

Volume FPGA_Box3a
FPGA_Box3a.Material PBT
FPGA_Box3a.Visibility {ShowPayload}
FPGA_Box3a.Shape BOX {.5*FPGA_Box3_Width} {.5*FPGA_Box3_Length} {.5*FPGA_Box3_Height}
FPGA_Box3a.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Box3_Width_Offset - .5*FPGA_Box3_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Box3_Length_Offset + .5*FPGA_Box3_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + .5*FPGA_Box3_Height}
FPGA_Box3a.Mother World

Volume FPGA_Box3b
FPGA_Box3b.Material PBT
FPGA_Box3b.Visibility {ShowPayload}
FPGA_Box3b.Shape BOX {.5*FPGA_Box3_Width} {.5*FPGA_Box3_Length} {.5*FPGA_Box3_Height}
FPGA_Box3b.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Box3_Width_Offset - .5*FPGA_Box3_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Box3_Length_Offset + .5*FPGA_Box3_Length + FPGA_Box3_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + .5*FPGA_Box3_Height}
FPGA_Box3b.Mother World

Volume FPGA_Box3c
FPGA_Box3c.Material PBT
FPGA_Box3c.Visibility {ShowPayload}
FPGA_Box3c.Shape BOX {.5*FPGA_Box3_Width} {.5*FPGA_Box3_Length} {.5*FPGA_Box3_Height}
FPGA_Box3c.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Box3_Width_Offset - .5*FPGA_Box3_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Box3_Length_Offset + .5*FPGA_Box3_Length + 2*FPGA_Box3_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + .5*FPGA_Box3_Height}
FPGA_Box3c.Mother World

Constant FPGA_Box4_Width 0.1524
Constant FPGA_Box4_Length 0.2794
Constant FPGA_Box4_Height 0.1778
Constant FPGA_Box4_Width_Offset 0.8636
Constant FPGA_Box4_Length_Offset 1.016

Volume FPGA_Box4
FPGA_Box4.Material PBT
FPGA_Box4.Visibility {ShowPayload}
FPGA_Box4.Shape BOX {.5*FPGA_Box4_Width} {.5*FPGA_Box4_Length} {.5*FPGA_Box4_Height}
FPGA_Box4.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Box4_Width_Offset - .5*FPGA_Box4_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Box4_Length_Offset + .5*FPGA_Box4_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + .5*FPGA_Box4_Height}
FPGA_Box4.Mother World

Constant FPGA_Box5_Width 0.4064
Constant FPGA_Box5_Length 0.8382
Constant FPGA_Box5_Height 0.4572
Constant FPGA_Box5_Width_Offset 0.127
Constant FPGA_Box5_Length_Offset 2.0574

Volume FPGA_Box5
FPGA_Box5.Material PBT
FPGA_Box5.Visibility {ShowPayload}
FPGA_Box5.Shape BOX {.5*FPGA_Box5_Width} {.5*FPGA_Box5_Length} {.5*FPGA_Box5_Height}
FPGA_Box5.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Box5_Width_Offset - .5*FPGA_Box5_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Box5_Length_Offset + .5*FPGA_Box5_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + .5*FPGA_Box5_Height}
FPGA_Box5.Mother World

Constant FPGA_Box6_Width 0.4318
Constant FPGA_Box6_Length 0.4826
Constant FPGA_Box6_Height 0.127
Constant FPGA_Box6_Width_Offset 1.4986
Constant FPGA_Box6_Length_Offset 3.6068

Volume FPGA_Box6
FPGA_Box6.Material PBT
FPGA_Box6.Visibility {ShowPayload}
FPGA_Box6.Shape BOX {.5*FPGA_Box6_Width} {.5*FPGA_Box6_Length} {.5*FPGA_Box6_Height}
FPGA_Box6.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Box6_Width_Offset - .5*FPGA_Box6_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Box6_Length_Offset + .5*FPGA_Box6_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + .5*FPGA_Box6_Height}
FPGA_Box6.Mother World

Constant FPGA_Box7_Width 0.1524
Constant FPGA_Box7_Length 0.3048
Constant FPGA_Box7_Height 0.1778
Constant FPGA_Box7_Width_Offset 0.9398
Constant FPGA_Box7_Length_Offset 3.683

Volume FPGA_Box7
FPGA_Box7.Material PBT
FPGA_Box7.Visibility {ShowPayload}
FPGA_Box7.Shape BOX {.5*FPGA_Box7_Width} {.5*FPGA_Box7_Length} {.5*FPGA_Box7_Height}
FPGA_Box7.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Box7_Width_Offset - .5*FPGA_Box7_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Box7_Length_Offset + .5*FPGA_Box7_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + .5*FPGA_Box7_Height}
FPGA_Box7.Mother World

Constant FPGA_Box8_Width 0.254
Constant FPGA_Box8_Length 0.254
Constant FPGA_Box8_Height 0.1524
Constant FPGA_Box8_Width_Offset 1.143
Constant FPGA_Box8_Length_Offset 5.0292

Volume FPGA_Box8
FPGA_Box8.Material PBT
FPGA_Box8.Visibility {ShowPayload}
FPGA_Box8.Shape BOX {.5*FPGA_Box8_Width} {.5*FPGA_Box8_Length} {.5*FPGA_Box8_Height}
FPGA_Box8.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Box8_Width_Offset - .5*FPGA_Box8_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Box8_Length_Offset + .5*FPGA_Box8_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + .5*FPGA_Box8_Height}
FPGA_Box8.Mother World

Constant FPGA_Box9_Width 0.4064
Constant FPGA_Box9_Length 0.9398
Constant FPGA_Box9_Height 0.4572
Constant FPGA_Box9_Width_Offset 0.127
Constant FPGA_Box9_Length_Offset 5.6134

Volume FPGA_Box9
FPGA_Box9.Material PBT
FPGA_Box9.Visibility {ShowPayload}
FPGA_Box9.Shape BOX {.5*FPGA_Box9_Width} {.5*FPGA_Box9_Length} {.5*FPGA_Box9_Height}
FPGA_Box9.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Box9_Width_Offset - .5*FPGA_Box9_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Box9_Length_Offset + .5*FPGA_Box9_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + .5*FPGA_Box9_Height}
FPGA_Box9.Mother World

Constant FPGA_Box10_Width 0.4064
Constant FPGA_Box10_Length 0.5334
Constant FPGA_Box10_Height 0.4572
Constant FPGA_Box10_Width_Offset 0.127
Constant FPGA_Box10_Length_Offset 0.762

Volume FPGA_Box10
FPGA_Box10.Material PBT
FPGA_Box10.Visibility {ShowPayload}
FPGA_Box10.Shape BOX {.5*FPGA_Box10_Width} {.5*FPGA_Box10_Length} {.5*FPGA_Box10_Height}
FPGA_Box10.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Box10_Width_Offset - .5*FPGA_Box10_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Box10_Length_Offset + .5*FPGA_Box10_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + .5*FPGA_Box10_Height}
FPGA_Box10.Mother World

Constant FPGA_Pin_Width 0.0508
Constant FPGA_Pin_Length 0.0508
Constant FPGA_Pin_Top_Height 0.1524
Constant FPGA_Pin_Middle_Height 0.254
Constant FPGA_Pin_Bottom_Height 0.4064
Constant FPGA_Pin_Width_Offset 2.6924
Constant FPGA_Pin_Length_Offset 0.9652
Constant FPGA_Pin_Width_Spacing 1.524
Constant FPGA_Pin_Length_Spacing .254

Volume FPGA_Pin
FPGA_Pin.Material Copper
FPGA_Pin.Visibility {ShowPayload}
FPGA_Pin.Shape BOX {.5*FPGA_Pin_Width} {.5*FPGA_Pin_Length} {.5*PCBThickness}


For I 2 {.5*FPGA_Width - FPGA_Pin_Width_Offset - .5*FPGA_Pin_Width} {-FPGA_Pin_Width_Spacing}
	For J 24 {-.5*FPGA_Length + FPGA_Pin_Length_Offset + .5*FPGA_Pin_Length} {FPGA_Pin_Length_Spacing}
				
		FPGA_Pin.Copy FPGA_Pin_%I_%J
		FPGA_Pin_%I_%J.Position $I $J 0
		FPGA_Pin_%I_%J.Mother FPGA
		
	Done
Done

Volume FPGA_Pin_Bottom
FPGA_Pin_Bottom.Material Copper
FPGA_Pin_Bottom.Visibility {ShowPayload}
FPGA_Pin_Bottom.Shape BOX {.5*FPGA_Pin_Width} {.5*FPGA_Pin_Length} {.5*FPGA_Pin_Bottom_Height}

Volume FPGA_Pin_Middle
FPGA_Pin_Middle.Material Copper
FPGA_Pin_Middle.Visibility {ShowPayload}
FPGA_Pin_Middle.Shape BOX {.5*FPGA_Pin_Width} {.5*FPGA_Pin_Length} {.5*FPGA_Pin_Middle_Height}

Volume FPGA_Pin_Top
FPGA_Pin_Top.Material Copper
FPGA_Pin_Top.Visibility {ShowPayload}
FPGA_Pin_Top.Shape BOX {.5*FPGA_Pin_Width} {.5*FPGA_Pin_Length} {.5*FPGA_Pin_Top_Height}


For I 2 {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Pin_Width_Offset - .5*FPGA_Pin_Width} {-FPGA_Pin_Width_Spacing}
	For J 24 {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Pin_Length_Offset + .5*FPGA_Pin_Length} {FPGA_Pin_Length_Spacing}
				
		FPGA_Pin_Bottom.Copy FPGA_Pin_Bottom_%I_%J
		FPGA_Pin_Bottom_%I_%J.Position $I $J {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height - .5*FPGA_Pin_Bottom_Height}
		FPGA_Pin_Bottom_%I_%J.Mother World
		
		FPGA_Pin_Middle.Copy FPGA_Pin_Middle_%I_%J
		FPGA_Pin_Middle_%I_%J.Position $I $J {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + .5*FPGA_Pin_Middle_Height}
		FPGA_Pin_Middle_%I_%J.Mother World
		
		FPGA_Pin_Top.Copy FPGA_Pin_Top_%I_%J
		FPGA_Pin_Top_%I_%J.Position $I $J {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + FPGA_Pin_Middle_Height + .5*FPGA_Stage2_Height + .5*FPGA_Pin_Top_Height}
		FPGA_Pin_Top_%I_%J.Mother World
		
	Done
Done

Constant FPGA_Stage2_Width 1.778
Constant FPGA_Stage2_Length 6.985
Constant FPGA_Stage2_Height 0.1524
Constant FPGA_Stage2_Length_Offset 0.8636

Volume FPGA_Stage2
FPGA_Stage2.Material PayloadPCBMat
FPGA_Stage2.Visibility {ShowPayload}
FPGA_Stage2.Shape BOX {.5*FPGA_Stage2_Width} {.5*FPGA_Stage2_Length} {.5*FPGA_Stage2_Height}
FPGA_Stage2.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Pin_Width_Offset - .5*FPGA_Pin_Width - .5*FPGA_Pin_Width_Spacing} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Pin_Length_Offset - FPGA_Stage2_Length_Offset + .5*FPGA_Stage2_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + FPGA_Pin_Middle_Height + .5*FPGA_Stage2_Height}
FPGA_Stage2.Mother World

Volume FPGA_Stage2_Pin
FPGA_Stage2_Pin.Material Copper
FPGA_Stage2_Pin.Visibility {ShowPayload}
FPGA_Stage2_Pin.Shape BOX {.5*FPGA_Pin_Width} {.5*FPGA_Pin_Length} {.5*FPGA_Stage2_Height}

For I 2 {.5*FPGA_Pin_Width_Spacing} {-FPGA_Pin_Width_Spacing}
	For J 24 {-.5*FPGA_Stage2_Length + FPGA_Stage2_Length_Offset + .5*FPGA_Pin_Length} {FPGA_Pin_Length_Spacing}
				
		FPGA_Stage2_Pin.Copy FPGA_Stage2_Pin_%I_%J
		FPGA_Stage2_Pin_%I_%J.Position $I $J 0
		FPGA_Stage2_Pin_%I_%J.Mother FPGA_Stage2
		
	Done
Done

Constant FPGA_Stage2_Box1_Width 1.5748
Constant FPGA_Stage2_Box1_Length 0.508
Constant FPGA_Stage2_Box1_Height 0.8636
Constant FPGA_Stage2_Box1_Width_Offset 0.1016
Constant FPGA_Stage2_Box1_Length_Offset 0.127

Volume FPGA_Stage2_Box1
FPGA_Stage2_Box1.Material PBT
FPGA_Stage2_Box1.Visibility {ShowPayload}
FPGA_Stage2_Box1.Shape BOX {.5*FPGA_Stage2_Box1_Width} {.5*FPGA_Stage2_Box1_Length} {.5*FPGA_Stage2_Box1_Height}
FPGA_Stage2_Box1.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Pin_Width_Offset - .5*FPGA_Pin_Width - .5*FPGA_Pin_Width_Spacing + .5*FPGA_Stage2_Width - FPGA_Stage2_Box1_Width_Offset - .5*FPGA_Stage2_Box1_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Pin_Length_Offset - FPGA_Stage2_Length_Offset + FPGA_Stage2_Box1_Length_Offset + .5*FPGA_Stage2_Box1_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + FPGA_Pin_Middle_Height + FPGA_Stage2_Height + .5*FPGA_Stage2_Box1_Height}
FPGA_Stage2_Box1.Mother World

Constant FPGA_Stage2_Box2_Width 0.4318
Constant FPGA_Stage2_Box2_Length 0.4318
Constant FPGA_Stage2_Box2_Height 0.2794
Constant FPGA_Stage2_Box2_Width_Offset 0.6858
Constant FPGA_Stage2_Box2_Length_Offset 0.8128
Constant FPGA_Stage2_Box2_Length_Spacing 0.6604

Volume FPGA_Stage2_Box2a
FPGA_Stage2_Box2a.Material PBT
FPGA_Stage2_Box2a.Visibility {ShowPayload}
FPGA_Stage2_Box2a.Shape BOX {.5*FPGA_Stage2_Box2_Width} {.5*FPGA_Stage2_Box2_Length} {.5*FPGA_Stage2_Box2_Height}
FPGA_Stage2_Box2a.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Pin_Width_Offset - .5*FPGA_Pin_Width - .5*FPGA_Pin_Width_Spacing + .5*FPGA_Stage2_Width - FPGA_Stage2_Box2_Width_Offset - .5*FPGA_Stage2_Box2_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Pin_Length_Offset - FPGA_Stage2_Length_Offset + FPGA_Stage2_Box2_Length_Offset + .5*FPGA_Stage2_Box2_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + FPGA_Pin_Middle_Height + FPGA_Stage2_Height + .5*FPGA_Stage2_Box2_Height}
FPGA_Stage2_Box2a.Mother World

Volume FPGA_Stage2_Box2b
FPGA_Stage2_Box2b.Material PBT
FPGA_Stage2_Box2b.Visibility {ShowPayload}
FPGA_Stage2_Box2b.Shape BOX {.5*FPGA_Stage2_Box2_Width} {.5*FPGA_Stage2_Box2_Length} {.5*FPGA_Stage2_Box2_Height}
FPGA_Stage2_Box2b.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Pin_Width_Offset - .5*FPGA_Pin_Width - .5*FPGA_Pin_Width_Spacing + .5*FPGA_Stage2_Width - FPGA_Stage2_Box2_Width_Offset - .5*FPGA_Stage2_Box2_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Pin_Length_Offset - FPGA_Stage2_Length_Offset + FPGA_Stage2_Box2_Length_Offset + .5*FPGA_Stage2_Box2_Length + FPGA_Stage2_Box2_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + FPGA_Pin_Middle_Height + FPGA_Stage2_Height + .5*FPGA_Stage2_Box2_Height}
FPGA_Stage2_Box2b.Mother World

Constant FPGA_Stage2_Box3_Width 0.7874
Constant FPGA_Stage2_Box3_Length 0.6096
Constant FPGA_Stage2_Box3_Height 0.0762
Constant FPGA_Stage2_Box3_Width_Offset 0.6096
Constant FPGA_Stage2_Box3_Length_Offset 2.6416

Volume FPGA_Stage2_Box3
FPGA_Stage2_Box3.Material PBT
FPGA_Stage2_Box3.Visibility {ShowPayload}
FPGA_Stage2_Box3.Shape BOX {.5*FPGA_Stage2_Box3_Width} {.5*FPGA_Stage2_Box3_Length} {.5*FPGA_Stage2_Box3_Height}
FPGA_Stage2_Box3.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Pin_Width_Offset - .5*FPGA_Pin_Width - .5*FPGA_Pin_Width_Spacing + .5*FPGA_Stage2_Width - FPGA_Stage2_Box3_Width_Offset - .5*FPGA_Stage2_Box3_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Pin_Length_Offset - FPGA_Stage2_Length_Offset + FPGA_Stage2_Box3_Length_Offset + .5*FPGA_Stage2_Box3_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + FPGA_Pin_Middle_Height + FPGA_Stage2_Height + .5*FPGA_Stage2_Box3_Height}
FPGA_Stage2_Box3.Mother World

Constant FPGA_Stage2_Box4_Width 0.9906
Constant FPGA_Stage2_Box4_Length 0.9906
Constant FPGA_Stage2_Box4_Height 0.127
Constant FPGA_Stage2_Box4_Width_Offset 0.3556
Constant FPGA_Stage2_Box4_Length_Offset 3.4798

Volume FPGA_Stage2_Box4
FPGA_Stage2_Box4.Material PBT
FPGA_Stage2_Box4.Visibility {ShowPayload}
FPGA_Stage2_Box4.Shape BOX {.5*FPGA_Stage2_Box4_Width} {.5*FPGA_Stage2_Box4_Length} {.5*FPGA_Stage2_Box4_Height}
FPGA_Stage2_Box4.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Pin_Width_Offset - .5*FPGA_Pin_Width - .5*FPGA_Pin_Width_Spacing + .5*FPGA_Stage2_Width - FPGA_Stage2_Box4_Width_Offset - .5*FPGA_Stage2_Box4_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Pin_Length_Offset - FPGA_Stage2_Length_Offset + FPGA_Stage2_Box4_Length_Offset + .5*FPGA_Stage2_Box4_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + FPGA_Pin_Middle_Height + FPGA_Stage2_Height + .5*FPGA_Stage2_Box4_Height}
FPGA_Stage2_Box4.Mother World

Constant FPGA_Stage2_Box5_Width 0.889
Constant FPGA_Stage2_Box5_Length 0.889
Constant FPGA_Stage2_Box5_Height 0.1016
Constant FPGA_Stage2_Box5_Width_Offset 0.4572
Constant FPGA_Stage2_Box5_Length_Offset 5.3848

Volume FPGA_Stage2_Box5
FPGA_Stage2_Box5.Material PBT
FPGA_Stage2_Box5.Visibility {ShowPayload}
FPGA_Stage2_Box5.Shape BOX {.5*FPGA_Stage2_Box5_Width} {.5*FPGA_Stage2_Box5_Length} {.5*FPGA_Stage2_Box5_Height}
FPGA_Stage2_Box5.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Pin_Width_Offset - .5*FPGA_Pin_Width - .5*FPGA_Pin_Width_Spacing + .5*FPGA_Stage2_Width - FPGA_Stage2_Box5_Width_Offset - .5*FPGA_Stage2_Box5_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Pin_Length_Offset - FPGA_Stage2_Length_Offset + FPGA_Stage2_Box5_Length_Offset + .5*FPGA_Stage2_Box5_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + FPGA_Pin_Middle_Height + FPGA_Stage2_Height + .5*FPGA_Stage2_Box5_Height}
FPGA_Stage2_Box5.Mother World

Constant FPGA_Stage2_Box6_Width 0.762
Constant FPGA_Stage2_Box6_Length 0.4826
Constant FPGA_Stage2_Box6_Height 0.2286
Constant FPGA_Stage2_Box6_Width_Offset 0.508
Constant FPGA_Stage2_Box6_Length_Offset 6.5786

Volume FPGA_Stage2_Box6
FPGA_Stage2_Box6.Material PBT
FPGA_Stage2_Box6.Visibility {ShowPayload}
FPGA_Stage2_Box6.Shape BOX {.5*FPGA_Stage2_Box6_Width} {.5*FPGA_Stage2_Box6_Length} {.5*FPGA_Stage2_Box6_Height}
FPGA_Stage2_Box6.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_Pin_Width_Offset - .5*FPGA_Pin_Width - .5*FPGA_Pin_Width_Spacing + .5*FPGA_Stage2_Width - FPGA_Stage2_Box6_Width_Offset - .5*FPGA_Stage2_Box6_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_Pin_Length_Offset - FPGA_Stage2_Length_Offset + FPGA_Stage2_Box6_Length_Offset + .5*FPGA_Stage2_Box6_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_Depth + FPGA_Pin_Middle_Height + FPGA_Stage2_Height + .5*FPGA_Stage2_Box6_Height}
FPGA_Stage2_Box6.Mother World

Constant FPGA_UnderBox1_Width 0.3048
Constant FPGA_UnderBox1_Length 0.4318
Constant FPGA_UnderBox1_Height 0.4318
Constant FPGA_UnderBox1_Width_Offset 5.7404
Constant FPGA_UnderBox1_Length_Offset 0.508
Constant FPGA_UnderBox1_Length_Spacing 2.3368

Volume FPGA_UnderBox1a
FPGA_UnderBox1a.Material PBT
FPGA_UnderBox1a.Visibility {ShowPayload}
FPGA_UnderBox1a.Shape BOX {.5*FPGA_UnderBox1_Width} {.5*FPGA_UnderBox1_Length} {.5*FPGA_UnderBox1_Height}
FPGA_UnderBox1a.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_UnderBox1_Width_Offset - .5*FPGA_UnderBox1_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_UnderBox1_Length_Offset + .5*FPGA_UnderBox1_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height - .5*FPGA_UnderBox1_Height}
FPGA_UnderBox1a.Mother World

Volume FPGA_UnderBox1b
FPGA_UnderBox1b.Material PBT
FPGA_UnderBox1b.Visibility {ShowPayload}
FPGA_UnderBox1b.Shape BOX {.5*FPGA_UnderBox1_Width} {.5*FPGA_UnderBox1_Length} {.5*FPGA_UnderBox1_Height}
FPGA_UnderBox1b.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_UnderBox1_Width_Offset - .5*FPGA_UnderBox1_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_UnderBox1_Length_Offset + .5*FPGA_UnderBox1_Length + FPGA_UnderBox1_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height - .5*FPGA_UnderBox1_Height}
FPGA_UnderBox1b.Mother World

Volume FPGA_UnderBox1c
FPGA_UnderBox1c.Material PBT
FPGA_UnderBox1c.Visibility {ShowPayload}
FPGA_UnderBox1c.Shape BOX {.5*FPGA_UnderBox1_Width} {.5*FPGA_UnderBox1_Length} {.5*FPGA_UnderBox1_Height}
FPGA_UnderBox1c.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_UnderBox1_Width_Offset - .5*FPGA_UnderBox1_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_UnderBox1_Length_Offset + .5*FPGA_UnderBox1_Length + 2*FPGA_UnderBox1_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height - .5*FPGA_UnderBox1_Height}
FPGA_UnderBox1c.Mother World

Constant FPGA_UnderBox2_Width 0.889
Constant FPGA_UnderBox2_Length 0.8128
Constant FPGA_UnderBox2_Height 0.4572
Constant FPGA_UnderBox2_Width_Offset 0.9144
Constant FPGA_UnderBox2_Length_Offset 2.0574

Volume FPGA_UnderBox2
FPGA_UnderBox2.Material PBT
FPGA_UnderBox2.Visibility {ShowPayload}
FPGA_UnderBox2.Shape BOX {.5*FPGA_UnderBox2_Width} {.5*FPGA_UnderBox2_Length} {.5*FPGA_UnderBox2_Height}
FPGA_UnderBox2.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_UnderBox2_Width_Offset - .5*FPGA_UnderBox2_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_UnderBox2_Length_Offset + .5*FPGA_UnderBox2_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height - .5*FPGA_UnderBox2_Height}
FPGA_UnderBox2.Mother World

Constant FPGA_UnderBox3_Width 0.9652
Constant FPGA_UnderBox3_Length 0.3302
Constant FPGA_UnderBox3_Height 0.1778
Constant FPGA_UnderBox3_Width_Offset 3.048
Constant FPGA_UnderBox3_Length_Offset 4.1148

Volume FPGA_UnderBox3
FPGA_UnderBox3.Material PBT
FPGA_UnderBox3.Visibility {ShowPayload}
FPGA_UnderBox3.Shape BOX {.5*FPGA_UnderBox3_Width} {.5*FPGA_UnderBox3_Length} {.5*FPGA_UnderBox3_Height}
FPGA_UnderBox3.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_UnderBox3_Width_Offset - .5*FPGA_UnderBox3_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_UnderBox3_Length_Offset + .5*FPGA_UnderBox3_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height - .5*FPGA_UnderBox3_Height}
FPGA_UnderBox3.Mother World

Constant FPGA_UnderBox4_Width 0.5842
Constant FPGA_UnderBox4_Length 0.2794
Constant FPGA_UnderBox4_Height 0.1778
Constant FPGA_UnderBox4_Width_Offset 0.9144
Constant FPGA_UnderBox4_Length_Offset 4.8768
Constant FPGA_UnderBox4_Length_Spacing 1.4732

Volume FPGA_UnderBox4a
FPGA_UnderBox4a.Material PBT
FPGA_UnderBox4a.Visibility {ShowPayload}
FPGA_UnderBox4a.Shape BOX {.5*FPGA_UnderBox4_Width} {.5*FPGA_UnderBox4_Length} {.5*FPGA_UnderBox4_Height}
FPGA_UnderBox4a.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_UnderBox4_Width_Offset - .5*FPGA_UnderBox4_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_UnderBox4_Length_Offset + .5*FPGA_UnderBox4_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height - .5*FPGA_UnderBox4_Height}
FPGA_UnderBox4a.Mother World

Volume FPGA_UnderBox4b
FPGA_UnderBox4b.Material PBT
FPGA_UnderBox4b.Visibility {ShowPayload}
FPGA_UnderBox4b.Shape BOX {.5*FPGA_UnderBox4_Width} {.5*FPGA_UnderBox4_Length} {.5*FPGA_UnderBox4_Height}
FPGA_UnderBox4b.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + FPGA_Width - FPGA_UnderBox4_Width_Offset - .5*FPGA_UnderBox4_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing - .5*FPGA_Length + FPGA_UnderBox4_Length_Offset + .5*FPGA_UnderBox4_Length + FPGA_UnderBox4_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height - .5*FPGA_UnderBox4_Height}
FPGA_UnderBox4b.Mother World

######################################################################################

Constant HV_Box1_Width 0.3048
Constant HV_Box1_Length 0.4318
Constant HV_Box1_Height 0.4318
Constant HV_Box1_Width_Offset 5.7404
Constant HV_Box1_Length_Offset 0.508
Constant HV_Box1_Length_Spacing 1.4605

Volume HV_Box1a
HV_Box1a.Material PBT
HV_Box1a.Visibility {ShowPayload}
HV_Box1a.Shape BOX {.5*HV_Box1_Width} {.5*HV_Box1_Length} {.5*HV_Box1_Height}
HV_Box1a.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Box1_Width_Offset - .5*HV_Box1_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Box1_Length_Offset + .5*HV_Box1_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Box1_Height}
HV_Box1a.Mother World

Volume HV_Box1b
HV_Box1b.Material PBT
HV_Box1b.Visibility {ShowPayload}
HV_Box1b.Shape BOX {.5*HV_Box1_Width} {.5*HV_Box1_Length} {.5*HV_Box1_Height}
HV_Box1b.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Box1_Width_Offset - .5*HV_Box1_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Box1_Length_Offset + .5*HV_Box1_Length + HV_Box1_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Box1_Height}
HV_Box1b.Mother World

Volume HV_Box1c
HV_Box1c.Material PBT
HV_Box1c.Visibility {ShowPayload}
HV_Box1c.Shape BOX {.5*HV_Box1_Width} {.5*HV_Box1_Length} {.5*HV_Box1_Height}
HV_Box1c.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Box1_Width_Offset - .5*HV_Box1_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Box1_Length_Offset + .5*HV_Box1_Length + 2*HV_Box1_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Box1_Height}
HV_Box1c.Mother World

Constant HV_Box2_Width 0.3048
Constant HV_Box2_Length 0.54102
Constant HV_Box2_Height 0.4318
Constant HV_Box2_Width_Offset 5.7404
Constant HV_Box2_Length_Offset 1.22174
Constant HV_Box2_Length_Spacing 1.4605

Volume HV_Box2a
HV_Box2a.Material PBT
HV_Box2a.Visibility {ShowPayload}
HV_Box2a.Shape BOX {.5*HV_Box2_Width} {.5*HV_Box2_Length} {.5*HV_Box2_Height}
HV_Box2a.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Box2_Width_Offset - .5*HV_Box2_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Box2_Length_Offset + .5*HV_Box2_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Box2_Height}
HV_Box2a.Mother World

Volume HV_Box2b
HV_Box2b.Material PBT
HV_Box2b.Visibility {ShowPayload}
HV_Box2b.Shape BOX {.5*HV_Box2_Width} {.5*HV_Box2_Length} {.5*HV_Box2_Height}
HV_Box2b.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Box2_Width_Offset - .5*HV_Box2_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Box2_Length_Offset + .5*HV_Box2_Length + HV_Box2_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Box2_Height}
HV_Box2b.Mother World

Volume HV_Box2c
HV_Box2c.Material PBT
HV_Box2c.Visibility {ShowPayload}
HV_Box2c.Shape BOX {.5*HV_Box2_Width} {.5*HV_Box2_Length} {.5*HV_Box2_Height}
HV_Box2c.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Box2_Width_Offset - .5*HV_Box2_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Box2_Length_Offset + .5*HV_Box2_Length + 2*HV_Box2_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Box2_Height}
HV_Box2c.Mother World

Constant HV_Box3_Width 0.60706
Constant HV_Box3_Length 0.32004
Constant HV_Box3_Height 0.06604
Constant HV_Box3_Width_Offset 4.93014
Constant HV_Box3_Length_Offset 2.0066
Constant HV_Box3_Length_Spacing 0.59944

Volume HV_Box3a
HV_Box3a.Material PBT
HV_Box3a.Visibility {ShowPayload}
HV_Box3a.Shape BOX {.5*HV_Box3_Width} {.5*HV_Box3_Length} {.5*HV_Box3_Height}
HV_Box3a.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Box3_Width_Offset - .5*HV_Box3_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Box3_Length_Offset + .5*HV_Box3_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Box3_Height}
HV_Box3a.Mother World

Volume HV_Box3b
HV_Box3b.Material PBT
HV_Box3b.Visibility {ShowPayload}
HV_Box3b.Shape BOX {.5*HV_Box3_Width} {.5*HV_Box3_Length} {.5*HV_Box3_Height}
HV_Box3b.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Box3_Width_Offset - .5*HV_Box3_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Box3_Length_Offset + .5*HV_Box3_Length + HV_Box3_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Box3_Height}
HV_Box3b.Mother World

Volume HV_Box3c
HV_Box3c.Material PBT
HV_Box3c.Visibility {ShowPayload}
HV_Box3c.Shape BOX {.5*HV_Box3_Width} {.5*HV_Box3_Length} {.5*HV_Box3_Height}
HV_Box3c.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Box3_Width_Offset - .5*HV_Box3_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Box3_Length_Offset + .5*HV_Box3_Length + 2*HV_Box3_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Box3_Height}
HV_Box3c.Mother World

Constant HV_Box4_Width 2.54
Constant HV_Box4_Length 2.032
Constant HV_Box4_Height 1.1049
Constant HV_Box4_Width_Offset 2.19456
Constant HV_Box4_Length_Offset 1.23952

Volume HV_Box4
HV_Box4.Material PBT
HV_Box4.Visibility {ShowPayload}
HV_Box4.Shape BOX {.5*HV_Box4_Width} {.5*HV_Box4_Length} {.5*HV_Box4_Height}
HV_Box4.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Box4_Width_Offset - .5*HV_Box4_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Box4_Length_Offset + .5*HV_Box4_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Box4_Height}
HV_Box4.Mother World

Constant HV_Box5_Width 0.37084
Constant HV_Box5_Length 0.67056
Constant HV_Box5_Height 0.18542
Constant HV_Box5_Width_Offset 3.90652
Constant HV_Box5_Length_Offset 3.4544

Volume HV_Box5
HV_Box5.Material PBT
HV_Box5.Visibility {ShowPayload}
HV_Box5.Shape BOX {.5*HV_Box5_Width} {.5*HV_Box5_Length} {.5*HV_Box5_Height}
HV_Box5.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Box5_Width_Offset - .5*HV_Box5_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Box5_Length_Offset + .5*HV_Box5_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Box5_Height}
HV_Box5.Mother World

Constant HV_Box6_Width 0.84074
Constant HV_Box6_Length 0.42418
Constant HV_Box6_Height 0.47752
Constant HV_Box6_Width_Offset 2.23012
Constant HV_Box6_Length_Offset 4.34086

Volume HV_Box6
HV_Box6.Material PBT
HV_Box6.Visibility {ShowPayload}
HV_Box6.Shape BOX {.5*HV_Box6_Width} {.5*HV_Box6_Length} {.5*HV_Box6_Height}
HV_Box6.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Box6_Width_Offset - .5*HV_Box6_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Box6_Length_Offset + .5*HV_Box6_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Box6_Height}
HV_Box6.Mother World

Constant HV_Box7_Width 0.54102
Constant HV_Box7_Length 0.42418
Constant HV_Box7_Height 0.47244
Constant HV_Box7_Width_Offset 1.08204
Constant HV_Box7_Length_Offset 4.34086

Volume HV_Box7
HV_Box7.Material PBT
HV_Box7.Visibility {ShowPayload}
HV_Box7.Shape BOX {.5*HV_Box7_Width} {.5*HV_Box7_Length} {.5*HV_Box7_Height}
HV_Box7.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Box7_Width_Offset - .5*HV_Box7_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Box7_Length_Offset + .5*HV_Box7_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Box7_Height}
HV_Box7.Mother World

Constant HV_Box8_Width 0.50038
Constant HV_Box8_Length 0.39878
Constant HV_Box8_Height 0.1524
Constant HV_Box8_Width_Offset 1.38938
Constant HV_Box8_Length_Offset 3.13944

Volume HV_Box8
HV_Box8.Material PBT
HV_Box8.Visibility {ShowPayload}
HV_Box8.Shape BOX {.5*HV_Box8_Width} {.5*HV_Box8_Length} {.5*HV_Box8_Height}
HV_Box8.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Box8_Width_Offset - .5*HV_Box8_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Box8_Length_Offset + .5*HV_Box8_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Box8_Height}
HV_Box8.Mother World

Constant HV_Box9_Width 0.42418
Constant HV_Box9_Length 1.14046
Constant HV_Box9_Height 0.39624
Constant HV_Box9_Width_Offset 0.2921
Constant HV_Box9_Length_Offset 1.57988

Volume HV_Box9
HV_Box9.Material PBT
HV_Box9.Visibility {ShowPayload}
HV_Box9.Shape BOX {.5*HV_Box9_Width} {.5*HV_Box9_Length} {.5*HV_Box9_Height}
HV_Box9.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Box9_Width_Offset - .5*HV_Box9_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Box9_Length_Offset + .5*HV_Box9_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Box9_Height}
HV_Box9.Mother World

Constant HV_Tube1_Diameter 0.26924
Constant HV_Tube1_Width 0.5207
Constant HV_Tube1_Width_Offset 3.64744
Constant HV_Tube1_Length_Offset 0.35052
Constant HV_Tube1_Length_Offset2 0.75184

Volume HV_Tube1a
HV_Tube1a.Material PBT
HV_Tube1a.Visibility {ShowPayload}
HV_Tube1a.Shape TUBE 0 {.5*HV_Tube1_Diameter} {.5*HV_Tube1_Width} 0 360
HV_Tube1a.Rotation 0 90 0
HV_Tube1a.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Tube1_Width_Offset - .5*HV_Tube1_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Tube1_Length_Offset} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Tube1_Diameter}
HV_Tube1a.Mother World

Volume HV_Tube1b
HV_Tube1b.Material PBT
HV_Tube1b.Visibility {ShowPayload}
HV_Tube1b.Shape TUBE 0 {.5*HV_Tube1_Diameter} {.5*HV_Tube1_Width} 0 360
HV_Tube1b.Rotation 0 90 0
HV_Tube1b.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Tube1_Width_Offset - .5*HV_Tube1_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Tube1_Length_Offset2} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Tube1_Diameter}
HV_Tube1b.Mother World

Constant HV_Tube2_Diameter 0.254
Constant HV_Tube2_Height 0.30988
Constant HV_Tube2_Width_Offset 1.6891
Constant HV_Tube2_Width_Offset2 1.6891
Constant HV_Tube2_Width_Offset3 1.97612
Constant HV_Tube2_Length_Offset 1.94056
Constant HV_Tube2_Length_Offset2 2.4892
Constant HV_Tube2_Length_Offset3 3.94716

Volume HV_Tube2a
HV_Tube2a.Material PBT
HV_Tube2a.Visibility {ShowPayload}
HV_Tube2a.Shape TUBE 0 {.5*HV_Tube2_Diameter} {.5*HV_Tube2_Height} 0 360
HV_Tube2a.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Tube2_Width_Offset} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Tube2_Length_Offset} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Tube2_Height}
HV_Tube2a.Mother World

Volume HV_Tube2b
HV_Tube2b.Material PBT
HV_Tube2b.Visibility {ShowPayload}
HV_Tube2b.Shape TUBE 0 {.5*HV_Tube2_Diameter} {.5*HV_Tube2_Height} 0 360
HV_Tube2b.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Tube2_Width_Offset2} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Tube2_Length_Offset3} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Tube2_Height}
HV_Tube2b.Mother World

Volume HV_Tube2c
HV_Tube2c.Material PBT
HV_Tube2c.Visibility {ShowPayload}
HV_Tube2c.Shape TUBE 0 {.5*HV_Tube2_Diameter} {.5*HV_Tube2_Height} 0 360
HV_Tube2c.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_Tube2_Width_Offset2} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_Tube2_Length_Offset3} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + HV_Depth + .5*HV_Tube2_Height}
HV_Tube2c.Mother World

Constant HV_UnderBox1_Width 0.34544
Constant HV_UnderBox1_Length 0.65532
Constant HV_UnderBox1_Height 0.18542
Constant HV_UnderBox1_Width_Offset 1.22682
Constant HV_UnderBox1_Length_Offset 0.42164

Volume HV_UnderBox1
HV_UnderBox1.Material PBT
HV_UnderBox1.Visibility {ShowPayload}
HV_UnderBox1.Shape BOX {.5*HV_UnderBox1_Width} {.5*HV_UnderBox1_Length} {.5*HV_UnderBox1_Height}
HV_UnderBox1.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_UnderBox1_Width_Offset - .5*HV_UnderBox1_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_UnderBox1_Length_Offset + .5*HV_UnderBox1_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset - .5*HV_UnderBox1_Height}
HV_UnderBox1.Mother World

Constant HV_UnderBox2_Width 0.59182
Constant HV_UnderBox2_Length 0.33782
Constant HV_UnderBox2_Height 0.15494
Constant HV_UnderBox2_Width_Offset 2.19202
Constant HV_UnderBox2_Length_Offset 0.31242

Volume HV_UnderBox2
HV_UnderBox2.Material PBT
HV_UnderBox2.Visibility {ShowPayload}
HV_UnderBox2.Shape BOX {.5*HV_UnderBox2_Width} {.5*HV_UnderBox2_Length} {.5*HV_UnderBox2_Height}
HV_UnderBox2.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_UnderBox2_Width_Offset - .5*HV_UnderBox2_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_UnderBox2_Length_Offset + .5*HV_UnderBox2_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset - .5*HV_UnderBox2_Height}
HV_UnderBox2.Mother World

Constant HV_UnderBox3_Width 0.33528
Constant HV_UnderBox3_Length 0.36576
Constant HV_UnderBox3_Height 0.12446
Constant HV_UnderBox3_Width_Offset 2.19202
Constant HV_UnderBox3_Length_Offset 0.88392

Volume HV_UnderBox3
HV_UnderBox3.Material PBT
HV_UnderBox3.Visibility {ShowPayload}
HV_UnderBox3.Shape BOX {.5*HV_UnderBox3_Width} {.5*HV_UnderBox3_Length} {.5*HV_UnderBox3_Height}
HV_UnderBox3.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_UnderBox3_Width_Offset - .5*HV_UnderBox3_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_UnderBox3_Length_Offset + .5*HV_UnderBox3_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset - .5*HV_UnderBox3_Height}
HV_UnderBox3.Mother World

Constant HV_UnderBox4_Width 0.49022
Constant HV_UnderBox4_Length 0.5588
Constant HV_UnderBox4_Height 0.28956
Constant HV_UnderBox4_Width_Offset 3.24358
Constant HV_UnderBox4_Length_Offset 2.22758

Volume HV_UnderBox4
HV_UnderBox4.Material PBT
HV_UnderBox4.Visibility {ShowPayload}
HV_UnderBox4.Shape BOX {.5*HV_UnderBox4_Width} {.5*HV_UnderBox4_Length} {.5*HV_UnderBox4_Height}
HV_UnderBox4.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD - FPGA_Width_Offset + HV_Width - HV_UnderBox4_Width_Offset - .5*HV_UnderBox4_Width} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing - .5*HV_Length + HV_UnderBox4_Length_Offset + .5*HV_UnderBox4_Length} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset - .5*HV_UnderBox4_Height}
HV_UnderBox4.Mother World










































