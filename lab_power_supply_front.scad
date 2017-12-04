w = 148;
h = 85;

difference() {
    cube([w,h,2], center=true);
    for (t=[[(w/2-5),(h/2-5),0],[-(w/2-5),(h/2-5),0],[-(w/2-5),-(h/2-5),0],[(w/2-5),-(h/2-5),0]])
       translate(t)
            cylinder(d=4, h=5, center=true, $fn=16);
    translate([25,20,0])
        cube([46,26,5], center=true);

    for (t=[[(w/2-15),(h/2-15),0],[(w/2-15),(h/2-30),0]])
       translate(t)
            cylinder(d=7, h=5, center=true, $fn=16);

    for (t=[[(w/2-15),-(h/2-35),0],[(w/2-35),-(h/2-35),0]])
       translate(t)
            cylinder(d=12, h=5, center=true, $fn=16);

    for (t=[[(w/2-15),-(h/2-15),0],[(w/2-35),-(h/2-15),0],[(w/2-55),-(h/2-15),0],[(w/2-75),-(h/2-15),0]])
       translate(t)
            cylinder(d=8, h=5, center=true, $fn=16);

    translate([-37,20,0]) {
//        cube([70,25,1], center=true);
        
        cube([23,14,5], center=true);
       translate([23/2+16,0,0])
            cylinder(d=7, h=5, center=true, $fn=16);
       translate([-23/2-4,0,0])
            cylinder(d=3, h=5, center=true, $fn=16);

    }

    translate([-37,-5,0]) {
        cylinder(d=15, h=5, center=true, $fn=16);
    }    
    
    for (t=[[-(w/2-15),-(h/2-15),0],[-(w/2-35),-(h/2-15),0]])
       translate(t)
            cylinder(d=6, h=5, center=true, $fn=16);

}

translate([0,0,-16])
difference() {
    cube([w,h,30], center=true);
    cube([w-4,h-4,30.1], center=true);

}