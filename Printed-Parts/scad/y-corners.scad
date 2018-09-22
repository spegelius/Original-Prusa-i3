// PRUSA iteration3
// Y frame corners
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <../../Dollo/NEW_long_ties/include.scad>;

module corner_base(){	
 translate([-9,-11,0])cube([18,22,49]);
 
}

module rod_holes() {
    // Top smooth rod insert
    // Smooth rod place
    translate([11,2.75,47]) rotate([0,90,90]) cylinder(h = 10, r=4.2, $fn=30); 
    // Ziptie
    translate([-5,6,41])  cube([30,3.5,2]);

    // LM8UU keepout
    difference(){
        translate([11,12.5,46]) rotate([0,90,90]) cylinder(h = 270, r=8, $fn=30);
        
        translate([21,12.5,62]) rotate([0,90,90]) cube([20,20,30]);
    } 
    translate([11,21,46]) rotate([0,90,90]) cylinder(h = 270, r=8+3.5, $fn=30);
    translate([21,12.5,57]) rotate([0,90,90]) cube([15.2,20,20]);
}

module corner_holes(){
 translate([-11,-11,0]){
  // Bottom hole
  translate([0,11,10]) rotate([0,90,0]) translate([0,0,-5]) cylinder(h = 270, r=4.4, $fn=30);
  // Top hole
  translate([0,11,30]) rotate([0,90,0]) translate([0,0,-5]) cylinder(h = 270, r=4.4, $fn=30);
  // Middle hole
  translate([11,0,20]) rotate([0,0,90]) rotate([0,90,0]) translate([0,0,-5]) cylinder(h = 270, r=5.4, $fn=30);
  // Bottom hole bridge
  translate([0,8.8,10]) rotate([0,90,0]) translate([0,0,-5]) cylinder(h = 270, r=2.6, $fn=6);
  // Top hole bridge
  translate([0,8.8,30]) rotate([0,90,0]) translate([0,0,-5]) cylinder(h = 270, r=2.6, $fn=6);

  // Washer hole
  translate([11,-3,20]) rotate([0,0,90]) rotate([0,90,0]) translate([0,0,-5]) cylinder(h = 10, r=11, $fn=30);
    rod_holes();
 }
 
}

module corner_fancy(){
 // Side corner cutouts
  translate([-8,-9,0]) rotate([0,0,-45-180]) translate([-15,0,-1]) cube([30,30,51]);
  translate([8,-9,0]) rotate([0,0,45-180]) translate([-15,0,-1]) cube([30,30,51]);
 // Top corner cutouts
    translate([7,0,49]) rotate([0,45,0]) translate([-15,-15,0]) cube([30,30,30]);
    translate([-7,0,49]) rotate([0,-45,0]) translate([-15,-15,0]) cube([30,30,30]);
    rotate([0,0,90]){
    translate([-9.5,0,49]) rotate([0,-45,0]) translate([-15,-15,0]) cube([30,30,30]);
    }
}

module selective_infill(){
    
    translate([7,2,0.8])cube([0.2,33,5]); 
    translate([-7,2,0.8])cube([0.2,33,5]);
    
    translate([ 7,16,5.8])cube([0.2,8,11]);
    translate([-7,16,5.8])cube([0.2,8,11]);
    
    translate([7,2,16.8])cube([0.2,33,2]); 
    translate([-7,2,16.8])cube([0.2,33,2]);
}
    
    
// Final part
module corner(){
 // Rotate the part for better printing
    translate([0,0,11]) rotate([-90,0,0]) 
    {
    difference(){
        corner_base();
        corner_holes();
        corner_fancy();
        translate([0,11,0]) rotate([90,0,0])selective_infill();
        
    }
    }

}

module _dollo_corner(rod_position) {
    difference() {
        translate([-14,0,30]) cube([50,37,19]);
        translate([1.2+19,-1,39]) cube([40,rod_position+23.1,30]);
        translate([-20,-1,39]) cube([21.2,rod_position+23.1,30]);
        translate([-20,rod_position+21,39]) cube([50,40,30]);
        
        translate([0,rod_position,0]) rod_holes();
        
        translate([-30,15,29.99]) rotate([90,0,90]) male_dovetail(70,bridge_extra=0.5);
        translate([1,45,29.99]) rotate([90,0,0]) male_dovetail(70,bridge_extra=0.5);
        
        // nicing on the cake
        translate([-62.6,18,0]) rotate([0,0,-45]) cube([70,40,50]);
        translate([-2,60,0]) rotate([0,0,-45]) cube([70,40,50]);
        
        translate([-30,-10,39]) rotate([-45,0,0]) cube([100,10,30]);
        translate([-25,-1,39]) rotate([0,45,0]) cube([10,50,30]);
        
        translate([0,0,49]) rotate([0,45,0]) cube([5,70,10],center=true);
        translate([21.5,0,49]) rotate([0,-45,0]) cube([5,70,10],center=true);
    }
    
}

module dollo_y_corner_left() {
    _dollo_corner(19.9);
}

module dollo_y_corner_right() {
    mirror([1,0,0]) dollo_y_corner_left();
}

module dollo_y_corner_back_right() {
    rotate([0,0,180]) _dollo_corner(14.9);
}

module dollo_y_corner_back_left() {
    mirror([1,0,0]) dollo_y_corner_back_right();
}

// use if the rods heve some free room to move
module corner_pad() {
    union() {
        cylinder(d=8,h=1,$fn=30);
        translate([0,8/2,1/2]) cube([6,3,1],center=true);
    }
}

//rotate([90,0,0]) corner();
//dollo_y_corner_left();
//dollo_y_corner_right();
//dollo_y_corner_back_left();
dollo_y_corner_back_right();

//corner_pad();

