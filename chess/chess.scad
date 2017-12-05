module knight() {
    scale([21/36,21/36,21/36])
    translate([-18,-31.8, 13.8])
    import("/Users/iklymchuk/Downloads/Spiral_Chess_Set/files/Knight.STL");
}

module pawn() {
    scale([21/30,21/30,21/30])
    translate([-15,-24.5,9.5])
    import("/Users/iklymchuk/Downloads/Spiral_Chess_Set/files/Pawn.stl");
}

module bishop() {
    scale([21/35,21/35,21/35])
    translate([-17.5,-37,19.5])
    import("/Users/iklymchuk/Downloads/Spiral_Chess_Set/files/Bishop.stl");
}

module rook() {
    scale([21/35,21/35,21/35])
    translate([-17.5,-30,0])
    import("/Users/iklymchuk/Downloads/Spiral_Chess_Set/files/Rook2.STL");
}

module king() {
    scale([21/40,21/40,21/40])
    translate([-20,-52,32])
    import("/Users/iklymchuk/Downloads/Spiral_Chess_Set/files/King.STL");
}

module queen() {
    scale([21/36,21/36,21/36])
    translate([-18,-42.55,24.5])
    import("/Users/iklymchuk/Downloads/Spiral_Chess_Set/files/Queen.STL");
}

difference() {
    king();
    translate([0,0,0.4])
        cylinder(2.5,d=4.5, $fn=32);
}
/*
knight();
translate([22,0,0])
pawn();
translate([-22,0,0])
bishop();
translate([-44,0,0])
rook();
translate([44,0,0])
king();
translate([66,0,0])
queen();
*/
