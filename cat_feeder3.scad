module tube() {
    rotate([0,270,0])
        translate([0,0,-(9+43)/2])
            difference() {
                union() {
                    cylinder(d=40,h=86,center=true);
                    translate([0,0,(86+9)/2])
                        cylinder(d1=40,d2=45,h=9,center=true);
                    translate([0,0,(86+43)/2+9])
                        cylinder(d=45,h=43,center=true);
                    translate([20/2,0,(86-40)/2])
                        rotate([0,90,0]) {
                            cylinder(d=40,h=18,center=true);
                            translate([0,0,(18+9)/2])
                                cylinder(d1=40,d2=45,h=9,center=true);
                            translate([0,0,(18+43)/2+9])
                                cylinder(d=45,h=43,center=true);
                        }
                }
                union() {
                    cylinder(d=35,h=86+0.01,center=true);
                    translate([0,0,(86+9)/2])
                        cylinder(d1=35,d2=40,h=9,center=true);
                    translate([0,0,(86+43)/2+9])
                        cylinder(d=40,h=43+0.01,center=true);
                    translate([20/2,0,(86-40)/2])
                        rotate([0,90,0]) {
                            cylinder(d=35,h=18+0.01,center=true);
                            translate([0,0,(18+9)/2])
                                cylinder(d1=35,d2=40,h=9,center=true);
                            translate([0,0,(18+43)/2+9])
                                cylinder(d=40,h=43+0.01,center=true);
                        }
                }
            }
}

module shaft() {
    difference() {
        cylinder(d=5,h=8,$fn=32,center=true);
        translate([2.5+1.5,0,1])
            cube([5,5,6+0.01],center=true);
        translate([-2.5-1.5,0,1])
            cube([5,5,6+0.01],center=true);
    }
}

module feedscrew() {
    difference() {
        rotate([0,270,0]) {
            translate([0,0,(86+9)/2-(9+43)/2])
                cylinder(d1=33,d2=38,h=9,center=true);
            translate([0,0,(86+10)/2+9-(9+43)/2])
                cylinder(d1=38,d2=38,h=10+0.01,center=true);
            
            translate([0,0,(86+42)/2+5])
                cylinder(d=20,h=10+0.01,center=true);

            cylinder(d=10,h=86+9+43,center=true);

            intersection() {
                translate([0,0,-(9+43)/2])
                    cylinder(d=30,h=90,center=true);
                translate([0,0,-(9+43)/2])
                    linear_extrude(height=86,center=true,convexity=10,twist=360*2.5)
                        translate([7,0,0])
                            scale([1,0.5,1])
                                circle(d=21);
            }
/*
            translate([0,0,-(9+43)/2])
            linear_extrude(height=86,center=true,convexity=10,twist=360*2)
                translate([-7,0,0])
                    scale([1,0.5,1])
                        circle(d=21);
*/                  
        }
        translate([-65.5-5,0,0]) {
            rotate([0,90,0])
                shaft();
            
            cylinder(d=3,h=20,$fn=16,center=true);
            
            translate([0,0,5]) {
                rotate([0,0,0])
                    cylinder(d=6,h=2,$fn=6,center=true);
                translate([-2,0,0])
                    cube([5,5.2,2],center=true);
            }
            translate([0,0,-5]) { 
                rotate([0,0,0])
                    cylinder(d=6,h=2,$fn=6,center=true);
                translate([-2,0,0])
                    cube([5,5.2,2],center=true);
            }
        }
    }
}

module motor() {
    cylinder(d=28, h=20, center=true, $fn=64);

    hull() {
        cube([3,15,20], center=true);
        translate([(28+3)/2,0,0])
            cube([3,15,20], center=true);
        }

    translate([0,0,(20-1)/2])
        difference() {
            hull() {
                cube([7,7,1], center=true);
                translate([0,(28+7)/2,0])
                    cylinder(d=7, h=1, center=true, $fn=16);
                translate([0,-(28+7)/2,0])
                    cylinder(d=7, h=1, center=true, $fn=16);
            }
            translate([0,(28+7)/2,0])
                cylinder(d=3, h=1.1, center=true, $fn=16);
            translate([0,-(28+7)/2,0])
                cylinder(d=3, h=1.1, center=true, $fn=16);

        }

    translate([-(28/2-6.2),0,(20+2)/2])
        cylinder(d=9.3, h=2, center=true, $fn=32);

    translate([-(28/2-6.2),0,(20+8)/2+2])
        cylinder(d=5, h=8, center=true, $fn=32);
}

module motor_mount() {
    translate([-69,0,0]) {
        difference() {
            union() {
                rotate([0,90,0]) {
                    difference() {
                        union() {
                            translate([0,0,10])
                                cylinder(d1=41, d2=38.5, h=35, center=true, $fn=128);
                            translate([0, 0, -(15-9)/2-1.5])
                                cylinder(d=45, h=9, center=true, $fn=128);
                            translate([7.8,0,-(15+1)/2-0.25+0.75])
                                cylinder(d=45, h=3, center=true, $fn=128);
                        }
                        translate([0,0,11])
                            cylinder(d=36, h=35, center=true);
                    }
                }
                translate([14,17.5,0])
                    rotate([90,0,0])
                        cylinder(d1=13, d2=7, h=2, center=true, $fn=16);
                translate([14,-17.5,0])
                    rotate([90,0,0])
                        cylinder(d1=7, d2=13, h=2, center=true, $fn=16);
            }
            translate([-25+7,0,-7.8])
                rotate([0,90,0])
                    motor();

            rotate([0,90,0]) {
                translate([7.8,(28+7)/2,-4.5])
                    cylinder(d=3, h=9.01, center=true, $fn=16);
                translate([7.8,-(28+7)/2,-4.5])
                    cylinder(d=3, h=9.01, center=true, $fn=16);

                translate([7.8,(28+7)/2,-1.5])
                    cylinder(d=6.3, h=9.01, center=true, $fn=6);
                translate([7.8,-(28+7)/2,-1.5])
                    cylinder(d=6.3, h=9.01, center=true, $fn=6);
            }
                translate([14,16.7,0])
                    rotate([90,0,0])
                        cylinder(d=6, h=3, center=true, $fn=6);
                translate([14,-16.7,0])
                    rotate([90,0,0])
                        cylinder(d=6, h=3, center=true, $fn=6);
            
            
            translate([-1.5,0,0])
                cylinder(d=7, h=48, center=true, $fn=16);
            
            translate([14,0,0])
                rotate([90,0,0])
                    cylinder(d=3, h=48, center=true, $fn=16);

        }
    }
}

module full_assembly() {
    feedscrew();

    color("yellow")
        motor_mount();

    translate([-69,0,0]) {
        translate([-25+7,0,-7.8])
            rotate([0,90,0])
                color("gray", alpha=1)
                    motor();
    }
    color("green", alpha=0.5)
        tube();
}

//$fn=128;
/*
rotate([270,0,0])
difference() {
    feedscrew();
    translate([0,25,0])
        cube([150,50,50],center=true);
}

rotate([90,0,0])
difference() {
    feedscrew();
    translate([0,-25,0])
        cube([150,50,50],center=true);
}
*/

rotate([0,-90,0])
    motor_mount();

//full_assembly();




