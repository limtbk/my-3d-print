adiam=19;
aheigh=65;
dac=1;

//i=6;
j=9;
l=[7,7,7,6,5,4,3,2,1];

difference() {
hull()
for(yi=[0:j-1])
    for(xi=[0:l[yi]-1])
        translate([(yi)*(adiam+dac)*sqrt(0.75),(xi+yi/2)*(adiam+dac),0])
                cylinder(d=adiam+dac*2, h=aheigh, $fn=64);

for(yi=[0:j-1])
    for(xi=[0:l[yi]-1])
        translate([(yi)*(adiam+dac)*sqrt(0.75),(xi+yi/2)*(adiam+dac),0])
//            difference() {
//                cylinder(d=adiam+dac*2, h=aheigh, $fn=64);
                translate([0,0,-0.005])
                    cylinder(d=adiam, h=aheigh+0.01, $fn=64);
//            }
}
/*
difference() {
    hull()
        for(yi=[0,j-1])
            for(xi=[0,i-1])
                translate([(yi)*(adiam+dac)*sqrt(0.75),(xi+yi/2)*(adiam+dac),0])
                    cylinder(d=adiam+dac*2, h=aheigh, $fn=32);
    for(yi=[0:j-1])
        for(xi=[0:i-1])
            translate([(yi)*(adiam+dac)*sqrt(0.75),(xi+yi/2)*(adiam+dac),0])
                translate([0,0,-0.005])
                    cylinder(d=adiam, h=aheigh+0.01, $fn=32);
}
*/