module velotube() {
    cylinder(d=36, h=100, $fn=36*4, center=true);
}

module diffcube() {
    translate([46.3,20,0])
        cube([40,40,40], center=true);
}

module sensorcase() {
    difference() {
        hull() {
            translate([40,0,0])
                cylinder(d=6, h=15, $fn=36, center=true);
            translate([26,0,0])
                cylinder(d=6, h=15, $fn=36, center=true);
        }
/*        
        translate([33,0,6])
            rotate([90,0,0])
                cylinder(d=3.5, h=20, $fn=36, center=true);

        translate([33,0,-6])
            rotate([90,0,0])
                cylinder(d=3.5, h=20, $fn=36, center=true);
  */      
        translate([38,0,0])
            cube([5,2,5], center=true);

        translate([33,0,0])
            cube([14,2,3], center=true);
        
        translate([27.5,0,0])
            cylinder(d=2, h=10.01, $fn=16);
    }
}

module sensormount() {
    difference() {
        union() {
            translate([9,0,0])
                cylinder(d=35, h=15, $fn=36*4, center=true);
            sensorcase();
        }
        velotube();
        cylinder(d=36, h=100, $fn=36, center=true);
        
        translate([3,0,0])    
            difference() {
                cylinder(d=44, h=5, $fn=36*4, center=true);
                cylinder(d=38, h=5.01, $fn=36*4, center=true);
            }
        //diffcube();
    }

}

module sensorhood() {
    intersection() {
        sensorcase();
        diffcube();
    }
}

//velotube();
//translate([0,0,20])
//    cube([100,40,40], center=true);

difference() {
    sensormount();
    translate([0,0,20])
        cube([100,40,40], center=true);
}

intersection() {
    sensormount();
    translate([0,0,20])
        cube([100,40,40], center=true);
}

//translate([0,10,0])
//    sensorhood();



