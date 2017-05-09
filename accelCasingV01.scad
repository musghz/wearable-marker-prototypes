brdLengthIN = 0.6250; // in
brdWidthIN = 0.6085; // [in]
holeDiaIN = 0.12; // actual 0.13 [in]

holeSpacingIN = 0.3890; // in
wallThickness = 0.0394; // [in]

union() {
	translate([ 0, 0, 0]) linear_extrude(height = wallThickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { polygon(points = [[0,0],[brdWidthIN+0.05,0],[brdWidthIN+0.05,-(brdLengthIN+0.05)],[0,-(brdLengthIN+0.05)]], paths = undef, convexity = 1);
					}
	difference() {
		translate([ 0, 0, 0]) linear_extrude(height = 0.25, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { polygon(points = [[0-wallThickness,0+wallThickness],[brdWidthIN+0.05+wallThickness,0+wallThickness],[brdWidthIN+0.05+wallThickness,-(brdLengthIN+0.05+wallThickness)],[0-wallThickness,-(brdLengthIN+0.05+wallThickness)]], paths = undef, convexity = 1);
						}
						
		translate([ 0, 0, 0]) linear_extrude(height = 0.25, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { polygon(points = [[0,0],[brdWidthIN+0.05,0],[brdWidthIN+0.05,-(brdLengthIN+0.05)],[0,-(brdLengthIN+0.05)]], paths = undef, convexity = 1);
						}
	
		translate([ 0, 0, 0]) linear_extrude(height = 0.25, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) { polygon(points = [[-wallThickness,wallThickness],[0,wallThickness],[0,-(brdLengthIN+0.1)],[-wallThickness,-(brdLengthIN+0.1)]], paths = undef, convexity = 1);
						}
	}

}