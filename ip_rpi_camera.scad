use <//home/lim/3DPrint/RPiCam.scad>
use <//home/lim/3DPrint/Raspberry-Pi-OpenSCAD-Model-master/rpi.scad>

module old_pi() {
//    color("gray")
//        import("//home/lim/3DPrint/Raspberry-Pi-OpenSCAD-Model-master/rpi.stl");
    rpi();
}

module new_pi() {
    translate([0,-2.5,-2])
        import("//home/lim/3DPrint/raspberry-scad-master/raspberry_pi_Bplus.STL");
}

module rpi_cam() {
    translate([-12.5,0,-14.5])
        rotate([90,0,0])
            cam_full();
}

diam=70;
thk=15;
wth=1.2;

presc=0.8;

cwid=25;
chgh=24;
cthk=1.5;
cbth=3;
presc=0.8;

lwdt=5;

module cameramount() {
    rotate([90,0,0])
        translate([0,0,(cbth)/2])
            difference() {
                translate([0,-cthk/2,(cthk+presc+cbth)/2]) 
                    cube([cwid+presc*2+2*wth,chgh+wth,cthk+presc+2*wth+cbth], center=true);
                translate([0,0,cthk*3/2+cthk]) {
                    translate([0,0,(cbth-cthk-presc)/2])
                        cube([cwid+presc*2,chgh,cthk+presc], center=true);
                    cube([cwid-wth*2,chgh,cthk+presc+wth+cbth], center=true);
                }
            }
}

module ring() {
rotate([90,0,0])
    difference() {
        cylinder(d=diam, h=thk, $fn=128, center=true);
        cylinder(d=diam-wth*2, h=thk+1, $fn=128, center=true);
    }
}

module tube() {
    tubelength=200;
    translate([0,-tubelength/2+36,0])
    color("blue", alpha=0.3)
        rotate([90,0,0])
            cylinder(d=diam, h=4, $fn=128, center=true);

    translate([0,-40,0])
    color("grey", alpha=0.4)
    difference() {
        rotate([90,0,0])
            difference() {
                cylinder(d=diam+5, h=tubelength, $fn=128, center=true);
                cylinder(d=diam, h=tubelength+10, $fn=128, center=true);
            }

        translate([0,-tubelength/2-31,-38])
            rotate([45,0,0])
                cube([150,150,150], center=true);
    }
}

module cam_ring() {
    translate([0,-43,0]) {
        ring();
        translate([0,(wth-thk)/2,0]) {
            translate([0,0,-3.3])
                cube([29,wth,25], center=true);
            translate([0,0,0])
                cube([diam-2*wth,wth,10], center=true);
            translate([0,thk/4-0.5,-0.5])
                cube([diam-2*wth,thk/2,wth], center=true);
            difference() {
                translate([24.5,10.5,-2.5])
                    cube([5,20,5], center=true);
                translate([24.5,18.4,0])
                    rotate([0,0,0])
                        cylinder(d=3, h=15, $fn=32, center=true);
            }
            difference() {
                translate([-24.5,10.5,-2.5])
                    cube([5,20,5], center=true);
                translate([-24.5,18.4,0])
                    rotate([0,0,0])
                        cylinder(d=3, h=15, $fn=32, center=true);
            }
        }
    }
}

module rpi_ring() {
    translate([0,36,0]) {
        ring();
        translate([0,(thk-wth)/2,0]) {
//            translate([0,0,-3.3])
//                cube([29,wth,25], center=true);
            translate([0,0,-5.5])
                cube([diam-2*wth,wth,7], center=true);
            translate([0,-thk/4-0.5,-4.4])
                cube([diam-2*wth,thk/2,wth], center=true);
            difference() {
                translate([24.5,-9.4,-2.5])
                    cube([5,20,5], center=true);
                union() {
                    translate([24.5,-16.4,0])
                        rotate([0,0,0])
                            cylinder(d=3, h=15, $fn=32, center=true);
                    translate([24.5,-5,-2])
                        hull() {
                            translate([0,0,0])
                                cube([6,11,0.01], center=true);
                            translate([0,0,2])
                                cube([6,16,0.01], center=true);
                        }
                }
            }
            difference() {
                translate([-24.5,-9.4,-2.5])
                    cube([5,20,5], center=true);
                union() {
                    translate([-24.5,-16.4,0])
                        rotate([0,0,0])
                            cylinder(d=3, h=15, $fn=32, center=true);
                    translate([-24.5,-5,-2])
                        hull() {
                            translate([0,0,0])
                                cube([6,11,0.01], center=true);
                            translate([0,0,2])
                                cube([6,16,0.01], center=true);
                        }
                }
            }
            

        }
    }
}
/*
translate([28,-35,0])
    rotate([0,0,90])
        new_pi();

translate([0,-55,0])
    rpi_cam();
translate([0,-50,-2.5])
    cameramount();
cam_ring();
*/
rpi_ring();
//tube();

