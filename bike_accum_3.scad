adiam=19.5;
aheigh=10;
dac=1;

//i=6;
j=9;
l=[7,7,7,6,5,4,3,2,1];

difference() {
    union() {
        hull() {
            for(yi=[0:j-1])
                for(xi=[0,l[yi]-1])
                    translate([(yi)*(adiam+dac)*sqrt(0.75),(xi+yi/2)*(adiam+dac),0])
                        cylinder(d=adiam+dac*2+5, h=aheigh, $fn=64);
                
        }
        hull() {
            for(t=[[-1,2],[-1,4],[5,4],[7,2]]) {
                translate([(t[0])*(adiam+dac)*sqrt(0.75),(t[1]+t[0]/2)*(adiam+dac),0])
                    cylinder(d=adiam/2, h=aheigh, $fn=64);
            }
        }
    }
    
    for(yi=[0:j-1])
        for(xi=[0:l[yi]-1])
            translate([(yi)*(adiam+dac)*sqrt(0.75),(xi+yi/2)*(adiam+dac),0]) {
                translate([0,0,2])
                    cylinder(d=adiam, h=aheigh+0.01, $fn=64);
                rotate([0,0,30])
                    cube([3,10,6], center=true);
            }
    hull()
        for(t=[[-0.9,2.5],[-0.9,3.5]]) {
            translate([(t[0])*(adiam+dac)*sqrt(0.75),(t[1]+t[0]/2)*(adiam+dac),-0.1])
                cylinder(d=5, h=aheigh*2, $fn=32);
        }
        
    hull()
        for(t=[[5.4,3.5],[6.4,2.5]]) {
            translate([(t[0])*(adiam+dac)*sqrt(0.75),(t[1]+t[0]/2)*(adiam+dac),-0.1])
                cylinder(d=5, h=aheigh*2, $fn=32);
        }            
}



