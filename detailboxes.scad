d = 50;
w = 38;
h = 18;
wth = 0.5;
dop = 0.6; //printer precision
xs=1;
ys=2;
hdiv=8;
wdiv=16;

module outerbox() {
    difference() {
        cube([w,d,h], center=true);
        cube([w-wth*2,d+wth,h-wth*2], center=true);
    }
    translate([0,d/2+wth/2,(h-h/hdiv)/2])
        cube([w,wth,h/hdiv], center=true);
    translate([0,d/2+wth/2,-(h-h/hdiv)/2])
        cube([w,wth,h/hdiv], center=true);

    translate([(w-w/wdiv)/2,d/2+wth/2,0])
        cube([w/wdiv,wth,h], center=true);
    translate([-(w-w/wdiv)/2,d/2+wth/2,0])
        cube([w/wdiv,wth,h], center=true);
}

module innerbox() {
    union() {
        difference() {
            cube([w-wth*2-dop,d,h-wth*2-dop], center=true);
            translate([0,0,wth])
                cube([w-wth*4-dop,d-wth*2,h-wth*2-dop], center=true);
        }
        
        translate([0,-d/2,-(h-wth*2-dop)/2+wth])
        hull() {
            cube([w-wth*4-dop,0.1,wth*2], center=true);
            translate([-w/3,-w/12,0])
                cylinder(h=wth*2, d=w/6 ,$fn=32, center=true);
            translate([w/3,-w/12,0])
                cylinder(h=wth*2, d=w/6 ,$fn=32, center=true);
        }
    }
}

for (xi = [0:xs]) {
    for (yi = [0:ys]) {
        translate([(w-wth)*xi,0,(h-wth)*yi]) {
            outerbox();
            innerbox();
        }
    }
}

//innerbox();
