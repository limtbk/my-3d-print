
height = 25; //25   
width = 70;
depth = 20;

//translate([])
//cube([70,100,25], center=true);
/*
translate([0,40,0]) {
    difference() {
        cube([70,20,height], center=true);
        cube([70-6,20.1,height-4], center=true);
        translate([0,0,height/2-1])
            cube([70-6,20.1,2.01], center=true);
        translate([-35.5,0,height/2-6.5])
            cube([5,20.01,6], center=true);
        translate([35.5,0,height/2-6.5])
            cube([5,20.01,6], center=true);
    }
    
    translate([-35.5,0,height/2-1.75])
        cube([3,20,3.5], center=true);
    translate([35.5,0,height/2-1.75])
        cube([3,20,3.5], center=true);
//    translate([-37,0,6])
//    cube([5,20,6], center=true);
}

*/

module top() {
    color("blue", alpha=0.5)
    translate([-306.71,-191,-17.5])
    import("/home/lim/3DPrint/cardboard_1.stl");

//    color("green", alpha=0.5)
//    cube([73,120,35], center=true);
    
}

module back() {
    color("red", alpha=0.5)
    translate([-211,-211.5,-12.5])
    import("/home/lim/3DPrint/cardboard_3.stl");
}

module bottom() {
    color("white", alpha=0.5)
    translate([-306.5,-374.5,-17.5])
    import("/home/lim/3DPrint/cardboard_2.stl");

//    color("green", alpha=0.5)
//    cube([73,120,35], center=true);
}

module glass() {
//    color("white", alpha=0.5)
//    cube([66,116.5,2], center=true);

    color("green", alpha=0.5)
    translate([-211,-338.5,-1])
        import("/home/lim/3DPrint/cardboard_4.stl");
}

module divider() {
    color("yellow", alpha=0.5)
    translate([-213.25,-436.95,-0.75])
    import("/home/lim/3DPrint/cardboard_5.stl");

//    color("red", alpha=0.5)
//    cube([67.5,42.6,1.5], center=true);
}


//translate([-40,0,0])
//    rotate([0,90,0])
//        back();

translate([6,0,0])
    rotate([0,90,180])
        glass();

translate([-15,0,-1 ])
    rotate([0,90,90])
        divider();

translate([0,0,35/2])
    rotate([0,180,0])
        top();

translate([0,0,-35/2])
    bottom();


//import("/home/lim/3DPrint/cardboard_6.stl");
//import("/home/lim/3DPrint/cardboard_7.stl");

