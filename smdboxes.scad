xs = 4;
ys = 5;

difference() {
    translate([-18.75/2-3.5,-21.65/2-0.5,0])
        cube([(xs+1)*18.75+7,(ys+2)*21.65+1,20]);
    translate([-18.75/2-3.5+0.5,-21.65/2-0.5+0.5,0.5])
        cube([(xs+1)*18.75+7-1,(ys+2)*21.65+1-1,20]);

}

for (xi = [0:xs]) {
    for (yi = [0:ys+(xi+1)%2]) {
        translate([xi*18.75,(yi+(xi%2)/2)*21.65,0])
            difference() {
                translate([0,0,0])
                    cylinder(d=25, h=20, $fn=6);
                translate([0,0,1])
                    cylinder(d=25-1, h=20, $fn=6);
            }
    }
}


/*
translate([0,0,25]) {
    difference() {
    union() {
        translate([0,0,0])
            cylinder(d1=25-1.3, d2=25, h=2, $fn=6);
        translate([0,0,-2])
            cylinder(d=25-1.3, h=2, $fn=6);
    }
    translate([0,0,-2])
        cylinder(d=25-2.3, h=3, $fn=6);
    }
}
*/