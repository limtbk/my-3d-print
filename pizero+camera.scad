

    
//cylinder(d=2.5, h=5, $fn=16);


module PiZero()
{
    w=65;
    h=30;
    t=1;

    d=3.5;
    dd=2;
    hd=3.5;

    difference() {
        hull()
            for (i = [[d/2,d/2,0], [h-d/2,d/2,0], [h-d/2,w-d/2,0], [d/2,w-d/2,0]])
                translate(i)
                    cylinder(d=d+1, h=t, $fn=16);
        for (i = [[hd,hd,-t/2], [h-hd,hd,-t/2], [h-hd,w-hd,-t/2], [hd,w-hd,-t/2]])
            translate(i)
                cylinder(d=dd, h=t*2, $fn=16);
    }
}

union() {
    difference() {
        translate([0,0,0])
            cube([30+5,65+5,2]);

        translate([2.5,2.5,1.01])
            PiZero();
    }


    translate([0,0,2])
        difference() {
            translate([2.5,-13,0])
                cube([30,7,25]);
            translate([4.5,-11,-0.005])
                cube([26,3,25.01]);
            translate([6,-13.01,-0.005])
                cube([23,3,25.01]);
        }

    hull() {
        translate([2.5,-13,0])
            cube([30,7,2]);

        translate([0,-2,0])
            cube([30+5,2,2]);
    }
}