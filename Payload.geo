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

Constant FPGA_Width 6.3246
Constant FPGA_Length 7.5184
Constant FPGA_Depth {PCBThickness}

Constant HV_Width 6.4
Constant HV_Length 4.9
Constant HV_Depth {PCBThickness}
Constant FPGA_HV_Offset 1.27

Constant Screw_Head_Diameter 0.436372
Constant Screw_Head_Height 0.27051
Constant Screw_Helix_Length 0.79375

// Aluminum box, 0.4 cm thick*/

// Wall1 is going to be the side with the detector mounted

Constant Wall1_x {-.5*QCLength + LayerLength - FEELength + .5*OverlapL - PCB_Screw_Offset_Length + Wall1_Offset_Length - .5*Wall1_Length}
Constant Wall1_y {3*LayerSpacing - .5*PCBThickness - .5*QCThickness + .5*Wall_Thickness}
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
FootA_Subset1_Ledge_Subtraction.Material Vacuum
FootA_Subset1_Ledge_Subtraction.Visibility {ShowPayload}
FootA_Subset1_Ledge_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Ledge_Diameter} {.5*Foot_Screw_Hole_Ledge_Depth} 0 180
FootA_Subset1_Ledge_Subtraction.Position 0 0 {.5*Foot_Height - .5*Foot_Screw_Hole_Ledge_Depth}
FootA_Subset1_Ledge_Subtraction.Mother FootA_Subset1

Volume FootA_Subset1_Hole_Subtraction
FootA_Subset1_Hole_Subtraction.Material Vacuum
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
FootA_Subset2_Ledge_Subtraction.Material Vacuum
FootA_Subset2_Ledge_Subtraction.Visibility {ShowPayload}
FootA_Subset2_Ledge_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Ledge_Diameter} {.5*Foot_Screw_Hole_Ledge_Depth} 180 360
FootA_Subset2_Ledge_Subtraction.Position {-.5*Foot_Outer_Radius} {.5*Foot_Outer_Radius} {.5*Foot_Height - .5*Foot_Screw_Hole_Ledge_Depth}
FootA_Subset2_Ledge_Subtraction.Mother FootA_Subset2

Volume FootA_Subset2_Hole_Subtraction
FootA_Subset2_Hole_Subtraction.Material Vacuum
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
FootB_Subset1_Ledge_Subtraction.Material Vacuum
FootB_Subset1_Ledge_Subtraction.Visibility {ShowPayload}
FootB_Subset1_Ledge_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Ledge_Diameter} {.5*Foot_Screw_Hole_Ledge_Depth} 0 180
FootB_Subset1_Ledge_Subtraction.Position 0 0 {.5*Foot_Height - .5*Foot_Screw_Hole_Ledge_Depth}
FootB_Subset1_Ledge_Subtraction.Mother FootB_Subset1

Volume FootB_Subset1_Hole_Subtraction
FootB_Subset1_Hole_Subtraction.Material Vacuum
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
FootB_Subset2_Ledge_Subtraction.Material Vacuum
FootB_Subset2_Ledge_Subtraction.Visibility {ShowPayload}
FootB_Subset2_Ledge_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Ledge_Diameter} {.5*Foot_Screw_Hole_Ledge_Depth} 180 360
FootB_Subset2_Ledge_Subtraction.Position {.5*Foot_Outer_Radius} {.5*Foot_Outer_Radius} {.5*Foot_Height - .5*Foot_Screw_Hole_Ledge_Depth}
FootB_Subset2_Ledge_Subtraction.Mother FootB_Subset2

Volume FootB_Subset2_Hole_Subtraction
FootB_Subset2_Hole_Subtraction.Material Vacuum
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
FootC_Subset1_Ledge_Subtraction.Material Vacuum
FootC_Subset1_Ledge_Subtraction.Visibility {ShowPayload}
FootC_Subset1_Ledge_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Ledge_Diameter} {.5*Foot_Screw_Hole_Ledge_Depth} 0 180
FootC_Subset1_Ledge_Subtraction.Position 0 0 {.5*Foot_Height - .5*Foot_Screw_Hole_Ledge_Depth}
FootC_Subset1_Ledge_Subtraction.Mother FootC_Subset1

Volume FootC_Subset1_Hole_Subtraction
FootC_Subset1_Hole_Subtraction.Material Vacuum
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
FootC_Subset2_Ledge_Subtraction.Material Vacuum
FootC_Subset2_Ledge_Subtraction.Visibility {ShowPayload}
FootC_Subset2_Ledge_Subtraction.Shape TUBE 0 {.5*Foot_Screw_Hole_Ledge_Diameter} {.5*Foot_Screw_Hole_Ledge_Depth} 180 360
FootC_Subset2_Ledge_Subtraction.Position 0 {.5*Foot_Outer_Radius} {.5*Foot_Height - .5*Foot_Screw_Hole_Ledge_Depth}
FootC_Subset2_Ledge_Subtraction.Mother FootC_Subset2

Volume FootC_Subset2_Hole_Subtraction
FootC_Subset2_Hole_Subtraction.Material Vacuum
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
Screw_in_Hole.Material Steel_18_8
Screw_in_Hole.Visibility {ShowPayload}
Screw_in_Hole.Shape TUBE 0 {.5*Bottom_Screw_ID} {.5*Screw_Helix_Length - .5*PCBThickness} 0 360

Volume Screw_Middle
Screw_Middle.Material Steel_18_8
Screw_Middle.Visibility {ShowPayload}
Screw_Middle.Shape TUBE 0 {.5*Screw_Head_Diameter} {.5*FPGA_HV_Offset - .5*PCBThickness} 0 360

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
	Done
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
	Done
Done

####################################################################################

Volume BeagleBone
BeagleBone.Visibility 1
BeagleBone.Material PCB
BeagleBone.Color 3
BeagleBone.Shape BOX {.5*BB_Width} {.5*BB_Length} {.5*BB_Depth}
BeagleBone.Position {Wall1_x + .5*Wall1_Length - Wall_Thickness - Bottom_Tall_Screw_Width_Offset - .5*Bottom_Screw_OD - .5*Bottom_Tall_Screw_Width_Spacing} {Wall1_y - Wall1_2_Offset + .5*Wall_Thickness + Bottom_Tall_Screw_Length_Offset + .5*Bottom_Screw_OD + .5*Bottom_Tall_Screw_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Tall_Screw_Height + .5*BB_Depth}
BeagleBone.Mother World

Volume FPGA
FPGA.Visibility 1
FPGA.Material PCB
FPGA.Color 3
FPGA.Shape BOX {.5*FPGA_Width} {.5*FPGA_Length} {.5*FPGA_Depth}
FPGA.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD + .5*Bottom_Short_Screw_Width_Spacing} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - Bottom_Short_Screw_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + .5*FPGA_Depth}
FPGA.Mother World

Volume HV
HV.Visibility 1
HV.Material PCB
HV.Color 3
HV.Shape BOX {.5*HV_Width} {.5*HV_Length} {.5*HV_Depth}
HV.Position {Wall1_x - .5*Wall1_Length + Wall_Thickness + Bottom_Short_Screw_Width_Offset + .5*Bottom_Screw_OD + .5*Bottom_Short_Screw_Width_Spacing} {Wall1_y - .5*Wall_Thickness - Bottom_Short_Screw_Length_Offset - .5*Bottom_Screw_OD - 1.5*Bottom_Short_Screw_Length_Spacing} {Wall1_z - .5*Wall1_Width + Wall_Thickness + Bottom_Short_Screw_Height + FPGA_HV_Offset + .5*HV_Depth}
HV.Mother World














