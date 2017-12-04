module mount() {
    translate([0,0,8])
        cube([45,60,3], center=true);

    translate([-45/2-1.5,0,-0.5])
        cube([3,60,20], center=true);

    translate([-18,0,-9])
        cube([15,60,3], center=true);

    translate([45/2+4,0,-63-0.5])
        cube([3,60,140], center=true);

    difference() {
    translate([45/2+80/2,0,8])
        cube([80,60,3], center=true);

    translate([60,0,8])
        cylinder(d=7, h=10, center=true, $fn=16);
    }

    translate([38,0,-110])
        rotate([0,90,0])
            cylinder(d=30, h=20, center=true, $fn=16);
}

module right_printer_wall() {
    translate([0,0,0])
        cube([42.6,500,13], center=true);
    translate([21.3-2.5,0,-250])
        cube([5,500,500], center=true);
}

module fillament() {
translate([60,0,-100])
    rotate([0,90,0]) {
        difference() {
            cylinder(h=60, d=200, center=true, $fn=32);
            cylinder(h=60.1, d=56, center=true, $fn=32);
        }
    }
}

module frontcut() {
    intersection() {
        translate([0,-500,0])
            cube([1000,1000,1000], center=true);
        children();
    }
}

module backcut() {
    intersection() {
        translate([0,500,0])
            cube([1000,1000,1000], center=true);
        children();
    }
}

/*    
color("blue")
    translate([0,-110,0])
        fillament();

color("blue")
    translate([0,110,0])
        fillament();


color("gray")
    right_printer_wall();
*/

//translate([0,110,0])
//    mount();

//translate([0,-110,0])
//    mount();



//color("white", alpha=0.5)
//    cube([128,60,143], center=true)
/*
frontcut() {
    translate([-38.5,0,62])
        mount();
}
*/

backcut() {
    translate([-38.5,0,62])
        mount();
}

