#Constant PayloadWallMat Vacuum
Constant PayloadWallMat Alu6061

Constant LayerSpacing 0.965

// AstroPix v3 chip (active silicon)
// Dimenstion: 1.75 cm x 1.75 cm x 0.007 cm (=Measured depletion thickness for V3, can be changed)
// Pixel size 0.05 cm x 0.05 cm x 0.007 cm
// 35 x 35 pixels

// Constant DepletionDepth {ChipThickness} // Assuming full depletion here
Constant DepletionDepth 0.007 // Assuming 70 micron depletion
Constant ActiveAreaWidth 1.75
Constant ActiveAreaLength 1.75

// Single layer
// Dimension: 5.4 cm x 7.399 cm x 0.237(=0.072+0.165) cm
//   QuadChip: 0.0725 cm +- 0.0015 thick
//   PCB: 0.165 cm thick
// Here I use Width for X and Length for Y
Constant PCBThickness 0.165
Constant ChipThickness 0.0725
Constant QCWidth 3.8090
Constant QCLength 3.9330
Constant Guardring 0.06
Constant DigitalPeriphery 0.1475
Constant QCPitchLength 0.018
Constant QCPitchWidth 0.069
Constant StructuralPitchW {QCPitchWidth+2*Guardring}
Constant StructuralPitchL {DigitalPeriphery+QCPitchLength+Guardring}

// Measured on carrier board v1.0.1
Constant LayerLength 7.4
Constant LayerWidth 5.4
Constant FEELength 2.75
Constant PCBLength 0.936
Constant PCBSideL {LayerLength - FEELength - PCBLength}
Constant PCBLeftW 0.88
Constant PCBRightW 0.907
Constant OverlapL {PCBLength+QCLength+FEELength-LayerLength}
Constant OverlapW {PCBLeftW+PCBRightW+QCWidth-LayerWidth}

// Bus bar
//  width and offset are from A-STEP
//  thickness estimated using the transmission of 31keV 133Ba line
//  transmission estimated at ~ 350 counts / ~ 520 counts = 67%
//  thickness should be revisited at some point
Constant BBThickness 0.0045
Constant BBWidth 1.2
Constant BBOffset 0.38
Constant QCThickness {ChipThickness+BBThickness}

// PCB Mounts
Constant PCB_Screw_Radius 0.127
Constant PCB_Screw_Offset_Length {0.1905 + PCB_Screw_Radius}
Constant PCB_Screw_Offset_Width {0.254 + PCB_Screw_Radius}


//////////////////////////////////////////////////////////////////

Volume SL
SL.Material Vacuum
SL.Color 2
SL.Visibility 0
SL.Shape BOX {.5*LayerLength} {.5*(PCBThickness+QCThickness)} {.5*LayerWidth}

Volume QuadChip
QuadChip.Material Vacuum
QuadChip.Visibility 0
QuadChip.Color 6
QuadChip.Shape BOX {.5*QCLength} {.5*QCThickness} {.5*QCWidth}
QuadChip.Position {.5*QCLength - .5*LayerLength+FEELength - .5*OverlapL} {.5*PCBThickness} {.5*QCWidth - .5*LayerWidth+PCBLeftW - .5*OverlapW}
QuadChip.Mother SL

Volume BusBar
BusBar.Material Copper
BusBar.Visibility 1
BusBar.Color 46
BusBar.Shape BOX {.5*BBWidth} {.5*BBThickness} {.5*QCWidth}
BusBar.Position {BBOffset+.5*BBWidth} {.5*ChipThickness} {0.}
BusBar.Mother QuadChip

// Passive silicon
Volume SiSubstrate
SiSubstrate.Material Silicon
SiSubstrate.Visibility 1
SiSubstrate.Color 4
SiSubstrate.Shape BOX {.5*QCLength} {.5*ChipThickness} {.5*QCWidth}
SiSubstrate.Position {0.} {-.5*BBThickness} {0.}
SiSubstrate.Mother QuadChip

