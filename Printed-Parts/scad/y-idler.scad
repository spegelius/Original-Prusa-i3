// PRUSA iteration3
// Y idler
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <../../Dollo/NEW_long_ties/include.scad>;

module y_idler_base(){
 translate(v = [0,0,0]) cylinder(h = 19, r=8);	
 translate(v = [0,20,0]) cylinder(h = 19, r=8);
 translate(v = [0,10,9.5]) cube(size = [16,20,19], center=true);
 translate(v = [-4,10,9.5]) cube(size = [8,16+20,19], center=true);
}

module y_idler_holes(){
 translate(v = [0,0,-1]) cylinder(h = 120, r=1.8);	
 translate(v = [0,20,-1]) cylinder(h = 25, r=4.5);
 translate(v = [0,0,4]) cylinder(h = 11, r=12);
}

// Final part
module y_idler(){
 translate(v = [0,0,8])rotate([0,-90,0]) difference(){
  y_idler_base();
  y_idler_holes();
 }
}

module dollo_y_idler() {
    difference() {
        union() {
            difference() {
                y_idler();
                translate([-30,15,-1]) cube([40,40,40]);
            }
            translate([-22.5,12,-30]) cube([25,30,46]);
            translate([-22.5,42,-25]) rotate([0,90,0]) cylinder(d=10,h=25,$fn=50);
            translate([-22.5,42,11]) rotate([0,90,0]) cylinder(d=10,h=25,$fn=50);
        }
        translate([-25,21,-22]) cube([30,40,30]);
        translate([-25,36,-22]) rotate([-90,0,-90]) male_dovetail(30);
        translate([-25,36,8]) rotate([90,0,90]) male_dovetail(30);
        translate([-25,21,-7]) rotate([90,-90,90]) male_dovetail(30);
    }
}

//y_idler();
dollo_y_idler();