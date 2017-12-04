dd0=14;
dd1=16;
dd2=18;
dd3=20;
dd4=22;
delta=0.5;
lll=2;

module halfsphere(d) {
    difference() {
        sphere(d=d);
        translate([0,0,d/4])
            cube([d,d,d/2], center=true);
    }
}

module hsph(d0,d1,ll) {
    union() {
        difference() {
            translate([0,0,0])
                rotate([0,0,0])
                    halfsphere(d=d0, $fn=64);
            translate([0,0,0])
                cube([ll,d0,d0], center=true);
        }

        intersection() {
            difference() {
                translate([0,0,0])
                    rotate([0,0,0])
                        halfsphere(d=d1, $fn=64);
            }
            translate([0,0,0])
                cube([ll+0.01,d1,d1], center=true);
        }
    }
}

color("blue")
translate([0,0,10])
    difference() {
        rotate([0,0,90])
            hsph(dd0,dd1,lll);
        translate([0,0,0])
            cylinder(d=4, h=7, $fn=32, center=true);
    }
    
color("yellow")
translate([0,0,5])
    difference() {
        hsph(dd2,dd3,lll);
        translate([0,0,0.01])
            rotate([0,0,90])
                hsph(dd0+delta,dd1+delta,lll+delta);
    }

color("gray")
translate([0,0,0])
    difference() {
        union() {
            halfsphere(d=dd4, $fn=64);
            translate([0,0,-dd4/2])
                rotate([0,0,45])
                    cube([dd4/2,dd4/2,dd4/8], center=true);
        }
        translate([0,0,0.01])
            hsph(dd2+delta,dd3+delta,lll+delta);
    }
    
