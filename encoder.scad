difference() {
    union() {
        rotate([90,0,0])
            cylinder(d=7, h=6, center=true, $fn=32);
        translate([0,-2.5,0])
            rotate([90,0,0])
                cylinder(d=9, h=1, center=true, $fn=32);

    }
    hull() {
        translate([0,5,0])
            cylinder(d=5, h=2.5, center=true, $fn=32);
        translate([0,0,0])
            cylinder(d=5, h=2.5, center=true, $fn=32);
    }
}

translate([0,5,0]) {

    translate([0,3.5,0])
        rotate([90,0,0])
            cylinder(d=9, h=1, center=true, $fn=32);
    difference() {
    hull() {
        translate([0,3,0])
            cube([4.5,1,2], center=true);
//        translate([0,10,0])
//            cylinder(d=4.5, h=2, center=true, $fn=32);
        translate([0,0,0])
            cylinder(d=4.5, h=2, center=true, $fn=32);
    }
    translate([0,0,0])
        cylinder(d=5, h=2.5, center=true, $fn=32);
    
    }
}

difference() {
    translate([0,0.5,0])
        rotate([90,0,0])
            cylinder(d=12, h=4.5, center=true, $fn=32);
    translate([0,0.5,0])
        rotate([90,0,0])
            cylinder(d=7.5, h=4.6, center=true, $fn=32);
}

translate([0,-2.25,0])
    difference() {
        rotate([90,0,0])
            cylinder(d=12, h=1.5, center=true, $fn=32);
        rotate([90,0,0])
            cylinder(d=9.5, h=1.6, center=true, $fn=32);
}