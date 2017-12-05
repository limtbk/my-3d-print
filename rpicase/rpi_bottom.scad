difference() {
    union() {
        rotate([90,0,0])
            import("/home/lim/3DPrint/rpicase/boite_raspberry.stl");
        translate([0,0,0.5])
            cube([55,80,1], center=true);
    }

    union() {
        translate([-24.5,19,0]) {
            cylinder(d=3.5, h=10, $fn=64);
            cylinder(d=6.0, h=2.0, $fn=6);
        }
        translate([24.5,19,0]) {
            cylinder(d=3.5, h=10, $fn=64);
            cylinder(d=6.0, h=2.0, $fn=6);
        }
        translate([-24.5,-39,0]) {
            cylinder(d=3.5, h=10, $fn=64);
            cylinder(d=6.0, h=2.0, $fn=6);
        }
        translate([24.5,-39,0]) {
            cylinder(d=3.5, h=10, $fn=64);
            cylinder(d=6.0, h=2.0, $fn=6);
        }
    }
 }