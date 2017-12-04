use <rcube.scad>;
use <grid.scad>;

    xn = 17;
    yn = 5;
    cx = 10;
    cy = 10;
    width = xn*cx;
    depth = yn*cy;
    height = 5;
    
    th = 0.6;
    wallth = 1;
    
    pcbborder = 7.8;
    pcbth = 2;
    glassth = 4;
    
    delta = 0.6;    
    
    gridstuffheight = glassth+height+pcbth;
    bodywidth = width+3*pcbborder;
    bodydepth = depth+3*pcbborder;
    bodyheight = wallth+gridstuffheight+25;

    hoodheight = 20;
    
    batterysize = [68,20,20];
    batterypos = [0,-20,7];
    
    speakerpos = [-73,13,10];
    speakersize = 38;
    
    powerpos = [33,18,10];
    powersize = [];
    
    sensorpos = [-67,-20,10];
    
    ad = 3.1;
    sd = 3.5;

module clockgrid() {
    difference() {
    union() {
    translate([-88.5,0,-11]) {
        cylinder(d=6.5, h=height, $fn=32);
    }
    translate([88.5,0,-11]) {
        cylinder(d=6.5, h=height, $fn=32);
    }
    translate([0,28.5,-8.5]) {
        cube([8,7,height], true);
    }
    translate([0,-28.5,-8.5]) {
        cube([8,7,height], true);
    }

    translate([0,0,-(bodyheight-gridstuffheight)/2+wallth])
    translate([0,0,(glassth-pcbth)/2]){
    
    color("grey", alpha=1) {
        union() {
            grid([width,depth,height],[xn,yn],[th,th],true);
            grid([width+2*pcbborder,depth+2*pcbborder,height],[1,1],[wallth,wallth],true);
            translate([0,0,(-height+wallth)/2])
                grid([width+2*pcbborder,depth+2*pcbborder,wallth],[1,1],[pcbborder,pcbborder],true);
        }
    }
}
/*
    color("white", alpha=0.1) {
        translate([0,0,(-height-glassth)/2])
            cube([width+2*pcbborder,depth+2*pcbborder,glassth],true);
    }
    color("green", alpha=0.5) {
        translate([0,0,(height+pcbth)/2])
            cube([width+2*pcbborder,depth+2*pcbborder,pcbth],true);
    }
 */
    }
    
    
    translate([88.5,0,-12]) {
        cylinder(d=5.3, h=height+2, $fn=32);
    }    
    translate([-88.5,0,-12]) {
        cylinder(d=5.3, h=height+2, $fn=32);
    }
    
    translate([0,28.5,-8.5]) {
        cube([7,6,height+2], true);
    }
    translate([0,-28.5,-8.5]) {
        cube([7,6,height+2], true);
    }

}
}

module cbody(size,radius,wallth) {
    width = size[0];
    depth = size[1];
    height = size[2];
    
    difference() {
        ccube([width,depth,height], radius, center=true, $fn=32);
        translate([0,0,wallth])
            ccube([width-2*wallth,depth-2*wallth,height], radius-wallth, center=true, $fn=32);
    }
}

module clockbody() {
    color("grey", alpha=1) {
        difference() {
            cbody([bodywidth,bodydepth,bodyheight],5,wallth);
            cube([width+11,depth+11,bodyheight+1],true);
        }

        translate([0,0,-(bodyheight-gridstuffheight)/2+wallth])
            grid([width+2*pcbborder+2*wallth+2*delta,depth+2*pcbborder+2*wallth+2*delta+2.4,gridstuffheight],[1,1],[wallth,wallth],true);
    }
}



module addbattery() {
    difference() {
        union() {
            children();
            translate(batterypos)
                grid([batterysize[0]+wallth*2,batterysize[1]+wallth*2,batterysize[2]],[1,1],[wallth,wallth],true);
        }
        translate(batterypos) {
            for (nx = [-5:5])
                for (ny = [-1:1])
                    translate([nx*5.6,ny*3.3,-7])
                        cylinder(d=ad, h=20, $fn=6);
            for (nx = [-4.5:4.5])
                for (ny = [-1.5:1.5])
                    translate([nx*5.6,ny*3.3,-7])
                        cylinder(d=ad, h=20, $fn=6);
        }
    }
}

