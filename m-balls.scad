smooth = 180;

union() {

for (i = [-2:2]) {
    translate([20*i,0,0]) {
        union() {
            color("Blue", 0.5) {
                difference() {
                    sphere(d=10, $fn=smooth);
                    cylinder(2.5, d=10, center=true, $fn=smooth);
                }
            }
            color("ForestGreen") {
                cylinder(0.5, d=10, center=true, $fn=smooth);
            }
            color("Black") {
                rotate(a=[0,90,0]) {
                    cylinder(20, d=0.5, center=true, $fn=smooth/10);
                }
            }
            color("Red") {
                translate([0,-0.5,0]) {
                    rotate(a=[0,90,0]) {
                        cylinder(20, d=0.5, center=true, $fn=smooth/10);
                    }
                }
            }
            color("White") {
                translate([0,0.5,0]) {
                    rotate(a=[0,90,0]) {
                        cylinder(20, d=0.5, center=true, $fn=smooth/10);
                    }
                }
            }
            color("Black") {
                translate([0,0,0.4]) {
                    cube([3.9,5,1], center=true);
                }
                translate([0,0,-0.4]) {
                    cube([5.2,5.2,1], center=true);
                }
            }            
        }
    }
}

}
