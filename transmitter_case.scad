pcbwidth=42;
pcbdepth=21.5;
pcbheight=10;
wallth=1;

module pcb() {
    translate([-pcbwidth/2,-pcbdepth/2,-pcbheight/2]) {
        cube([pcbwidth,pcbdepth,pcbheight], center=false);
        translate([4,6.5,pcbheight])
            cube([20,8,2.5], center=false);
        translate([36,2,pcbheight-1.5])
            cube([4,3,2], center=false);
        translate([36,16,pcbheight-1.5])
            cube([4,3,2], center=false);
        
        translate([36,-1.5,4.5])
            rotate([90,0,0])
                cylinder(d=5, h=3, $fn=32, center=true);
        
        translate([21.75,-1.5,4.5])
            cube([6.75,3,2.6], center=false);
        
    }
}

module topcase() {
    intersection() {
    
    difference() {
        translate([0,0,0])
            cube([pcbwidth+2*wallth+1,pcbdepth+2*wallth+1,pcbheight+2*wallth], center=true);
        translate([0,0,-wallth])
            cube([pcbwidth+1,pcbdepth+1,pcbheight+2*wallth], center=true);
        
        translate([-pcbwidth/2,-pcbdepth/2,-pcbheight/2]) {
            translate([4,6.5,pcbheight])
                cube([21,9,2.5], center=false);
            
            translate([36,-1.5,4.5])
                rotate([90,0,0])
                    cylinder(d=6, h=3, $fn=32, center=true);
            
            translate([21.5,-1.5,4.5])
                cube([7.5,3,2.6], center=false);
            translate([21.5-15.3-6,-1.5,4.5])
                cube([16,3,3.2], center=false);
            
            translate([3.5,pcbdepth-1.5,4.5-3.5])
                cube([13,3,6], center=false);
            translate([3.5+13+6,pcbdepth-1.5,4.5-3.5])
                cube([13,3,6], center=false);
        }
        
        translate([6,9.5,0])
            cube([15,1,20]);
        translate([6,-0.5,0])
            cube([15,1,20]);
        translate([6,-9.5-1,0])
            cube([15,1,20]);
        translate([20,-9.5-1,0])
            cube([1,20,20]);
    }
    
    
        translate([0,0,5.5])
            cube([pcbwidth+2*wallth+1,pcbdepth+2*wallth+1,pcbheight+2*wallth], center=true);
    }
}

//pcb();
topcase();