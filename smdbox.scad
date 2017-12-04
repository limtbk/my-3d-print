difference() {
    translate([0,0,0])
        cylinder(d=25, h=20, $fn=6);
    translate([0,0,1])
        cylinder(d=25-1, h=20-1, $fn=6);
}

translate([0,0,25]) {
    difference() {
    union() {
        translate([0,0,0])
            cylinder(d1=25-1.4, d2=25, h=2, $fn=6);
        translate([0,0,-2])
            cylinder(d=25-1.4, h=2, $fn=6);
    }
    translate([0,0,-2])
        cylinder(d=25-2.4, h=3, $fn=6);
    }
}
