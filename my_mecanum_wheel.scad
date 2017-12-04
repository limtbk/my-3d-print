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

n_roll = 8;
n_screw = 3;
screw_diam=3;
mnt_diam = 53;
mnt_thk = 10;
mnt_in_diam = 40;
mnt_wall_th = 2;
rm_d = 1.0;
ang=-45;

shaft_mount_t = 7;

module roller_mount(dk=0, dp=0) {
    difference() {
        union() {
            translate([0,(bearer_d+fr_bearer_t)/2+fr_bearer_l,2])
                cube([bearer_d+2*fr_bearer_t+dk+dp, fr_bearer_t+dp+1, bearer_t+dp], center=true);

            hull() {
                cylinder(d=bearer_d+2*fr_bearer_t+dp, h=bearer_t+dp, center=true, $fn=32);
                translate([0,(bearer_d+fr_bearer_t)/2+fr_bearer_l,0])
                    cube([bearer_d+2*fr_bearer_t+dk+dp, fr_bearer_t+dp+1, bearer_t+dp], center=true);
            }
        }
        cylinder(d=bearer_d, h=bearer_t+0.01, center=true, $fn=32);
    }

}

module roller_half() {
    difference() {

        union() {
            rotate_extrude($fn=32) {
                translate([-rdispl+ind/2,0,0])
                    difference() {
                        circle(d=roller_curv_diam, $fn=128);
                        translate([-displ,0,0])
                            square([roller_curv_diam,roller_curv_diam], center=true);
                    }
            }
            cylinder(h=hght, d=ind, center=true, $fn=64);
        }

        cylinder(h=hght+0.01, d=therad_d, center=true, $fn=64);
        translate([0,0,(hght-2)/2])
            cylinder(h=nut_h+0.01, d=nut_d+0.5, center=true, $fn=6);
        translate([0,0,-(hght-2)/2])
            cylinder(h=nut_h+0.01, d=nut_d+0.5, center=true, $fn=6);
        translate([0,0,-(hght)/2])
            cube([hght,hght,hght], center=true);
        difference() {
            cylinder(h=5, d=hght, center=true, $fn=32);
            cylinder(h=5+0.01, d1=0.0, d2=6.0, center=true, $fn=32);
        }
        cylinder(h=bearer_t, d=hght, center=true, $fn=32);
    }
}

module roller_module() {
    color([0.2,0.2,0.2,1])
        roller_mount();

    color([0.2,0.2,0.2,1])
        roller_half();

    color([0.2,0.2,0.2,1])
        rotate([180,0,0])
            roller_half();
}

module roller_modules() {
    for (k = [0 : n_roll]) {
        rotate([0,0,(360*(k+0.5))/n_roll])
            translate([mnt_diam/2+fr_bearer_l-rm_d,0,0])
                rotate([0,ang,90])
                    roller_module();
    }
}


//roller_module();

module wheel_base() {
    difference() {
        cylinder(d=mnt_diam, h=mnt_thk, center=true, $fn=n_roll);
        for (k = [0 : n_roll]) {
            rotate([0,0,(360*(k+0.5))/n_roll])
                translate([mnt_diam/2+fr_bearer_l-rm_d,0,0])
                    rotate([0,ang,90])
                        roller_mount(dk=10, dp=0.6);
        }
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

module mecanum_wheel() {
    color([0.2,0.2,0.2,1])
        wheel_base();
    roller_modules();

    color([0.2,0.2,0.2,1])
        translate([0,0,-(shaft_mount_t+mnt_thk)/2])
            shaft_mount();
}


mecanum_wheel();


//shaft_mount();
//roller_mount();
//roller_half();
//wheel_base();
