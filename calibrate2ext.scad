steps = 7;
stepsize = 2;
gapdelta = 0.15;
height = 3;

union() {
    for (a = [0:3]) {
        rotate([0,0,90*a]) {
            translate([-(steps+1)*(stepsize+gapdelta)+gapdelta,-stepsize,0]) {
               
                color("Gray", 1) {
                    union() {
                        for (dx = [1:steps]) {
                            translate([0,dx*stepsize,0]) {
                                cube([dx*(stepsize+gapdelta),stepsize,height]);
                            }
                        }
                    }
                    
                }
               
            }
            translate([0,-stepsize,0]) {

                color("Red", 1) {
                    union() {
                        for (dx = [1:steps]) {
                            translate([-dx*stepsize,stepsize*steps-(dx-1)*stepsize,0]) {
                                cube([dx*stepsize,stepsize,height]);
                            }
                        }
                    }
                }

            }
        }
    }
}