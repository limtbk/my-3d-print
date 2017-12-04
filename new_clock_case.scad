cellHorPeriod = 10;
cellVertPeriod = 10;
bordHorThick = 0.7;
bordVertThick = 0.7;
horThick = 0.7;
verThick = 0.7;
horCells = 17;
vertCells = 5;
gridHeight = 5;
gridLength = horCells*cellHorPeriod+horThick/2+2*bordVertThick;
gridWidth = vertCells*cellVertPeriod+verThick/2+2*bordHorThick;

glassWidth = 68+1;
glassLength = 186+1;
glassHeight = 4;

wallThick = 2;
pcbBorder = 7;

caseLength = glassLength+2*pcbBorder+2*wallThick;
caseWidth = glassWidth+2*pcbBorder+2*wallThick;
caseHeight = gridHeight+glassHeight+wallThick+25;
glassBorder = 3;


/*
*/
/*
difference() {
    hull() {
    for (t =  [[0,0,0],[gridLength,0,0],[gridLength,gridWidth,0],[0,gridWidth,0]])
        translate(t) {
            cylinder(r=10, h=gridHeight);
        }
    }
	cube([gridLength,gridWidth,gridHeight]);
}
*/

/*
translate([wallThick+pcbBorder,wallThick+pcbBorder,wallThick]) {
color("gray", 1) {
    translate([(glassLength-gridLength)/2,(glassWidth-gridWidth)/2,glassHeight]) {
        difference() {
            cube([gridLength,gridWidth,gridHeight]);

            for (i = [0:horCells-1]) {
                for (j = [0:vertCells-1]) {
                    translate([i*cellHorPeriod + horThick/2 + bordVertThick, j*cellVertPeriod + verThick/2 + bordHorThick, -gridHeight]) {
                        cube([cellHorPeriod - horThick/2, cellVertPeriod - verThick/2, gridHeight*3]);
                    }
                }
            }
        }
    }
}
color("blue", 0.4)
    translate([0,0,0]) {
        cube([glassLength, glassWidth, glassHeight]);
    }
color("black", 1)
    translate([0,0,glassHeight]) {
        difference() {
            cube([glassLength, glassWidth, gridHeight]);
            translate([(glassLength-gridLength)/2,(glassWidth-gridWidth)/2,0]) {
                cube([gridLength,gridWidth,gridHeight]);
            }
            translate([2,2,0]) {
                cube([5,5,gridHeight]);
            }
            translate([glassLength-2-5,2,0]) {
                cube([5,5,gridHeight]);
            }
            translate([2,glassWidth-2-5,0]) {
                cube([5,5,gridHeight]);
            }
            translate([glassLength-2-5,glassWidth-2-5,0]) {
                cube([5,5,gridHeight]);
            }
        }
    }
}
*/
    
//cube([glassLength+0.5, glassWidth+0.5, gridHeight+glassHeight]);


difference() {
    translate([0,0,0]) {
        rad = 10;
        width = caseWidth;
        length = caseLength;
        height = caseHeight;
        hull() {
        for (t =  [[rad,rad,0],[length-rad,rad,0],[length-rad,width-rad,0],[rad,width-rad,0]])
            translate(t) {
                cylinder(r=10, h=height);
            }
        }
//        cube([caseLength, caseWidth, caseHeight]);
    }
    translate([wallThick,wallThick,wallThick+glassHeight+gridHeight]) {
        rad = 10;
        width = caseWidth - 2*wallThick;
        length = caseLength - 2*wallThick;
        height = caseHeight - wallThick - glassHeight - gridHeight;
        hull() {
        for (t =  [[rad,rad,0],[length-rad,rad,0],[length-rad,width-rad,0],[rad,width-rad,0]])
            translate(t) {
                cylinder(r=10, h=height);
            }
        }
//        cube([caseLength - 2*wallThick, caseWidth - 2*wallThick, caseHeight - wallThick - glassHeight - gridHeight]);
    }
    translate([pcbBorder+wallThick+glassBorder,pcbBorder+wallThick+glassBorder,0]) {
        cube([glassLength - 2*glassBorder, glassWidth - 2*glassBorder, wallThick]);
    }
    translate([pcbBorder+wallThick,pcbBorder+wallThick,wallThick]) {
        cube([glassLength, glassWidth, gridHeight+glassHeight]);
    }
}