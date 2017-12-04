bearer_d = 6+0.2;
bearer_t = 2.5;
fr_bearer_t = 1.5; //Thickness around bearer
fr_bearer_l = 5;

roller_curv_diam = 50;
nn = 8; //sectors in circle
displ = roller_curv_diam/2*(1-cos(180/nn));
rdispl = roller_curv_diam/2*cos(180/nn);
hght = 2*roller_curv_diam/2*sin(180/nn);
ind = 7.5; //inner diameter
nut_d = 6;
nut_h = 2;
therad_d = 3.8;

n_roll = 128;
n_screw = 3;
screw_diam=3;
mnt_diam = 72;
mnt_thk = 10;
mnt_in_diam = 60;
mnt_wall_th = 2;
rm_d = 1.0;
ang=-45;

shaft_mount_t = 7;

module wheel_base() {

    
    difference() {
        cylinder(d=mnt_diam, h=mnt_thk, center=true, $fn=n_roll);
        translate([0,0,mnt_wall_th])
            cylinder(d=mnt_in_diam, h=mnt_thk, center=true, $fn=n_roll);
        
        cylinder(d=screw_diam, h=mnt_diam+0.01, center=true, $fn=32);
        for (k = [0 : n_screw]) {
            rotate([0,0,(360*(k))/n_screw])
                translate([7,0,0])
                    cylinder(d=screw_diam+0.5, h=mnt_diam+0.01, center=true, $fn=32);
        }  
        for (k = [0 : 3]) {
            rotate([0,0,(360*(k+0.5))/3])
                translate([12,0,0])
                    cylinder(d=10, h=mnt_diam+0.01, center=true, $fn=32);
        }  
        for (k = [0 : 3]) {
            rotate([0,0,(360*(k))/3])
                translate([14,0,0])
                    cylinder(d=6, h=mnt_diam+0.01, center=true, $fn=32);
        }  
        for (k = [0 : 12]) {
            rotate([0,0,(360*(k))/12])
                translate([24,0,0])
                    cylinder(d=10, h=mnt_diam+0.01, center=true, $fn=32);
        }
        for (k = [0 : 36]) {
            rotate([0,0,(360*(k))/36])
                translate([(mnt_diam+mnt_in_diam)/4+3,0,0])
                    rotate([30,0,0])
                    cylinder(d=(mnt_diam-mnt_in_diam)/4, h=mnt_thk+0.01, center=true, $fn=3);
        }        
        for (k = [0 : 36]) {
            rotate([0,0,(360*(k))/36])
                translate([(mnt_diam+mnt_in_diam)/4+3,0,0])
                    rotate([-30,0,0])
                    cylinder(d=(mnt_diam-mnt_in_diam)/4, h=mnt_thk+0.01, center=true, $fn=3);
        }         
    }
}

module shaft_mount() {
    difference() {
        cylinder(d=23, h=shaft_mount_t, center=true, $fn=32);
        cylinder(d=screw_diam, h=shaft_mount_t+0.01, center=true, $fn=32);
        for (k = [0 : n_screw]) {
            rotate([0,0,(360*(k))/n_screw])
                translate([7,0,0]) {
                    cylinder(d=screw_diam, h=shaft_mount_t+0.01, center=true, $fn=32);
                    translate([0,0,-1])
                        cylinder(d=nut_d+1, h=shaft_mount_t-2+0.01, center=true, $fn=6);
                }
        }  
        translate([0,0,0]) {
            rotate([0,0,30]) {
                rotate([90,0,0])
                    translate([0,0,7]) {
                        rotate([0,0,30])
                            cylinder(d=nut_d+1, h=nut_h+0.8, center=true, $fn=6);
                        translate([0,-3,0])
                            cube([nut_d+0.5, nut_d, nut_h+0.8], center=true);
                    }
                rotate([90,0,0])
                    translate([0,0,5])
                    cylinder(d=screw_diam, h=26/2, center=true, $fn=32);
                difference() {
                    cylinder(d=4+0.5, h=10, center=true, $fn=32);
                    translate([0,-4-0.5+0.5,0])
                        cube([4+0.5,4+0.5,10+0.01], center=true);
                }            
            }
        }
    }
}

module wheel() {
    color([0.2,0.2,0.2,1])
        wheel_base();

    color([0.2,0.2,0.2,1])
        translate([0,0,-(shaft_mount_t+mnt_thk)/2])
            shaft_mount();
}


//wheel();


//shaft_mount();
//roller_mount();
//roller_half();
wheel_base();
