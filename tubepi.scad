diam=70;
thk=10;
wth=1.2;

presc=0.8;

module ring() {
rotate([90,0,0])
    difference() {
        cylinder(d=diam, h=thk, $fn=128, center=true);
        cylinder(d=diam-wth*2, h=thk+1, $fn=128, center=true);
    }
}



difference() {
    union() {
//        translate([0,0,0.5])
//            cube([57,86,1], center=true);
/*        
        translate([-24.5,19,0]) {
            cylinder(d=8.0, h=3.0, $fn=64);
        }
        translate([24.5,19,0]) {
            cylinder(d=8.0, h=3.0, $fn=64);
        }
        translate([-24.5,-39,0]) {
            cylinder(d=8.0, h=3.0, $fn=64);
        }
        translate([24.5,-39,0]) {
            cylinder(d=8.0, h=3.0, $fn=64);
        }
*/
        translate([0,19,0]) {
            translate([0,0,0.5])
                cube([diam-wth,10,1], center=true);
            ring();
        }
/*
        translate([0,-39,0]) {
            translate([0,0,0.5])
                cube([diam-wth,10,1], center=true);
            ring();
        }
*/
    }

    union() {
        translate([-24.5,19,0]) {
            cylinder(d=3.5, h=10, $fn=64);
//            cylinder(d=6.0, h=2.0, $fn=6);
        }
        translate([24.5,19,0]) {
            cylinder(d=3.5, h=10, $fn=64);
//            cylinder(d=6.0, h=2.0, $fn=6);
        }
        translate([-24.5,-39,0]) {
            cylinder(d=3.5, h=10, $fn=64);
//            cylinder(d=6.0, h=2.0, $fn=6);
        }
        translate([24.5,-39,0]) {
            cylinder(d=3.5, h=10, $fn=64);
//            cylinder(d=6.0, h=2.0, $fn=6);
        }
    }

}
