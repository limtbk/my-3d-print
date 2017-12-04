module scube(size, radius, center) {
    width = size[0];
    depth = size[1];
    height = size[2];
    
    dx = center?-width/2:0;
    dy = center?-depth/2:0;
    dz = center?-height/2:0;
    
    x0 = radius;
    x1 = width - radius;
    y0 = radius;
    y1 = depth - radius;
    z0 = radius;
    z1 = height - radius;
    
    spheres = [[x0,y0,z0],[x0,y1,z0],[x1,y1,z0],[x1,y0,z0],[x0,y0,z1],[x0,y1,z1],[x1,y1,z1],[x1,y0,z1]];
    
    translate([dx,dy,dz]) {
        hull()
            for (sphere = spheres) {
                translate(sphere)
                    sphere(radius);
            }
    }
}

module ccube(size, radius, center) {
    width = size[0];
    depth = size[1];
    height = size[2];
    
    dx = center?-width/2:0;
    dy = center?-depth/2:0;
    dz = center?-height/2:0;
    
    x0 = radius;
    x1 = width - radius;
    y0 = radius;
    y1 = depth - radius;
    
    cylinders = [[x0,y0,0],[x0,y1,0],[x1,y1,0],[x1,y0,0]];
    
    translate([dx,dy,dz]) {
        hull()
            for (cylinder = cylinders) {
                translate(cylinder)
                    cylinder(height, r=radius, center=false);
            }
    }
}
