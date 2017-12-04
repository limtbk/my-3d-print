diam=69.8;
thk=5;
wth=1.2;

cwid=25;
chgh=24;
cthk=1.5;
cbth=3;
presc=0.8;

lwdt=5;


module tubemount() {

translate([0,0,thk/2])
    difference() {
        cylinder(d=diam, h=thk, $fn=128, center=true);
        cylinder(d=diam-wth*2, h=thk+1, $fn=128, center=true);
    }

difference() {
union() {
translate([0,0,wth/2])
    cube([cwid+10,cwid+10,wth], center=true);
translate([diam/4,0,(wth)/2])
    cube([diam/2,lwdt,wth], center=true);
translate([-diam/4,0,(wth)/2])
    cube([diam/2,lwdt,wth], center=true);
translate([0,diam/4,(wth)/2])
    cube([lwdt,diam/2,wth], center=true);
translate([0,-diam/4,(wth)/2])
    cube([lwdt,diam/2,wth], center=true);
}
union() {
translate([0,-cthk/2,cthk/2+cthk/3])
    cube([cwid+presc*2+2*cthk+1,chgh+presc*2+cthk,wth], center=true);
translate([0,chgh/2+presc+2,cthk/2])
    cube([16.5,1.5,cthk*2], center=true);
}
}

}

module cameramount() {

translate([0,0,(cbth)/2])
difference() {
translate([0,-cthk/2,(cthk+presc+cbth)/2]) 
    cube([cwid+presc*2+2*wth,chgh+wth,cthk+presc+2*wth+cbth], center=true);
translate([0,0,cthk*3/2+cthk]) {
    translate([0,0,(cbth-cthk-presc)/2])
        cube([cwid+presc*2,chgh,cthk+presc], center=true);
    cube([cwid-wth*2,chgh,cthk+presc+wth+cbth], center=true);
}
}
}


tubemount();
//cameramount();

