include <bezier.scad>;


module mecanum_wheel_roller(
    major_r = 10.5,
    minor_r = 7.85,
    height  = 20.5,
    bore_r  = 2
    )
{
    delta_r = major_r - minor_r;

    points = [
        [0, height],
        [delta_r - 1.5, 17],
        [delta_r, 10],
        [delta_r, 0]
    ];

    difference() {
        rotate_extrude($fn=40)
            union() {
                translate([minor_r, 0, 0]) bezier_curve(points);
                polygon(points=[
                        [0, 0],
                        [minor_r, 0],
                        [minor_r, height],
                        [0, height]
                    ], paths=[[0, 1, 2, 3, 0]]);
            }
        cylinder(r=bore_r, h=height, $fn=20);
    }
}

mecanum_wheel_roller();
