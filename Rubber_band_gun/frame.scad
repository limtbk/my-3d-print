module gun() {
    difference() {
    
    rotate([0,-90,0])
        import("/Users/iklymchuk/Downloads/Rubber_band_gun/frame.STL");
    
         translate([-150,113,0])
            cylinder(26,d=14,$fn=32);

        hull() {
         translate([-14,11,0])
            cylinder(26,d=5,$fn=32);
    
         translate([-36,13.5,0])
            cylinder(26,d=10,$fn=32);

         translate([-72,60,0])
            cylinder(26,d=5,$fn=32);

         translate([-50,57,0])
            cylinder(26,d=10,$fn=32);
        }
//         }
        
    }
}

/*
difference() {
    gun();
    translate([-300,0,10.1])
        rotate([0,0,0])
            cube([300,130,15.3]);
}

intersection() {
    gun();
    translate([-300,0,10.1])
        rotate([0,0,0])
            cube([300,130,5.5]);
}
*/

difference() {
    gun();
    translate([-300,0,0])
        rotate([0,0,0])
            cube([300,130,15.6]);
}

//gun();
