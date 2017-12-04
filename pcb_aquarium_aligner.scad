w=4.05;

difference() {
    translate([0,0,0])
        cube([70,20,5], center=true);
    translate([3+(w/2),5,0])
        cube([w,20,10], center=true);
    translate([-3-(w/2),5,0])
        cube([w,20,10], center=true);
    translate([30-(w/2),5,0])
        cube([w,20,10], center=true);
    translate([-30+(w/2),5,0])
        cube([w,20,10], center=true);
    translate([16.5,5,0])
        cube([10,20,10], center=true);
    translate([-16.5,5,0])
        cube([10,20,10], center=true);
}