mgh=2;
mgd=4;
delta=0.7;
hndl=15;

module handle(differ=false) {
   if (differ)
        difference() {
            translate([0,0,hndl/2])
                cube([mgd, mgh, hndl], center=true);
            rotate([90,0,0])
                cylinder(d=mgd+delta, h=mgh+0.01, center=true, $fn=32);
        }
    else
        union() {
            translate([0,0,hndl/2])
                cube([mgd+delta, mgh+delta, hndl], center=true);
            rotate([90,0,0])
                cylinder(d=mgd+delta, h=mgh+delta+0.01, center=true, $fn=32);
        };
    
}

module rotor() {
    difference() {
        union() {
            cylinder(d=mgd+3, h=mgd+delta+3, center=true, $fn=32);
            translate([0,0,(mgd+delta+3+5)/2])
                cylinder(d=mgd+3, h=5, center=true, $fn=32);
        }
        handle();
    }
    translate([0,0,-(mgd+delta+3-1)/2])
        cylinder(d=mgd+5, h=1, center=true, $fn=32);
}

module top() {
    difference() {
        translate([0,0,(mgd+delta+3+1)/2])
            cylinder(d=mgd+5, h=1, center=true, $fn=32);
        handle();
    }

}

module stator() {
    difference() {
        translate([0,0,0])
            cylinder(d=mgd+delta+10, h=mgd+delta+3, center=true, $fn=32);
        translate([0,0,(mgd+delta+3+1)/2])
            cylinder(d=mgd+delta+5, h=1+0.01, center=true, $fn=32);
        cylinder(d=mgd+delta+3, h=mgd+delta+3+0.01, center=true, $fn=32);
        translate([0,0,-(mgd+delta+3-1)/2])
            cylinder(d=mgd+delta+5, h=1+0.01, center=true, $fn=32);
        translate([5,0,0]) {
            cube([1.55+delta-0.4, 4.08+delta-0.3, 3.16+delta], center=true);
            translate([0,0,-2.5])
                cube([1.55+delta-0.4, 4.08+delta-0.3, 5], center=true);
        }
        rotate([0,0,90])
        translate([5,0,0]) {
            cube([1.55+delta-0.4, 4.08+delta-0.3, 3.16+delta], center=true);
            translate([0,0,-2.5])
                cube([1.55+delta-0.4, 4.08+delta-0.3, 5], center=true);
        }

    }

}

module bottom() {
    difference() {
        translate([0,0,(mgd+delta+3+2)/2])
            cylinder(d=mgd+delta+10, h=2, center=true, $fn=32);

        translate([0,0,(mgd+delta+3+1+2.2)/2])
            cylinder(d=mgd+delta+5, h=0.8+0.01, center=true, $fn=32);

        translate([5,0,5]) {
            translate([0,0,0])
                cylinder(d=1.5, h=10, center=true, $fn=16);
            translate([0,1.27,0])
                cylinder(d=1.5, h=10, center=true, $fn=16);
            translate([0,-1.27,0])
                cylinder(d=1.5, h=10, center=true, $fn=16);
        }

        rotate([0,0,90])
        translate([5,0,5]) {
            translate([0,0,0])
                cylinder(d=1.5, h=10, center=true, $fn=16);
            translate([0,1.27,0])
                cylinder(d=1.5, h=10, center=true, $fn=16);
            translate([0,-1.27,0])
                cylinder(d=1.5, h=10, center=true, $fn=16);
        }

    }

}


translate([0,-5,1])
rotate([90,0,0])
handle(true);

translate([0,10,3.85])
rotor();

//translate([0,0,-3.7])
//top();

translate([10,0,-3.85])
bottom();

translate([-15,0,3.85])
rotate([180,0,0])
stator();