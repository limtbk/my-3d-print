d18650 = 18.5;
h18650 = 65.15;
dbolt = 6;
dboltthrad = 3;
delta = 0.6;
th = 1;
n = 4;


//cylinder(d=d18650, h=h18650, center=true, $fn=32);

/*
    translate([0,0,0.5*(h18650+2*delta-0.5*(h18650+2*th+2*delta))+th]) {
        cylinder(d=d18650+2*th+2*delta, h=0.5*(h18650+2*th+2*delta), center=true, $fn=32);
        translate([0,-0.5*(d18650+2*th+2*delta+dbolt+th+delta),0])
            cylinder(d=dbolt+2*th+2*delta, h=0.5*(h18650+2*th+2*delta), center=true, $fn=32);
        translate([0,0.5*(d18650+2*th+2*delta+dbolt+th+delta),0])
            cylinder(d=dbolt+2*th+2*delta, h=0.5*(h18650+2*th+2*delta), center=true, $fn=32);
    }
*/
difference() {
    translate([0,0,0.5*(h18650+2*delta-0.5*(h18650+2*th+2*delta))+th]) {
        hull() {
            for (x=[0:n-1]) {
                translate([x*(d18650+th+2*delta),0,0]) {
                    cylinder(d=d18650+2*th+2*delta, h=0.5*(h18650+2*th+2*delta), center=true, $fn=32);
                    translate([0,-0.5*(d18650+2*th+2*delta+dbolt+th+delta),-0.125*(h18650+2*th+2*delta)])
                        cylinder(d=dbolt+2*th+2*delta, h=0.25*(h18650+2*th+2*delta), center=true, $fn=32);
                    translate([0,0.5*(d18650+2*th+2*delta+dbolt+th+delta),-0.125*(h18650+2*th+2*delta)])
                        cylinder(d=dbolt+2*th+2*delta, h=0.25*(h18650+2*th+2*delta), center=true, $fn=32);
                }
            }
        }
    }
    for (x=[0:n-1]) {
        translate([x*(d18650+th+2*delta),0,0]) {
            cylinder(d=d18650+2*delta, h=h18650+2*delta, center=true, $fn=32);
            translate([0,0,0.5*(h18650+2*delta-0.5*(h18650+2*th+2*delta))+th]) {
                translate([0,-0.5*(d18650+2*th+2*delta+dbolt+th+delta),0])
                    cylinder(d=dboltthrad+2*delta, h=0.5*(h18650+2*th+2*delta)+0.01, center=true, $fn=32);
                translate([0,0.5*(d18650+2*th+2*delta+dbolt+th+delta),0])
                    cylinder(d=dboltthrad+2*delta, h=0.5*(h18650+2*th+2*delta)+0.01, center=true, $fn=32);
                
                translate([0,-0.5*(d18650+2*th+2*delta+dbolt+th+delta),3*th])
                    cylinder(d=dbolt+2*delta, h=0.5*(h18650+2*th+2*delta)+0.01, center=true, $fn=6);
                translate([0,0.5*(d18650+2*th+2*delta+dbolt+th+delta),3*th])
                    cylinder(d=dbolt+2*delta, h=0.5*(h18650+2*th+2*delta)+0.01, center=true, $fn=6);
                
            }
        }
    }
}
