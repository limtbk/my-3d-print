
difference() {
    translate([0,0,0])
        union() {
            translate([0,0,0])
                cylinder(d=22, h=72, $fn=64);

            intersection() {
            translate([0,0,0])
                difference() {
                    cylinder(d=23, h=72, $fn=64);
                    cylinder(d=22, h=72, $fn=64);
                }
            translate([-10.5,0,61])
                cube([4,7,7], center=true);
            }
            translate([0,0,-4])
                cylinder(d1=22, d2=22, h=4, $fn=64);

            translate([0,0,72])
                cylinder(d1=22, d2=22, h=5, $fn=64);
        }

    translate([0,0,1])
        union() {
            translate([0,0,0])
                cylinder(d=20, h=72, $fn=64);
            translate([0,0,-5])
                cylinder(d1=20, d2=20, h=5, $fn=64);

            translate([0,0,70])
                cylinder(d=7.5, h=14, $fn=64);

            translate([0,0,84.0])
                cylinder(d=4, h=5, $fn=64);

            translate([-9.6,0,60])
                cube([1.5,6,6], center=true);

            translate([-10.5,-4,63])
                cube([5,1,13], center=true);
            translate([-10.5,4,63])
                cube([5,1,13], center=true);
            translate([-10.5,0,56.0])
                cube([5,9,1], center=true);
                
            translate([0,0,-2.5])
                rotate([0,90,0])
                    cylinder(d=1.5, h=25, center=true, $fn=16);
            translate([0,0,-2.5])
                rotate([90,0,0])
                    cylinder(d=1.5, h=25, center=true, $fn=16);

            translate([0,0,72])
                cylinder(d1=20, d2=20, h=5, $fn=64);
                
            translate([0,0,72.5])
                rotate([0,90,0])
                    cylinder(d=1.5, h=25, center=true, $fn=16);
            translate([0,0,74])
                rotate([90,0,0])
                    cylinder(d=1.5, h=25, center=true, $fn=16);
        }
    }

translate([0,0,1])
    difference(){
        union() {
            translate([0,0,-5])
                cylinder(d1=19.5, d2=19.0, h=5, $fn=64);    
            translate([0,0,-6])
                cylinder(d1=22, d2=22, h=1, $fn=64);    
        }

        union() {
            translate([0,0,-2.5])
                rotate([0,90,0])
                    cylinder(d=1.5, h=25, center=true, $fn=16);
            translate([0,0,-2.5])
                rotate([90,0,0])
                    cylinder(d=1.5, h=25, center=true, $fn=16);
        }
    }


translate([0,0,0])
    difference() {
        union() {
            translate([0,0,77])
                cylinder(d1=19.5, d2=7, h=15, $fn=64);
            translate([0,0,72])
                cylinder(d1=19.0, d2=19.5, h=5, $fn=64);    
        }

    translate([0,0,0])
        union() {
            translate([0,0,72])
                cylinder(d=7.5, h=19, $fn=64);
            translate([0,0,90.0])
                cylinder(d=4, h=10, $fn=64);
            translate([0,0,73.5])
                rotate([0,90,0])
                    cylinder(d=1.5, h=25, center=true, $fn=16);
            translate([0,0,75])
                rotate([90,0,0])
                    cylinder(d=1.5, h=25, center=true, $fn=16);

        }
    }

