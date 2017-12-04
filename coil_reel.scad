rdiam=8.1;
rlength=30.25;
padj=0.95;
wthick=0.4;
bdiam=4;
bthick=4;

difference() {
    union() {
        translate([0,0,0])
            cylinder(d=rdiam+padj+2*wthick, h=rlength, center=true, $fn=64);
        translate([0,0,rlength/2-bthick/2])
            cylinder(d2=rdiam+padj+2*wthick+2*bdiam, d1=rdiam+padj+2*wthick, h=bthick, center=true, $fn=64);
        translate([0,0,-rlength/2+bthick/2])
            cylinder(d1=rdiam+padj+2*wthick+2*bdiam, d2=rdiam+padj+2*wthick, h=bthick, center=true, $fn=64);
        
    }
    translate([0,0,0])
        cylinder(d=rdiam+padj, h=rlength, center=true, $fn=64);
}