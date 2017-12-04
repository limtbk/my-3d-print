caseWidth = 128.5;
caseLength = 208;
caseRadius = 13;
caseHeight = 5.5;
caseScreenBorder = 2;
caseScreenRadius = caseRadius - caseScreenBorder;
caseScreenHeight = 1.5;
caseIntRectWidth = 120;
caseIntRectLength = 183;
/*
difference(){
    translate([0,0,0]){
        rad = caseRadius;
        width = caseWidth;
        length = caseLength;
        height = caseHeight;
        hull() {
        for (t =  [[rad,rad,0],[length-rad,rad,0],[length-rad,width-rad,0],[rad,width-rad,0]])
            translate(t) {
                cylinder(r=rad, h=height, $fn=20);
            }
        }
    }
    translate([caseScreenBorder,caseScreenBorder,0]){
        rad = caseScreenRadius;
        width = caseWidth-2*caseScreenBorder;
        length = caseLength-2*caseScreenBorder;
        height = caseScreenHeight;
        hull() {
        for (t =  [[rad,rad,0],[length-rad,rad,0],[length-rad,width-rad,0],[rad,width-rad,0]])
            translate(t) {
                cylinder(r=rad, h=height, $fn=20);
            }
        }
    }

    translate([0,1.5,0]) {
        translate([14,5,0]){
            cube([caseIntRectLength,caseIntRectWidth,caseHeight]);
        }
        translate([5.5,59.5,0]){
            cube([8,8,caseHeight]);
        }
    //    translate([6+7/2,60.5+7/2]){
    //        cylinder(d=7, h=caseHeight);
    //    }
        translate([2.5,63.5,caseHeight-2.5]){
            cylinder(d=5, h=2.5, $fn=32);
        }
        translate([0,63,caseHeight-2.5]){
            cube([2,1,2.5]);
        }
        translate([6.5,86,0]){
            cube([4,26,caseHeight]);
        }
        
        for (t = [[9,14.5,caseHeight-2.5],[6,45.5,caseHeight-2.5],[6,57,caseHeight-2.5],[6,69.75,caseHeight-2.5],[9,82.5,caseHeight-2.5],[12,113.75,caseHeight-2.5],[31,4,caseHeight-2.5],[caseLength-6,36,caseHeight-2.5],[caseLength-6,91,caseHeight-2.5]]) {
            translate(t){
                cylinder(d=1.5, h=2.5, $fn=20);
            }
        }

        translate([0,28,caseHeight-2]){
            cube([15,16,2]);
        }
        
        translate([0,46.75,caseHeight-3]){
            cube([8,9,3]);
        }
        
        translate([0,71,caseHeight-3]){
            cube([15,8,3]);
        }
        translate([7,70,caseHeight-3]){
            cube([3,10,3]);
        }

        translate([0,86,caseHeight-3]){
            cube([10,8,3]);
        }

        translate([18,-1.5,caseHeight-3]){
            cube([8,7,3]);
        }
        translate([36,-1.5,caseHeight-3]){
            cube([8,7,3]);
        }
    }
}
*/

dd = 0.7;

translate([0,0,10])
difference(){
    translate([-1.5,-1.5,0]){
        rad = caseRadius+1.5;
        width = caseWidth+3;
        length = caseLength+3;
        height = caseHeight+5;
        hull() {
        for (t =  [[rad,rad,0],[length-rad,rad,0],[length-rad,width-rad,0],[rad,width-rad,0]])
            translate(t) {
                cylinder(r=rad, h=height, $fn=20);
            }
        }
    }

    translate([-dd/2,-dd/2,1]){
        rad = caseRadius+dd/2;
        width = caseWidth+dd;
        length = caseLength+dd;
        height = caseHeight+5;
        hull() {
        for (t =  [[rad,rad,0],[length-rad,rad,0],[length-rad,width-rad,0],[rad,width-rad,0]])
            translate(t) {
                cylinder(r=rad, h=height, $fn=20);
            }
        }
    }
    
    translate([20,65,0])
        rotate([0,0,0])
            cylinder(d=12, h=10, $fn=32, center=true);
/*    
    translate([2,2,0]){
        rad = caseRadius-2;
        width = caseWidth-4;
        length = caseLength-4;
        height = caseHeight;
        hull() {
        for (t =  [[rad,rad,0],[length-rad,rad,0],[length-rad,width-rad,0],[rad,width-rad,0]])
            translate(t) {
                cylinder(r=rad, h=height, $fn=20);
            }
        }
    }
    */
}





