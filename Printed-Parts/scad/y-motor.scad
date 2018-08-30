// PRUSA iteration3
// Y motor mount
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

//include <configuration.scad>

use <../../Dollo/NEW_long_ties/mockups.scad>;
use <../../Dollo/NEW_long_ties/include.scad>;

module y_motor_base(){
    
    union()
    {
    // Motor holding part
    translate(v = [29,-21+50,0]){
        
    difference()
    {    
     union()
    {
    translate(v = [-21+4.5,0,5]) cube(size = [9,31,10], center=true);
    translate(v = [0,-15.5,5]) cube(size = [31,11,10], center=true);
    translate(v = [-15.5,-15.5,0]) cylinder(h = 10, r=5.5, $fn=50);
    translate(v = [-15.5,+15.5,0]) cylinder(h = 10, r=5.5, $fn=50);
    translate(v = [15.5,-15.5,0]) cylinder(h = 10, r=5.5, $fn=50);
    translate([-21,7,0]) rotate([0,0,45]) cube([2, 2, 10]);    

    //end stop
    translate(v = [-10.5,+15.5,0]) cylinder(h = 10, r=5.5, $fn=50);
    translate([-12,-15,0]) cube([7, 30, 10]);
    translate([-10,-15,0]) cube([10, 20, 10]);
    translate([-16,16,0]) cube([6, 5, 10]);
    translate([-21+6,8,0]) cube([12-2, 5, 28]);    
    translate([-21,8-5,0]) cube([8, 10, 28]);      
    translate([-21+9.5-2,7,0]) rotate([0,0,45]) cube([2, 2, 28]);    
    // Joins motor holder and rod plate
    translate(v = [-29,-21,0]) cube(size = [14,30,10]);
    }    
        //selective infill
        translate([-14.5,5,0.3]) cube([0.1,5.5,27]);
        translate([-16.5,5,0.3]) cube([0.1,5.5,27]);
        translate([-18.5,5,0.3]) cube([0.1,5.5,25]);
        translate([-10,9,1]) cube([0.1,3,26.3]);
        translate([-8,9,6]) cube([0.1,3,21.3]);
    }
}
}
     // Front holding part
     translate(v = [0,10,0]) cylinder(h = 10, r=8, $fn=80);
     translate(v = [0,20,5])cube(size = [16,20,10], center=true);	
     translate(v = [0,30,0])cylinder(h = 10, r=8, $fn=80);
}

module y_motor_holes(){
    translate(v = [29,-21+50,0]){
    // Screw head holes
    translate(v = [-15.5,-15.5,-1]) cylinder(h = 10, r=1.8, $fn=20);
    translate(v = [-15.5,+15.5,-1]) cylinder(h = 10, r=1.8, $fn=20);
    translate(v = [15.5,-15.5,-1]) cylinder(h = 10, r=1.8, $fn=20);
    // Screw holes
    translate(v = [-15.5,-15.5,7]) cylinder(h = 7, r=3.5, $fn=30);
    translate(v = [-15.5,+15.5,7]) cylinder(h = 25, r=3.5, $fn=30);
    translate(v = [15.5,-15.5,7]) cylinder(h = 25, r=3.5, $fn=30);
 }
    translate(v = [0,10,-1]) cylinder(h = 12, r=4.2, $fn=50);	
    translate(v = [0,30,-1]) cylinder(h = 12, r=4.2, $fn=50);
 
    //endstop
    translate([29,29,0])  cylinder(h = 4, r=11, $fn=25); 
    translate([29,29,3.99])  cylinder(h = 4, r1=11, r2=10, $fn=25); 
    translate([29,29,7.98])  cylinder(h = 4, r=10, $fn=25); 
   
    translate([18,45,15]) rotate([90,0,0]) cylinder(h = 10, r=0.8, $fn=20);
    translate([18,42.2,15]) rotate([90,0,0]) cylinder(h = 2, r1=1.2, r2=0.8, $fn=20);
 
    translate([18,45,24.5]) rotate([90,0,0]) cylinder(h = 10, r=0.8, $fn=20);
    translate([18,42.2,24.5]) rotate([90,0,0]) cylinder(h = 2, r1=1.2, r2=0.8, $fn=20);
   
    // endstop corner cutout
    translate([-10,30,28]) rotate([0,45,0]) cube([15, 19, 15]);	
    translate([-1,41,10])  cube([15, 5, 19]);	
    translate([27,33,0]) rotate([0,0,45]) cube([5, 5, 28]);	
    translate([7,28,10.01]) rotate([0,0,45]) cube([5, 5, 28]); 
    
    translate([19,32,0]) rotate([0,30,0]) cube([8, 20, 18]);	
    translate([24.5-2,32,17]) rotate([0,45,0]) cube([2, 20, 2]);	
    
    translate([23-2,32,29]) rotate([0,45,0]) cube([5, 20, 5]);	
}

// Final part
module y_motor(){
    difference()
    {
        y_motor_base();
        y_motor_holes();
    }
}

module dollo_y_motor() {
    
    difference() {
        union() {
            difference() {
                y_motor();
                translate([-10,0,-1]) cube([17.3,50,12]);
                translate([-10,0,-1]) cube([27,8,12]);
            }
            translate([-13.6,-3,0]) cylinder(d=10,h=25,$fn=45);
            translate([-13.6,-3+36,0]) cylinder(d=10,h=25,$fn=45);
            translate([-14.3,-8,0]) cube([28.5,46,25]);
            translate([0,9,0]) cube([20,10,10]);
            translate([7.3,-8,0]) cube([40,17,10]);
            %translate([29,50,-20]) rotate([90,0,0]) mock_stepper_motor();
        }
        translate([-30+5,0,-1]) cube([30,30,30,]);
        translate([20,-30,-1]) rotate([0,0,30]) cube([50,20,12]);
        translate([-15+5,30,0]) male_dovetail();
        translate([-15+5,0,0]) rotate([0,0,180]) male_dovetail();
        translate([5,15,0]) rotate([0,0,-90]) male_dovetail();
    }
}

dollo_y_motor();