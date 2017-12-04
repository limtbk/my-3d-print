
module rcube(size, diam, center=false) {
    translate(center?[diam/2-size[0]/2, diam/2-size[1]/2, -size[2]/2]:[diam/2, diam/2, 0])
        hull()
            for (tr=[[0,0,0], [0,size[1]-diam,0], [size[0]-diam,size[1]-diam,0], [size[0]-diam,0,0]])
                translate(tr)
                    cylinder(d=diam, h=size[2]);
}


difference() {
    rcube([21,11,10], 6, center=true, $fn=32);
    rcube([17.56+0.6,7.67+0.6,10.01], 4, center=true, $fn=32);
}

translate([0.5,0,0])
difference() {
    union() {
        translate([15,0,-2.5])
            rcube([10,5,5], 5, center=true, $fn=32);
        translate([13,0,-2.5])
            cube([8,5,5], center=true, $fn=32);
    }

    translate([17.5,0,-2.5])
        cylinder(d=2, h=6, center=true, $fn=16);
    translate([13.5,0,-2.5])
        cylinder(d=2, h=6, center=true, $fn=16);
}