caseWidth = 128;
caseLength = 206;
caseRadius = 10;
caseHeight = 5.5;
caseScreenBorder = 2;
caseScreenRadius = caseRadius - caseScreenBorder;
caseScreenHeight = 1;
caseIntRectWidth = 118;
caseIntRectLength = 182;

difference(){
    translate([0,0,0]){
        rad = caseRadius;
        width = caseWidth;
        length = caseLength;
        height = caseHeight;
        hull() {
        for (t =  [[rad,rad,0],[length-rad,rad,0],[length-rad,width-rad,0],[rad,width-rad,0]])
            translate(t) {
                cylinder(r=rad, h=height);
            }
        }
    }
    translate([14,7,0]){
        cube([caseIntRectLength,caseIntRectWidth,caseHeight]);
    }
    translate([caseScreenBorder,caseScreenBorder,0]){
        rad = caseScreenRadius;
        width = caseWidth-2*caseScreenBorder;
        length = caseLength-2*caseScreenBorder;
        height = caseScreenHeight;
        hull() {
        for (t =  [[rad,rad,0],[length-rad,rad,0],[length-rad,width-rad,0],[rad,width-rad,0]])
            translate(t) {
                cylinder(r=rad, h=height);
            }
        }
    }
    translate([6,60.5,caseHeight-1]){
        cube([7,7,1]);
    }
    translate([6+7/2,60.5+7/2]){
        cylinder(d=7, h=caseHeight);
    }
    translate([1+4.5/2,60.5+7/2,caseHeight-2.5]){
        cylinder(d=4.5, h=2.5);
    }
    translate([0,60.5+6/2,caseHeight-2]){
        cube([2,1,1]);
    }
    translate([7,86.5,0]){
        cube([3,25,caseHeight]);
    }
    translate([9,15,caseHeight-2.5]){
        cylinder(d=1, h=2.5);
    }
    translate([6,46,caseHeight-2.5]){
        cylinder(d=1, h=2.5);
    }
    translate([6,57,caseHeight-2.5]){
        cylinder(d=1, h=2.5);
    }
    translate([6,71,caseHeight-2.5]){
        cylinder(d=1, h=2.5);
    }
    translate([9,83,caseHeight-2.5]){
        cylinder(d=1, h=2.5);
    }
    translate([12,114,caseHeight-2.5]){
        cylinder(d=1, h=2.5);
    }
    translate([31,5,caseHeight-2.5]){
        cylinder(d=1, h=2.5);
    }
    translate([caseLength-6,36,caseHeight-2.5]){
        cylinder(d=1, h=2.5);
    }
    translate([caseLength-6,91,caseHeight-2.5]){
        cylinder(d=1, h=2.5);
    }
    
    translate([0,48,caseHeight-3]){
        cube([13,7,3]);
    }
    
    translate([0,72,caseHeight-3]){
        cube([13,8,3]);
    }

    translate([0,81,caseHeight-3]){
        cube([4,16,3]);
    }

    translate([16,0,caseHeight-3]){
        cube([26,3,3]);
    }
}





