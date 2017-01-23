/// @file Optical flow opticFlowCamCaseV02
///
/// @brief Create a test casing for optic flow cemra module ADNS3080
///
///
/// Created 10 Jan 2017
/// Modified 23 Jan 2017 (V02)
/// -fixed thickness direction
/// -LED cavity at 30 deg
///
/// @author Mustafa Ghazi

caseHeight = 0.7845*25.4 + 20.0; // [mm]
caseWidth = 1.008*25.4; // [mm]
caseLength = 1.312*25.4; // [mm]
dT = 1.0; // [mm]
minDiaLED = 10.0; // [mm]
maxDiaLED = 10.8; //[mm]
heightLED = 13.65; // [mm]

difference() {

	difference () {

	// outer solid
		translate([ 0, 0, 0]) linear_extrude(height = caseHeight, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { polygon(points = [[-caseWidth/2.0-dT,-caseLength/2.0-dT],[-caseWidth/2.0-dT,caseLength/2.0+dT],[caseWidth/2.0+dT,caseLength/2.0+dT],[caseWidth/2.0+dT,-caseLength/2.0-dT]], paths = undef, convexity = 1);
		}

		// hollow out the outer solid
		union() {
			// inner
			translate([ 0, 0, 0]) linear_extrude(height = caseHeight, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { polygon(points = [[-caseWidth/2.0,-caseLength/2.0],[-caseWidth/2.0,caseLength/2.0],[caseWidth/2.0,caseLength/2.0],[caseWidth/2.0,-caseLength/2.0]], paths = undef, convexity = 1);
			}

			// remove width wall material for now
			translate([ 0, 0, 0]) linear_extrude(height = caseHeight*2/3, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { polygon(points = [[-55,-0.3*25.4],[-55,0.3*25.4],[55,0.3*25.4],[55,-0.3*25.4]], paths = undef, convexity = 1);
			}
			
			/*

			// remove length wall material for now
			translate([ 0, 0, 0]) linear_extrude(height = caseHeight*2/3, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { polygon(points = [[-0.25*25.4,-55],[-0.25*25.4,55],[0.25*25.4,55],[0.25*25.4,-55]], paths = undef, convexity = 1);
			}
			*/


		} // end union
		
	} // end difference
	
	// hollow out the 10mm LED cavity at 30 deg angle
	translate([0, 0.7*caseLength/2, 0.7*20]) {
		rotate([-30, 0,  0]) { 
			linear_extrude(height = heightLED*2, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { circle(d=minDiaLED,$fn=12); }
		}
	}


	
} // end union


