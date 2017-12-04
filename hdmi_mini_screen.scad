module screen()
{
    //color("black")
        translate([2-(2+5)/2,7-(7+3)/2,2.5])
            cube([165-(2+5),100-(7+3),1], center=true);
    cube([165+2,100+1.5,4], center=true);
    //color("blue")
        translate([-2,-52.5,0])
            cube([42,5,4], center=true);
}

module front()
{
    difference() {
        cube([175,115,5], center=true);
        translate([0,0,-0.5])
            screen();

        translate([((175-4)/2-1.5),((115-4)/2-1.5),0])
            cylinder(d=4, h=20, center=true, $fn=16);
        translate([-((175-4)/2-1.5),((115-4)/2-1.5),0])
            cylinder(d=4, h=20, center=true, $fn=16);
        translate([-((175-4)/2-1.5),-((115-4)/2-1.5),0])
            cylinder(d=4, h=20, center=true, $fn=16);
        translate([((175-4)/2-1.5),-((115-4)/2-1.5),0])
            cylinder(d=4, h=20, center=true, $fn=16);
    }
}

module back()
{
    
    translate([0,0,4])
        difference() {
            cube([177,117,7], center=true);
            translate([0,0,-2.5])
                cube([175,115,5.01], center=true);
            translate([0,0,2.5])
                cube([175+1,115+1,5.01], center=true);
        }
    difference() {
        translate([0,0,1.5])
            cube([175,115,2], center=true);
        
        translate([0,0,1.5])
            cube([155,95,2.01], center=true);
        
        translate([((175-4)/2-1.5),((115-4)/2-1.5),0])
            cylinder(d=4, h=20, center=true, $fn=16);
        translate([-((175-4)/2-1.5),((115-4)/2-1.5),0])
            cylinder(d=4, h=20, center=true, $fn=16);
        translate([-((175-4)/2-1.5),-((115-4)/2-1.5),0])
            cylinder(d=4, h=20, center=true, $fn=16);
        translate([((175-4)/2-1.5),-((115-4)/2-1.5),0])
            cylinder(d=4, h=20, center=true, $fn=16);

    }
    
//    translate([16-(16+48)/2,33/2,1.5])
//        cube([90.5,65.5,2], center=true);

    translate([0,43,1.5])
        cube([175,10,2], center=true);

    translate([0,-11.25,1.5])
        cube([175,10,2], center=true);

    translate([0,0,1.5])
        cube([10,115,2], center=true);
}

module pcbmount()
{
    translate([16-(16+48)/2,33/2,-0.5])
        difference() {
            cube([95,70,6], center=true);
            translate([0,0,-0.51])
                cube([91,66,5], center=true);
            translate([0,35,-0.51])
                cube([82,5,5], center=true);
            translate([10,-35,-0.51])
                cube([30,5,5], center=true);
        }
}


//front();
//translate([0,0,-5]) {
//    back();
//    translate([0,0,-2])
        pcbmount();
//}