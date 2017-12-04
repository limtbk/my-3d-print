xs = 25;
ys = 25;
zs = 7;
th = 0.9;

color("yellow")
for (xi = [0:7])
    for (yi = [0:3])
        if ((xi+yi)%2==1) {
            translate([(xi+0.5)*xs,(yi+0.5)*ys,0]) {
                difference() {
                    union() {
                        difference() {
                            cube([xs,ys,zs], center=true);
                            translate([0,0,th])
                                cube([xs-2*th,ys-2*th,zs], center=true);
                        }
                        translate([0,0,0])
                            cylinder(d=6.5, 7, $fn=16, center=true);
                    }
                    translate([0,0,-0.5])
                        sphere(d=5.5, $fn=16);
                    translate([0,0,1.75-0.6])
                        cylinder(d=5.5, 3, $fn=16, center=true);

                }
            }
        }
        
color("gray")
for (xi = [0:7])
    for (yi = [0:3])
        if ((xi+yi)%2==0) {
            translate([(xi+0.5)*xs,(yi+0.5)*ys,0]) {
                difference() {
                    union() {
                        difference() {
                            cube([xs,ys,zs], center=true);
                            translate([0,0,th])
                                cube([xs-2*th,ys-2*th,zs], center=true);
                        }
                        translate([0,0,0])
                            cylinder(d=6.5, 7, $fn=16, center=true);
                    }
                    translate([0,0,-0.5])
                        sphere(d=5.5, $fn=16);
                    translate([0,0,1.75-0.6])
                        cylinder(d=5.5, 3, $fn=16, center=true);

                }
            }
        }

translate([xs*8/2, ys*4/2, 10.5])
difference() {
    cube([xs*8,ys*4,15], center=true);
    cube([xs*8-2*th,ys*4-2*th,16], center=true);
}

translate([xs*8/2, ys*4/2, 10.5])
difference() {
    cube([xs*8-3*th,ys*4-3*th,15], center=true);
    cube([xs*8-5*th,ys*4-5*th,16], center=true);
}