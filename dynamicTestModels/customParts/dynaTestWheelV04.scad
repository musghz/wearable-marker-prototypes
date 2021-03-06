/// @file dynaTestWheelV03
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
spokeWidth = 6+1; // [mm]
spokeHeight = (hollowOuterDia - shaftDDia)/2.0 + (innerDiskDia - hollowOuterDia)/2.0; // [mm]
numSpokes = 12; 

// remove extra material
desiredHubThickness = 6; // [mm]
cavityDia = innerDiskDia - 25.4/4.0; // [mm] 

// hub mount holes
hubHoleDia = 0.1440*25.4; // [mm]
hubHolePatternDia = 0.770*25.4; // [mm]

// wheel with reduced hub thickness to fit motor shaft length
difference() {

	// full thickness wheel, with spokes, too thick for motor shaft
	union() {

		difference() {
			union() {
				// solid center disk
				translate([0, 0, outerDiskThickness]) {
					rotate([0, 0,  0]) { 
						linear_extrude(height = innerDiskThickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { circle(d=innerDiskDia,$fn=largeFN); }
					}
				}
				
				// solid outer disks
				translate([0, 0, innerDiskThickness + outerDiskThickness]) {
					rotate([0, 0,  0]) { 
						linear_extrude(height = outerDiskThickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { circle(d=outerDiskDia,$fn=largeFN); }
					}
				}
				
				translate([0, 0, 0]) {
					rotate([0, 0, 0]) { 
						linear_extrude(height = outerDiskThickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { circle(d=outerDiskDia,$fn=largeFN); }
					}
				}
			}


			// D-shaped hole
			difference() {
				// shaft hole
				translate([0, 0, 0]) {
					rotate([0, 0,  0]) { 
						linear_extrude(height = innerDiskThickness + 2*outerDiskThickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { circle(d=shaftDDia,$fn=36); }
					}
				}
				/*
				translate([ -shaftDDia/2.0, shaftDHeight-shaftDDia/2.0, 0]) { 
					linear_extrude(height = innerDiskThickness + 2*outerDiskThickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { polygon(points = [[0,0],[shaftDDia,0],[shaftDDia,shaftDDia],[0,shaftDDia]], paths = undef, convexity = 1); }
				}
				*/
				

			}
			
			// hollow out disk material
			difference() {
				translate([0, 0, 0]) {
					rotate([0, 0,  0]) { 
						linear_extrude(height = innerDiskThickness + 2*outerDiskThickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { circle(d=hollowOuterDia,$fn=largeFN); }
					}
				}
				
				translate([0, 0, 0]) {
					rotate([0, 0,  0]) { 
						linear_extrude(height = innerDiskThickness + 2*outerDiskThickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { circle(d=hollowInnerDia,$fn=largeFN); }
					}
				}

			}

		}

		for(count = [1:1:numSpokes]) {
			rotate([0, 0,  count*360/numSpokes]) {
				translate([ -spokeWidth/2, shaftDDia/2.0, 0]) { 
					linear_extrude(height = innerDiskThickness + 2*outerDiskThickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { polygon(points = [[0,0],[spokeWidth,0],[spokeWidth,spokeHeight],[0,spokeHeight]], paths = undef, convexity = 1); }
				}
			}
		}

	}

	// remove some material to fit hub on 12 mm length shaft
	translate([0, 0, desiredHubThickness]) {
		rotate([0, 0,  0]) { 
			linear_extrude(height = innerDiskThickness + 2*outerDiskThickness - desiredHubThickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { circle(d=cavityDia,$fn=largeFN); }
		}
	}
	
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