// Active volume (just the pixel array) in passive silicon
Volume APS
APS.Material Silicon
APS.Visibility 1
APS.Color 7
APS.Shape BOX {.5*ActiveAreaLength} {.5*DepletionDepth} {.5*ActiveAreaWidth}

For I 2 {-.5*QCWidth+.5*ActiveAreaWidth+Guardring} {ActiveAreaWidth+StructuralPitchW}
	For J 2 {-.5*QCLength+.5*ActiveAreaLength+DigitalPeriphery} {ActiveAreaLength+StructuralPitchL}
		APS.Copy APS_%I_%J
    	APS_%I_%J.Position $J {.5*(ChipThickness-DepletionDepth)} $I
		APS_%I_%J.Mother SiSubstrate
	Done
Done

// PCB sits slightly -dy from quad chip

// +x PCB
Volume PCBoard1
PCBoard1.Material PCB
PCBoard1.Color 3
PCBoard1.Visibility {ShowPCB}
PCBoard1.Shape Box {.5*PCBLength} {.5*PCBThickness} {.5*LayerWidth}
PCBoard1.Position {.5*(LayerLength-PCBLength)} {-.5*QCThickness} 0.0
PCBoard1.Mother SL

Volume PCBoard1_Screw1
PCBoard1_Screw1.Material Steel_18_8
PCBoard1_Screw1.Color 1
PCBoard1_Screw1.Visibility {ShowPCB}
PCBoard1_Screw1.Shape Tube 0 PCB_Screw_Radius {.5*PCBThickness} 0 360 // This is in the z direction
PCBoard1_Screw1.Rotation 90 0 0
PCBoard1_Screw1.Position {.5*PCBLength - PCB_Screw_Offset_Length} 0  {.5*LayerWidth - PCB_Screw_Offset_Width}
PCBoard1_Screw1.Mother PCBoard1

Volume PCBoard1_Screw2
PCBoard1_Screw2.Material Steel_18_8
PCBoard1_Screw2.Color 1
PCBoard1_Screw2.Visibility {ShowPCB}
PCBoard1_Screw2.Shape Tube 0 PCB_Screw_Radius {.5*PCBThickness} 0 360 // This is in the z direction
PCBoard1_Screw2.Rotation 90 0 0
PCBoard1_Screw2.Position {.5*PCBLength - PCB_Screw_Offset_Length} 0  {-.5*LayerWidth + PCB_Screw_Offset_Width}
PCBoard1_Screw2.Mother PCBoard1

// -x PCB
Volume PCBoard2
PCBoard2.Material PCB
PCBoard2.Color 3
PCBoard2.Visibility {ShowPCB}
PCBoard2.Shape Box {.5*FEELength} {.5*PCBThickness} {.5*LayerWidth}
PCBoard2.Position {.5*(FEELength-LayerLength)} {-.5*QCThickness} 0.0
PCBoard2.Mother SL

Volume PCBoard2_Screw1
PCBoard2_Screw1.Material Steel_18_8
PCBoard2_Screw1.Color 1
PCBoard2_Screw1.Visibility {ShowPCB}
PCBoard2_Screw1.Shape Tube 0 PCB_Screw_Radius {.5*PCBThickness} 0 360 // This is in the z direction
PCBoard2_Screw1.Rotation 90 0 0
PCBoard2_Screw1.Position {-.5*FEELength + PCB_Screw_Offset_Length} 0 {.5*LayerWidth - PCB_Screw_Offset_Width}
PCBoard2_Screw1.Mother PCBoard2

Volume PCBoard2_Screw2
PCBoard2_Screw2.Material Steel_18_8
PCBoard2_Screw2.Color 1
PCBoard2_Screw2.Visibility {ShowPCB}
PCBoard2_Screw2.Shape Tube 0 PCB_Screw_Radius {.5*PCBThickness} 0 360 // This is in the z direction
PCBoard2_Screw2.Rotation 90 0 0
PCBoard2_Screw2.Position {-.5*FEELength + PCB_Screw_Offset_Length} 0  {-.5*LayerWidth + PCB_Screw_Offset_Width}
PCBoard2_Screw2.Mother PCBoard2