module addspeaker() {
    difference() {
        union() {
            children();
                translate(speakerpos)
                    difference() {
                        cylinder(d=speakersize+2*wallth, h=6, $fn=32);
                        translate([0,0,-1])
                            cylinder(d=speakersize, h=8, $fn=64);
                    }
        }
        for (nx = [-2:2])
            for (ny = [-3:3])
                translate([speakerpos[0]+nx*5.6,speakerpos[1]+ny*3.3,speakerpos[2]])
                    cylinder(d=ad, h=20, $fn=6);
        for (nx = [-1.5:1.5])
            for (ny = [-3.5:3.5])
                translate([speakerpos[0]+nx*5.6,speakerpos[1]+ny*3.3,speakerpos[2]])
                    cylinder(d=ad, h=20, $fn=6);

    }
}

module addsensor() {
    difference() {
        union() {
            translate(sensorpos)
                grid([50,24,14],[1,1],[wallth,wallth],true);
            children();
        }
        translate(sensorpos) {
            for (nx = [-3:3])
                for (ny = [-2:2])
                    translate([nx*5.6,ny*3.3,0])
                        cylinder(d=ad, h=20, $fn=6);        
            for (nx = [-2.5:2.5])
                for (ny = [-1.5:1.5])
                    translate([nx*5.6,ny*3.3,0])
                        cylinder(d=ad, h=20, $fn=6);        
        }
    }
}

module addkeys() {
    difference() {
        union() {
            children();
            translate([90,-30,14])
                cylinder(d=7, h=3, $fn=32);
            translate([90,30,14])
                cylinder(d=7, h=3, $fn=32);
            translate([70,-30,14])
                cylinder(d=7, h=3, $fn=32);
            translate([70,30,14])
                cylinder(d=7, h=3, $fn=32);
            translate([78,0,16])
                cube([23,12*4,2],true);

        }
        translate([90,-30,0])
            cylinder(d=sd, h=20, $fn=32);
        translate([90,30,0])
            cylinder(d=sd, h=20, $fn=32);
        translate([70,-30,0])
            cylinder(d=sd, h=20, $fn=32);
        translate([70,30,0])
            cylinder(d=sd, h=20, $fn=32);        
        
        translate([90-1,-24,0])
            cube([1,12*4,20]);
        for (nx = [-2:2])
            translate([65,-0.5+12*nx,0])
                cube([25,1,20]);
        for (nx = [-1.5:1.5]) {
            translate([65,3+12*nx,0])
                cube([1,3,20]);
            translate([65,-6+12*nx,0])
                cube([1,3,20]);
        }
    }
}

module addpower() {
    difference() {
        union() {
            translate(powerpos)
                grid([56,28,14],[1,1],[wallth,wallth],true);
            children();
            translate(powerpos) {
                translate([-23,-9,4])
                    cylinder(d=7, h=3, $fn=32);
                translate([+23,-9,4])
                    cylinder(d=7, h=3, $fn=32);
                translate([-23,+9,4])
                    cylinder(d=7, h=3, $fn=32);
                translate([+23,+9,4])
                    cylinder(d=7, h=3, $fn=32);            
            }
        }

        translate(powerpos) {
            translate([-23,-9,0])
                cylinder(d=sd, h=20, $fn=32);
            translate([23,-9,0])
                cylinder(d=sd, h=20, $fn=32);
            translate([-23,9,0])
                cylinder(d=sd, h=20, $fn=32);
            translate([23,9,0])
                cylinder(d=sd, h=20, $fn=32);
            for (nx = [-3:3])
                for (ny = [-1:1])
                    translate([nx*5.6,ny*3.3,0])
                        cylinder(d=ad, h=20, $fn=6);        
            for (nx = [-2.5:2.5])
                for (ny = [-1.5:1.5])
                    translate([nx*5.6,ny*3.3,0])
                        cylinder(d=ad, h=20, $fn=6);        
        }
    }
}

module addpowercordholder() {
    difference() {
        union() {
            children();
            translate([0,30,13])
                cylinder(d=7, h=4, $fn=32);
        }
        translate([0,30,0])
            cylinder(d=4, h=20, $fn=32);
    }
}


module clockhood() {
    difference() {
        union() {
            translate([0,0,(bodyheight-hoodheight)/2+wallth]) {
                translate([0,0,(hoodheight-wallth)/2])
                    ccube([bodywidth,bodydepth,wallth], 5, center=true, $fn=32);
                difference() {
                    ccube([bodywidth-2*wallth-2*delta,bodydepth-2*wallth-2*delta,hoodheight], 5-wallth-delta, center=true, $fn=32);
                    translate([0,0,-wallth])
                        ccube([bodywidth-4*wallth-2*delta,bodydepth-4*wallth-2*delta,hoodheight], 5-2*wallth-delta, center=true, $fn=32);
                }
            }
        }
    }
}

//clockgrid();
clockbody();
/*
addsensor()
addkeys()
addpower()
addspeaker()
addbattery()
addpowercordholder()
color("grey", alpha=1)
clockhood();
*/