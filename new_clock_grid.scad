cellHorPeriod = 10;
cellVertPeriod = 10;
bordHorThick = 0.7;
bordVertThick = 0.7;
horThick = 0.7;
verThick = 0.7;
horCells = 17;
vertCells = 5;
gridHeight = 5;

difference() {
	cube([horCells*cellHorPeriod+horThick/2+2*bordVertThick,vertCells*cellVertPeriod+verThick/2+2*bordHorThick,gridHeight]);

    for (i = [0:horCells-1]) {
        for (j = [0:vertCells-1]) {
            translate([i*cellHorPeriod + horThick/2 + bordVertThick, j*cellVertPeriod + verThick/2 + bordHorThick, -gridHeight]) {
                cube([cellHorPeriod - horThick/2, cellVertPeriod - verThick/2, gridHeight*3]);
            }
        }
    }

}