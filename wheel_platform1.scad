tube_w = 20;
tube_h = 30;
tube_l = 255;
tube_th = 1.5;
tube_dist = 119.5;
sheet_th = 2;
sheet_w = 50;
sheet_l = tube_dist+2*tube_w;
motor_d1 = 24.4;
motor_d2 = 27;
motor_h1 = 23+32.5;
motor_h2 = 13.5;
motor_d3 = 7;
motor_h3 = 2.5;
motor_dsh = 4;
motor_hsh = 12;
motor_tsh = 3.5;
motor_lsh = 10;
motor_scrd = 3;
motor_scrl = 17;
motor_scrh = 6;
motor_scrang = 15;
motor_con_w = 14;
motor_con_h = 4.7;
motor_con_t = 3;
motor_con_d = 3.5;
motor_dist = 205;

use <my_mecanum_wheel.scad>;

module sq_tube() {
    difference() {
        cube([tube_w, tube_l, tube_h], center=true);
        cube([tube_w-2*tube_th, tube_l+0.01, tube_h-2*tube_th], center=true);
        for (k = [[-motor_dist/2,90], [motor_dist/2,-90]]) {
            translate([-20.2,k[0],0])
            rotate([0,90,0])
                rotate([0,0,k[1]])
                    motor(true);
        }
    }
}

module sq_sheet() {
    cube([sheet_l,sheet_w,sheet_th], center=true);
}

module motor(dif=false) {
    color("gray")
        cylinder(d=motor_d1, h=motor_h1, center=true);
    translate([0,0,-(motor_h1+motor_h2)/2])
        color("black")
            cylinder(d=motor_d2, h=motor_h2, center=true);
    translate([0,0,(motor_h1+motor_h3)/2])
        color("gray")
            cylinder(d=motor_d3, h=motor_h3, center=true);

    translate([0,0,(motor_h1+motor_h3+motor_hsh)/2]) {
        color("gray")
            difference() {
                cylinder(d=motor_dsh, h=motor_hsh, center=true);
                translate([motor_tsh,0,motor_hsh-motor_lsh])
                    cube([motor_dsh, motor_dsh, motor_hsh], center=true);
            }
    }
    if (dif) {
        rotate([0,0,90-motor_scrang])
        for (k = [[motor_scrl/2], [-motor_scrl/2]])
            translate([0,k[0],(motor_h1-motor_scrh)/2]) {
                cylinder(d=motor_scrd, h=motor_scrh+5.01, center=true);
            }
    }
        
    translate([(motor_d2-motor_con_t)/2,0,-(motor_h1+motor_con_h)/2-motor_con_d])    
        color("white")
            cube([motor_con_t,motor_con_w,motor_con_h], center=true);
}

module chassie() {
    for (k = [[(tube_dist+tube_w)/2,0],[-(tube_dist+tube_w)/2,180]]) {
        translate([k[0],0,0])
            rotate([0,k[1],0]) {
                color("lightgray")
                    sq_tube();
                
                for (l = [[-motor_dist/2,90], [motor_dist/2,-90]]) {
                    translate([-19.4,l[0],0])
                    rotate([0,90,0])
                        rotate([0,0,l[1]]) {
                            motor();
//                            translate([0,0,43])
//                                rotate([0,0,60])
//                                mecanum_wheel();
                        }
                }
            }
    }
        
    for (k = [[(tube_l-sheet_w)/2,(tube_h+sheet_th)/2],[-(tube_l-sheet_w)/2,(tube_h+sheet_th)/2],[(tube_l-sheet_w)/2,-(tube_h+sheet_th)/2],[-(tube_l-sheet_w)/2,-(tube_h+sheet_th)/2]]) {
        translate([0,k[0],k[1]])
            color("lightgray")
                sq_sheet();
    }
}

