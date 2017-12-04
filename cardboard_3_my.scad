
height = 25; //25   
width = 70;
depth = 20;

//translate([])
//cube([70,100,25], center=true);

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



color("red", alpha=0.5)
translate([-211,-211.5,-12.5])
import("/home/lim/3DPrint/cardboard_3.stl");
