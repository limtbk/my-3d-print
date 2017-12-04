h=15;
d=7;

difference() {
    union()
    {
    translate([0,0,0])
        cylinder(d=d+2, h=h/2, center=true, $fn=32);
    translate([0,0,(h/2-1)/2])
        cylinder(d=d*2, h=1, center=true, $fn=32);
    }
    translate([0,0,0])
        cylinder(d=d, h=h/2+1, center=true, $fn=32);
}