module el_mount() {
    difference() {
        union() {
            cube([tube_w+5, 20, tube_h+5], center=true);
            translate([(tube_w+0.4+20)/2,0,(tube_h-2)/2])
                cube([20,20,2], center=true);
            translate([(tube_w+0.4+20)/2,0,-(tube_h-2)/2])
                cube([20,20,2], center=true);
        }
        
        cube([tube_w+0.6, 20.01, tube_h+0.4], center=true);
        translate([2.51,0,0])
            cube([tube_w, 20.01, tube_h-4], center=true);
        translate([(tube_w+20)/2,0,0])
            cylinder(d=3, h=tube_h+4, center=true, $fn=16);
    }
}

module accums() {
    d18650 = 18.5;
    h18650 = 65.15;
    delta = 0.6;
    th = 1;
    n = 4;
    translate([-(d18650+2*th+2*delta)*(n-1)*0.5,0,0])
    rotate([90,0,0])
    difference() {
        union() {
            translate([(d18650+1*th+2*delta)*(n-1)*0.5,-(d18650+2*th+2*delta)*0.5+1,0])
                cube([(d18650+2*th+2*delta)*(n-1), 2, (h18650+2*th+2*delta)], center=true);
            translate([0,0,0.5*(h18650+2*delta-1.0*(h18650+2*th+2*delta))+th]) {
                    for (x=[0:n-1]) {
                        translate([x*(d18650+th+2*delta),0,0]) {
                            cylinder(d=d18650+2*th+2*delta, h=(h18650+2*th+2*delta), center=true, $fn=32);
                        }
                    }
            }
        }
        for (x=[0:n-1]) {
            translate([x*(d18650+th+2*delta),0,0]) {
                cylinder(d=d18650+2*delta, h=h18650+2*delta, center=true, $fn=32);
                translate([3,0,0])
                    cube([2.5,2.5,300], center=true);
                translate([-3,0,0])
                    cube([2.5,2.5,300], center=true);
            }
        }
        translate([(d18650+1*th+2*delta)*(n-1)*0.5,(d18650+2*th+2*delta)*0.7,0])
            cube([(d18650+2*th+2*delta)*n, (d18650+2*th+2*delta), (h18650+2*th+2*delta)+0.01], center=true);

    }

}

module accums_mount() {
    d18650 = 18.5;
    h18650 = 65.15;
    delta = 0.6;
    th = 1;
    n = 4;
    translate([-(d18650+2*th+2*delta)*(n-1)*0.5,0,0])
    rotate([90,0,0])
    difference() {
        translate([(d18650+1*th+2*delta)*(n-1)*0.5,-(d18650+2*th+2*delta)*0.5-1,0])
            cube([(d18650+2*th+2*delta)*(n+1), 2, 10], center=true);

        translate([(d18650+1*th+2*delta)*(n-1)*0.5,-(d18650+2*th+2*delta)*0.5,0])
        {
            translate([(d18650+2*th+2*delta)*(n+0.5)/2,0,0])
                rotate([90,0,0])
                    cylinder(d=3, h=10, center=true, $fn=16);
            translate([-(d18650+2*th+2*delta)*(n+0.5)/2,0,0])
                rotate([90,0,0])
                    cylinder(d=3, h=10, center=true, $fn=16);
        }
    }

}

module accums_block() {
    accums();
    translate([0,29,0])
        accums_mount();
    translate([0,-29,0])
        accums_mount();
}


chassie();

translate([-(tube_dist+tube_w)/2,(tube_l-20)/2-sheet_w,0])
    el_mount();

translate([-(tube_dist+tube_w)/2,-((tube_l-20)/2-sheet_w),0])
    el_mount();

translate([(tube_dist+tube_w)/2,(tube_l-20)/2-sheet_w,0])
    rotate([0,180,0])
        el_mount();

translate([(tube_dist+tube_w)/2,-((tube_l-20)/2-sheet_w),0])
    rotate([0,180,0])
        el_mount();

translate([0,0,-(tube_h+2)/2])
    cube([tube_dist-5,tube_l-2*sheet_w,2], center=true);
    



translate([0,25,-2])
    rotate([0,0,90])
    accums_block();
    
/*
rotate([90,0,0])
    el_mount();
*/



//motor();