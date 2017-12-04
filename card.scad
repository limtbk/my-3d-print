module rrect(w, h, d, r) {
    translate([-w/2,-h/2,0])
    hull() {
    translate([0,0,0])
        cylinder(d,d=r,$fn=32);
    translate([0,h-d,0])
        cylinder(d,d=r,$fn=32);
    translate([w-d,h-d,0])
        cylinder(d,d=r,$fn=32);
    translate([w-d,0,0])
        cylinder(d,d=r,$fn=32);
    }
}

module cardtext() {
    color("black") {
        linear_extrude(2) {
            translate([-43,14,1])
            text("Trust me, I'm engineer", 3, "Helvetica Neue");

            translate([-43,20,1])
            text("Ivan Klymchuk", 5, "Helvetica Neue");

            translate([0,-10,0]) {
                translate([0,-5,1])
                    text("skype: ivan.klimchuk", 2, "Helvetica Neue");
                translate([0,-8,1])
                    text("email: ivan.klimchuk@gmail.com", 2, "Helvetica Neue");
                translate([0,-11,1])
                    text("+38 (097) 765-28-31", 2, "Helvetica Neue");
                translate([0,-14,1])
                    text("+1 (209) 818-1677", 2, "Helvetica Neue");
            }
        }
/*
    translate([11,-5,0.5])
    import("/home/lim/3DPrint/myQR.stl");
        */
    }
}

color("yellow") {
//    difference() {
        rrect(86, 54, 1, 8);
        cardtext();
  //  }
}

