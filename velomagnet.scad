/*
difference() {
    union() {
        cylinder(d=5+0.6+3, h=5+0.6+4, $fn=32, center=true);
        translate([0,0,-4+0.2])
        hull() {
            translate([-8,0,0])
                cylinder(d=5+0.6+3, h=2, $fn=32, center=true);
            translate([8,0,0])
                cylinder(d=5+0.6+3, h=2, $fn=32, center=true);
        }
    }
    translate([0,0,-1])
        cylinder(d=5+0.6, h=5+0.6+2+0.01, $fn=32, center=true);
    
    translate([-8,0,0])
        cylinder(d=3, h=10, $fn=32, center=true);
    translate([8,0,0])
        cylinder(d=3, h=10, $fn=32, center=true);
    
}
*/
translate([0,0,-1])
difference() {
    translate([0,0,-6+0.2])
        hull() {
            translate([-8,0,0])
                cylinder(d=5+0.6+3, h=3, $fn=32, center=true);
            translate([8,0,0])
                cylinder(d=5+0.6+3, h=3, $fn=32, center=true);
        }

    translate([-8,0,0])
        cylinder(d=3, h=20, $fn=32, center=true);
    translate([8,0,0])
        cylinder(d=3, h=20, $fn=32, center=true);

    translate([-8,0,-7])
        cylinder(d=5, h=2, $fn=6, center=true);
    translate([8,0,-7])
        cylinder(d=5, h=2, $fn=6, center=true);

}
