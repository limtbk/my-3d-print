bwidth=15;
bdepth=15;
bheight=20;
wallth=1;
prdelta=0.3;

module box() {
    difference() {
        translate([0,0,0])
            cube([bwidth,bdepth,bheight], center=true);
        translate([0,0,wallth])
            cube([bwidth-wallth*2,bdepth-wallth*2,bheight], center=true);
        translate([0,0,bheight/2-2]) {
            hull() {
                translate([0,0,2])
                    cube([bwidth-wallth*2,bdepth-wallth*2,0.01], center=true);
                translate([0,0,1])
                    cube([bwidth-wallth*2+prdelta/2,bdepth-wallth*2+prdelta/2,0.01], center=true);
            }
            hull() {
                translate([0,0,1])
                    cube([bwidth-wallth*2+prdelta/2,bdepth-wallth*2+prdelta/2,0.01], center=true);
                translate([0,0,0.5])
                    cube([bwidth-wallth*2,bdepth-wallth*2,0.01], center=true);
            }
        }
    }
}

module cap() {
    translate([0,0,8.5]) {
        difference() {
            union() {
                hull() {
                    translate([0,0,5+(bwidth+bdepth)/4])
                        cube([bwidth*0.8,bdepth*0.8,0.01], center=true);
                    translate([0,0,2.5+(bwidth+bdepth)/4])
                        cube([bwidth/2,bdepth/2,0.01], center=true);
                }
                hull() {
                    translate([0,0,2.5+(bwidth+bdepth)/4])
                        cube([bwidth/2,bdepth/2,0.01], center=true);
                    translate([0,0,2.5])
                        cube([bwidth-wallth-prdelta,bdepth-wallth-prdelta,0.01], center=true);
                }
                hull() {
                    translate([0,0,2.5])
                        cube([bwidth-wallth-prdelta,bdepth-wallth-prdelta,0.01], center=true);
                    translate([0,0,1.5])
                        cube([bwidth-wallth*2-prdelta,bdepth-wallth*2-prdelta,0.01], center=true);
                }
                hull() {
                    translate([0,0,1.5])
                        cube([bwidth-wallth*2-prdelta,bdepth-wallth*2-prdelta,0.01], center=true);
                    translate([0,0,0.5])
                        cube([bwidth-wallth*2-prdelta/2,bdepth-wallth*2-prdelta/2,0.01], center=true);
                }
                hull() {
                    translate([0,0,0.5])
                        cube([bwidth-wallth*2-prdelta/2,bdepth-wallth*2-prdelta/2,0.01], center=true);
                    translate([0,0,0])
                        cube([bwidth-wallth*2-prdelta,bdepth-wallth*2-prdelta,0.01], center=true);
                }
            }
            
            union() {
                hull() {
                    translate([0,0,2.5+(bwidth+bdepth)/4])
                        cube([bwidth/2-wallth*2,bdepth/2-wallth*2,0.01], center=true);
                    translate([0,0,2.5])
                        cube([bwidth-wallth*3-prdelta,bdepth-wallth*3-prdelta,0.01], center=true);
                }
                hull() {
                    translate([0,0,2.5])
                        cube([bwidth-wallth*3-prdelta,bdepth-wallth*3-prdelta,0.01], center=true);
                    translate([0,0,1.5])
                        cube([bwidth-wallth*4-prdelta,bdepth-wallth*4-prdelta,0.01], center=true);
                }
                hull() {
                    translate([0,0,1.5])
                        cube([bwidth-wallth*4-prdelta,bdepth-wallth*4-prdelta,0.01], center=true);
                    translate([0,0,0.5])
                        cube([bwidth-wallth*4-prdelta/2,bdepth-wallth*4-prdelta/2,0.01], center=true);
                }
                hull() {
                    translate([0,0,0.5])
                        cube([bwidth-wallth*4-prdelta/2,bdepth-wallth*4-prdelta/2,0.01], center=true);
                    translate([0,0,0])
                        cube([bwidth-wallth*4-prdelta,bdepth-wallth*4-prdelta,0.01], center=true);
                }
                
            }
        }
    }
}

for (iy = [0:5]) {
    for (ix = [0:4]) {
        translate([(bwidth-wallth+prdelta)*ix,(bdepth-wallth+prdelta)*iy,0])
            box();
    }
}

cap();
