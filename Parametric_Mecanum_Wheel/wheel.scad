include <polygon.scad>;

module mecanum_wheel_bracket_slope(width, depth, height, offset_x=0, offset_y=0)
{
    offset_z = height/ 4;

    translate([offset_x, offset_y, -offset_z])
    rotate(a=120)
    cube([width, depth, height]);
}

module mecanum_wheel_bracket(
        //base_w      = 27,
        hole_r      = 6.45/2,
        hole_offset = 1,
        outer_r     = 11.5/2,
        base_h      = 15.5/2,
        //thickness   = 5
        )
{

    // cutaways on the sides of the bracket
    cutaway_diagonal = base_w - outer_r * 2;
    cutaway_side = sqrt(pow(cutaway_diagonal, 2) / 2);

    difference() {
        union() {
            cube([base_w, base_h, thickness]);
            translate([base_w / 2, base_h, thickness / 2])
                cylinder(r=outer_r, h=thickness, $fn=40, center=true);
        }
        translate([base_w / 2, base_h + hole_offset, thickness / 2])
            cylinder(r=hole_r, h=thickness, $fn=40, center=true);

        mecanum_wheel_bracket_slope(cutaway_side, cutaway_side, thickness * 2, cutaway_diagonal / 2, base_h);

        translate([base_w, 0, 0])
        mirror([1, 0, 0])
            mecanum_wheel_bracket_slope(cutaway_side, cutaway_side, thickness * 2, cutaway_diagonal / 2, base_h);
    }
}

module mecanum_wheel_hub(
        hub_r             = 29.5,
        wheel_thickness   = 18,
        faces             = 8,      // has to be divisible by 4
        bore_r            = 2,
        bracket_thickness = 3,
        bracket_w         = 27,
        )
{
    sector_angle = 360 / faces;
    theta = (180 - sector_angle) / 2;
    adjacent = cos(theta) * hub_r;
    edge_len = adjacent * 2;
    diagonal_angle = atan(wheel_thickness / edge_len);
    hypotenuse = edge_len / cos(diagonal_angle);

    bracket_angle = asin(bracket_thickness / hypotenuse);
    bracket_rotation_angle = diagonal_angle + bracket_angle;
    bracket_guide = cos(bracket_angle) * hypotenuse;

    difference() {
        intersection() {
            union() {
                linear_extrude(height=wheel_thickness)
                    convex_polygon(r=hub_r, faces=faces);

                for (edge = [0 : faces]) {
                    rotate(a=-edge * sector_angle, v=[0, 0, 1])                             // move to the starting position for current edge
                    translate([0, hub_r, 0])                                                // align bracket distance from origin with the edge
                    rotate(a=-sector_angle / 2)                                             // align bracket angle with the edge
                    rotate(a=-bracket_rotation_angle, v=[0, 1, 0])                          // tilt bracket
                    translate([-(bracket_w - bracket_guide) / 2, 0, -bracket_thickness])    // center on the edge
                        mecanum_wheel_bracket(base_w=bracket_w, thickness=bracket_thickness);
                }
            }
            cylinder(r=hub_r * 2, h=wheel_thickness);                                       // cut off protruding parts
        }
        cylinder(r=bore_r, h=wheel_thickness, $fn=20);                                      // bore
    }
}

module mecanum_wheel_depression(
        cutout_r  = 23.5,
        opening_r = 2,
        openings  = 4,
        height    = 200
        )
{
    union() {
        cylinder(r=cutout_r, h=height);

        for (opening = [0 : openings]) {
            rotate(a=opening * 360 / openings, v=[0, 0, 1])
            translate([opening_r * 3, 0, -height / 2])
                cylinder(r=opening_r, h=height);
        }
    }
}

spoke_thickness = 2.5;

module mecanum_wheel_left()
{
    difference() {
        mecanum_wheel_hub();
        translate([0, 0, spoke_thickness])
            mecanum_wheel_depression();
    }
}

module mecanum_wheel_right()
{
    difference() {
        mirror([1, 0, 0])
            mecanum_wheel_hub();
        translate([0, 0, spoke_thickness])
            mecanum_wheel_depression();
    }
}

mecanum_wheel_left();
//mecanum_wheel_right();
