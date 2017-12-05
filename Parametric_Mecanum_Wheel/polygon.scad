include <trig.scad>;

module convex_polygon(r=10, faces=8)
{
    for (i = [0 : faces - 1]) {
        polygon(
            points=[
                [0, 0],
                [r * cos(i * 360 / faces), r * sin(i * 360 / faces)],
                [r * cos((i + 1) * 360 / faces), r * sin((i + 1) * 360 / faces)]
            ],
            paths=[ [0, 1, 2] ]
        );
    }
}

//linear_extrude(height=10) convex_polygon(faces=12);
