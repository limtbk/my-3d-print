difference() {
    translate([0,0,0])
        rotate([90,0,0])
            import("/home/lim/3DPrint/rpicase/haut_de_boite_sans_trou.stl");
            
    union() {
        translate([-24.5,19,0]) {
            cylinder(d=3.5, h=7.0, $fn=64);
            cylinder(d1=6.0, d2=3.5, h=2.0, $fn=64);
        }
        translate([24.5,19,0]) {
            cylinder(d=3.5, h=7.0, $fn=64);
            cylinder(d1=6.0, d2=3.5, h=2.0, $fn=64);
        }
        translate([-24.5,-39,0]) {
            cylinder(d=3.5, h=7.0, $fn=64);
            cylinder(d1=6.0, d2=3.5, h=2.0, $fn=64);
        }
        translate([24.5,-39,0]) {
            cylinder(d=3.5, h=7.0, $fn=64);
            cylinder(d1=6.0, d2=3.5, h=2.0, $fn=64);
        }
    }
}