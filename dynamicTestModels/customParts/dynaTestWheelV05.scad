/// @file dynaTestWheelV05
///
/// @brief Wheel/pulley for dynamic testing setup
///
/// Designed to fit this motor on Servo City:
/// 612 RPM HD Premium Planetary Gear Motor w/Encoder
/// https://www.servocity.com/612-rpm-hd-premium-planetary-gear-motor-w-encoder
///
/// Effective dia is 160 mm. Shaft dia 6 mm and shaft D is 5.5 mm high.
///
/// Created 30 Jun 2017
/// Modified 03 Jul 2017 (V02)
/// -reduce material (to 6mm)
/// Modified 03 Jul 2017 (V03)
/// -0.770 hub mount holes
/// Modified 06 Jul 2017 (V04)
/// -larger mount/shaft holes
/// Modified 24 Jul 2017 (V05)
/// -simplified to dual marker mount
///
/// @author Mustafa Ghazi

// wheel disk
innerDiskDia = 160; // [mm]
innerDiskThickness = 10.75; // [mm]
outerDiskDia = innerDiskDia + 4; // [mm]
outerDiskThickness = 1.5; // [mm]
shaftDDia = 6+1; // [mm]
shaftDHeight = 5.5; // [mm] 
largeFN = 90;

// hollow out and spokes
hollowInnerDia = shaftDDia + 25.4; // [mm]
hollowOuterDia = innerDiskDia - 25.4/2.0; // [mm]
spokeWidth = 3/8*25.4; // [mm]
spokeHeight = innerDiskDia/2.0; // [mm]
numSpokes = 12; 

// remove extra material
desiredHubThickness = 6; // [mm]
cavityDia = innerDiskDia - 25.4/4.0; // [mm] 

// hub mount holes
hubHoleDia = 0.1440*25.4; // [mm]
hubHolePatternDia = 0.770*25.4; // [mm]

// marker mounts
// volume of both mounts should be the same for balance
markerLenB = 53.33; // [mm]
mountThicknessB = 1.5; // [mm]
markerLenA = 26.67; // [mm]
mountThicknessA = markerLenB*markerLenB*mountThicknessB/markerLenA/markerLenA; // [mm]


// hub, arm and marker mounts with mounting holes
difference() {

	// hub, arm, and marker mounts (without holes)
	union() {

		//  0 deg arm
		rotate([0, 0, 0]) {
			translate([ -spokeWidth/2, 0, 0]) { 
				linear_extrude(height = desiredHubThickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { polygon(points = [[0,0],[spokeWidth,0],[spokeWidth,spokeHeight],[0,spokeHeight]], paths = undef, convexity = 1); }
			}
		}
		
		//  180 deg arm
		rotate([0, 0, 180]) {
			translate([ -spokeWidth/2, 0, 0]) { 
				linear_extrude(height = desiredHubThickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { polygon(points = [[0,0],[spokeWidth,0],[spokeWidth,spokeHeight],[0,spokeHeight]], paths = undef, convexity = 1); }
			}
		}
		
		// hub
		translate([0, 0, 0]) {
			rotate([0, 0,  0]) { 
				linear_extrude(height = desiredHubThickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { circle(d=hollowInnerDia,$fn=36); }
			}
		}
		
		// marker at 0 deg
		rotate([0, 0, 0]) {
			translate([ -markerLenA/2, spokeHeight-markerLenA/2, 0]) { 
				linear_extrude(height = mountThicknessA, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { polygon(points = [[0,0],[markerLenA,0],[markerLenA,markerLenA],[0,markerLenA]], paths = undef, convexity = 1); }
			}
		}
		
		// marker at 180 deg
		rotate([0, 0, 180]) {
			translate([ -markerLenB/2, spokeHeight-markerLenB/2, 0]) { 
				linear_extrude(height = mountThicknessB, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { polygon(points = [[0,0],[markerLenB,0],[markerLenB,markerLenB],[0,markerLenB]], paths = undef, convexity = 1); }
			}
		}

	}
	
	// shaft hole
	translate([0, 0, 0]) {
		rotate([0, 0,  0]) { 
			linear_extrude(height = desiredHubThickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { circle(d=shaftDDia,$fn=36); }
		}
	}

	// 4 X hub mount holes
	translate([0, hubHolePatternDia/2.0, 0]) {
		rotate([0, 0,  0]) { 
			linear_extrude(height = innerDiskThickness + 2*outerDiskThickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { circle(d=hubHoleDia,$fn=largeFN); }
		}
	}
	
	translate([0, -hubHolePatternDia/2.0, 0]) {
		rotate([0, 0,  0]) { 
			linear_extrude(height = innerDiskThickness + 2*outerDiskThickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { circle(d=hubHoleDia,$fn=largeFN); }
		}
	}
	
	translate([hubHolePatternDia/2.0, 0, 0]) {
		rotate([0, 0,  0]) { 
			linear_extrude(height = innerDiskThickness + 2*outerDiskThickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { circle(d=hubHoleDia,$fn=largeFN); }
		}
	}
	
	translate([-hubHolePatternDia/2.0, 0, 0]) {
		rotate([0, 0,  0]) { 
			linear_extrude(height = innerDiskThickness + 2*outerDiskThickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { circle(d=hubHoleDia,$fn=largeFN); }
		}
	}
	

}