// -z PCB
Volume PCBoard3
PCBoard3.Material PCB
PCBoard3.Color 3
PCBoard3.Visibility {ShowPCB}
PCBoard3.Shape Box {.5*PCBSideL} {.5*PCBThickness} {.5*PCBRightW}
PCBoard3.Position { -.5*LayerLength+FEELength+.5*PCBSideL} {-.5*QCThickness} {-.5*(LayerWidth-PCBRightW)}
PCBoard3.Mother SL

// +z PCB
Volume PCBoard4
PCBoard4.Material PCB
PCBoard4.Color 3
PCBoard4.Visibility {ShowPCB}
PCBoard4.Shape Box {.5*PCBSideL} {.5*PCBThickness} {.5*PCBLeftW}
PCBoard4.Position { -.5*LayerLength+FEELength+.5*PCBSideL} {-.5*QCThickness} {.5*(LayerWidth-PCBLeftW)}
PCBoard4.Mother SL

// PCB Screws Between Layers
Volume PCB_Mount_Screw
PCB_Mount_Screw.Material Steel_18_8
PCB_Mount_Screw.Color 1
PCB_Mount_Screw.Visibility {ShowPCB}
PCB_Mount_Screw.Shape Tube 0 PCB_Screw_Radius {.5*LayerSpacing - .5*PCBThickness} 0 360 // This is in the z direction
PCB_Mount_Screw.Rotation 90 0 0

For I 3 {2*LayerSpacing} {-LayerSpacing}
    SL.Copy SL_%I
    SL_%I.Position {-.5*QCLength + .5*LayerLength - FEELength + .5*OverlapL} {$I - .5*PCBThickness} {-.5*QCWidth + .5*LayerWidth - PCBLeftW + .5*OverlapW}
    SL_%I.Mother World
    
    PCB_Mount_Screw.Copy PCB_Mount_Screw1_%I
    PCB_Mount_Screw1_%I.Position {-.5*QCLength + LayerLength - FEELength + .5*OverlapL - PCB_Screw_Offset_Length} {$I - .5*PCBThickness - .5*QCThickness + .5*LayerSpacing} {-.5*QCWidth + LayerWidth - PCBLeftW + .5*OverlapW - PCB_Screw_Offset_Width}
	PCB_Mount_Screw1_%I.Mother World
	
	PCB_Mount_Screw.Copy PCB_Mount_Screw2_%I
    PCB_Mount_Screw2_%I.Position {-.5*QCLength + LayerLength - FEELength + .5*OverlapL - PCB_Screw_Offset_Length} {$I - .5*PCBThickness - .5*QCThickness + .5*LayerSpacing} {-.5*QCWidth - PCBLeftW + .5*OverlapW + PCB_Screw_Offset_Width}
	PCB_Mount_Screw2_%I.Mother World
	
	PCB_Mount_Screw.Copy PCB_Mount_Screw3_%I
    PCB_Mount_Screw3_%I.Position {-.5*QCLength - FEELength + .5*OverlapL + PCB_Screw_Offset_Length} {$I - .5*PCBThickness - .5*QCThickness + .5*LayerSpacing} {-.5*QCWidth + LayerWidth - PCBLeftW + .5*OverlapW - PCB_Screw_Offset_Width}
	PCB_Mount_Screw3_%I.Mother World
	
	PCB_Mount_Screw.Copy PCB_Mount_Screw4_%I
    PCB_Mount_Screw4_%I.Position {-.5*QCLength - FEELength + .5*OverlapL + PCB_Screw_Offset_Length} {$I - .5*PCBThickness - .5*QCThickness + .5*LayerSpacing} {-.5*QCWidth - PCBLeftW + .5*OverlapW + PCB_Screw_Offset_Width}
	PCB_Mount_Screw4_%I.Mother World
Done