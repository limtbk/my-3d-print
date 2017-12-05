function bezier_quadratic_0(t) = pow((1 - t), 3);
function bezier_quadratic_1(t) = 3 * t * (pow((1 - t), 2));
function bezier_quadratic_2(t) = 3 * (pow(t, 2)) * (1 - t);
function bezier_quadratic_3(t) = pow(t, 3);

function bezier_quadratic_point(p0, p1, p2, p3, t) = [
    bezier_quadratic_0(t) * p0[0] + bezier_quadratic_1(t) * p1[0] + bezier_quadratic_2(t) * p2[0] + bezier_quadratic_3(t) * p3[0],
    bezier_quadratic_0(t) * p0[1] + bezier_quadratic_1(t) * p1[1] + bezier_quadratic_2(t) * p2[1] + bezier_quadratic_3(t) * p3[1]
];

module bezier_curve(points, focal_point=[0, 0], steps=10)
{
    for (step = [steps : 1]) {
        polygon(
            points=[
                focal_point,
                bezier_quadratic_point(points[0], points[1], points[2], points[3], step / steps),
                bezier_quadratic_point(points[0], points[1], points[2], points[3], (step - 1) / steps)
            ],
            paths=[[0, 1, 2]]
        );
    }
}

module control_points(points, r=0.5, h=10, color=[1, 0, 0])
{
    for (point = [0 : 3]) {
        translate(points[point])
            color(color)
            cylinder(r=r, h=h, $fn=20);
    }
}

//bezier_curve( [[0, 20.5],[0,8],[1.1,3],[2.65,0]], [0,0]);
