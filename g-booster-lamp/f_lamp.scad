dc=.4;
w=1.5;

module lamp() {
    translate([0,0,12/2])
        cylinder(d=22, h=12, $fn=32, center=true);
    translate([0,0,-21/2])
        cylinder(d=10, h=21, $fn=32, center=true);
}

module lampGroup() {
    ld=23;
    for (t=[[0,0,0],[0,ld,0],[sqrt(3)/2*ld,ld/2,0]]) {
        translate(t)
            lamp();
    }
}

module caseF() {
    union() {
        hull() {
            for (t=[[0+dc/2,0+dc/2,15],[48-dc/2,0+dc/2,15],[48-dc/2,40+dc/2,15],[0+dc/2,55-dc/2,15]]) {
                translate(t)
                    cylinder(h=40, d=0.4, $fn=16, center=true);
            }
            g=25;
            for (t=[[0+dc/2,0+dc/2,-g],[0+dc/2,50-dc/2,-g],[41-dc/2,0+dc/2,-g],[41-dc/2,45-dc/2,-g]]) {
                translate(t)
                    cylinder(h=5, d=0.4, $fn=16, center=true);
            }
        }
        hull() {
            for (t=[[0+dc/2,0+dc/2,0],[0+dc/2,50-dc/2,0],[31-dc/2,0+dc/2,0],[31-dc/2,30-dc/2,0]]) {
                translate(t)
                    cylinder(h=70, d=0.4, $fn=16, center=true);
            }
        }
    }
}

module case(){
    
    difference() {
        union() {
            hull() {
                for (t=[[0+dc/2,0+dc/2-2.2,15],[48-dc/2,0+dc/2-2.2,15],[48-dc/2,40+dc/2,15],[0+dc/2,55-dc/2,15]]) {
                    translate(t)
                        cylinder(h=40, d=0.4, $fn=16, center=true);
                }
                g=25;
                for (t=[[0+dc/2,0+dc/2-2.2,-g],[0+dc/2,50-dc/2,-g],[41-dc/2,0+dc/2-2.2,-g],[41-dc/2,45-dc/2,-g]]) {
                    translate(t)
                        cylinder(h=5, d=0.4, $fn=16, center=true);
                }
            }
            hull() {
                for (t=[[0+dc/2,0+dc/2,0],[0+dc/2,50-dc/2,0],[31-dc/2,0+dc/2,0],[31-dc/2,30-dc/2,0]]) {
                    translate(t)
                        cylinder(h=70, d=0.4, $fn=16, center=true);
                }
            }
        }

        union() {
            
            hull() {
                for (t=[[0+dc/2+w,0+dc/2+w,15],[48-dc/2-w,0+dc/2+w,15],[48-dc/2-w,40+dc/2-w,15],[0+dc/2+w,55-dc/2-1.7*w,15]]) {
                    translate(t)
                        cylinder(h=40+0.01, d=0.4, $fn=16, center=true);
                }
                g=25;
                for (t=[[0+dc/2+w,0+dc/2+w,-g],[0+dc/2+w,50-dc/2-w,-g],[41-dc/2-w,0+dc/2+w,-g],[41-dc/2-w,45-dc/2-w,-g]]) {
                    translate(t)
                        cylinder(h=5+0.01, d=0.4, $fn=16, center=true);
                }
            }
            
            
            hull() {
                for (t=[[0+dc/2+w,0+dc/2+w,0],[0+dc/2+w,50-dc/2-1.9*w,0],[31-dc/2-w,0+dc/2+w,0],[31-dc/2-w,30-dc/2-0.8*w,0]]) {
                    translate(t)
                        cylinder(h=70+0.01, d=0.4, $fn=16, center=true);
                }
            }
        }
        
        
    }

}


//mirror([1,0,0]) {

module lightCase() {

difference() {
intersection() {
    union() {
    translate([60/2,60/2,w/2-28])
        cube([60,60,w], center=true);
    translate([60/2,60/2,w/2-5+5])
        cube([60,60,w], center=true);
    }
    caseF();
    
}
translate([15,15,-3.5+5])
    lampGroup(); 

translate([0,0,-40])
hull() {
    for (t=[[0+dc/2+w,0+dc/2+w,0],[0+dc/2+w,50-dc/2-1.9*w,0],[31-dc/2-w,0+dc/2+w,0],[31-dc/2-w,30-dc/2-0.8*w,0]]) {
        translate(t)
            cylinder(h=70+0.01, d=0.4, $fn=16, center=true);
    }
}

}

//translate([15,15,-3.5+5])
//    lampGroup(); 

difference() {
    case();
    rotate([0,90,0]) {
        translate([35,0,2]){
            translate([-16-6,12,0])
                cylinder(d=12, h=5, $fn=32, center=true);
            translate([-47-5,12,0])
                cylinder(d=10, h=5, $fn=32, center=true);
            hull() {   
            translate([-47-5,12+17+10,0])
                cylinder(d=10, h=5, $fn=32, center=true);
            translate([-47-5+8,12+17+10,0])
                cylinder(d=10, h=5, $fn=32, center=true);
            }
            translate([-47-5,12+5+4.5/2+5,0])
                cylinder(d=5, h=5, $fn=32, center=true);
            }
    }
}
//}

}

difference() {
lightCase();

translate([48,25,55])
rotate([0,45,0])
    cube([70,70,70], center=true);
}