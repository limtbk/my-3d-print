d = 50;
w = 38;
h = 18;
wth = 0.5;
dop = 0.5; //printer precision

translate([0,0,0])
difference() {
    cube([w,d,h], center=true);
    cube([w-wth*2,d+wth,h-wth*2], center=true);
}

translate([0,0,0])
union() {
    difference() {
        cube([w-wth*2-dop,d,h-wth*2-dop], center=true);
        translate([0,0,wth])
            cube([w-wth*4-dop,d-wth*2,h-wth*2-dop], center=true);
    }
    
    translate([0,-d/2,-(h-wth*2-dop)/2+wth])
    hull() {
        cube([w-wth*4-dop,0.1,wth*2], center=true);
        translate([-w/3,-w/6,0])
            cylinder(h=wth*2, d=w/6 ,$fn=32, center=true);
        translate([w/3,-w/6,0])
            cylinder(h=wth*2, d=w/6 ,$fn=32, center=true);
    }
}