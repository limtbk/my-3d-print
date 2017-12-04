module grid(size, dim, thick, center) {
    width = size[0];
    depth = size[1];
    height = size[2];
    
    nx = dim[0];
    ny = dim[1];
    
    tx = thick[0];
    ty = thick[1];
    
    dx = center?-width/2:0;
    dy = center?-depth/2:0;
    dz = center?-height/2:0;

    translate([dx,dy,dz])
        union() {
            for(xi = [0:nx])
                translate([(width-tx)/nx*xi,0,0])
                    cube([tx,depth,height]);
            for(yi = [0:ny])
                translate([0,(depth-ty)/ny*yi,0])
                    cube([width,ty,height]);
        }
}
