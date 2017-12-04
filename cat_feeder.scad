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
            
            translate([0,0,(86+42)/2])
                cylinder(d=20,h=10+0.01,center=true);

            cylinder(d=10,h=86+9+43,center=true);

            translate([0,0,-(9+43)/2])
            linear_extrude(height=86,center=true,convexity=10,twist=360*3)
                translate([7,0,0])
                    scale([1,0.5,1])
                        circle(d=21);
        }
        translate([-65.5,0,0]) {
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


//color("green", alpha=0.5)
//    tube();
feedscrew();
