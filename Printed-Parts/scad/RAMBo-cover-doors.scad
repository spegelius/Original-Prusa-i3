// PRUSA iteration3
// RAMBo doors
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <../../Dollo/NEW_long_ties/include.scad>;
use <mockups.scad>;

module body() {
    // side panels
    cube( [ 105.5 , 87.5 , 1 ] );  
    cube( [ 105.5 , 2 , 20 ] );  
    cube( [ 2 , 87.5 , 20 ] );   

    // corner reinforcement
    translate( [ 98 , 1 , 0 ] ) cube( [ 7.5 , 5 , 20 ] );   
    translate( [ 0.5 , 0.5 , 0 ] ) cube( [ 5 , 6.5 , 20 ] );  
    translate( [ 1 , 0 , 0 ] ) cube( [ 10 , 87.5 , 6 ] );   
    translate( [ 99.5 , 0 , 0 ] ) cube( [ 6 , 87.5 , 7 ] ); 
    translate( [ 10 , 0 , 0 ] ) cube( [ 6 , 5 , 6 ] );   

    // screw thread body
    translate( [ 54 , 2 , 0 ] ) cube( [ 9.5 , 6 , 20 ] ); 

    // rounded side
    translate( [ 0 , 87.5 , 4.5 ] ) rotate([0,90,0]) cylinder( h = 105.5, r = 4.5, $fn=30);

    // upper hinge reinforcement
    translate( [ 0.5 , 69 , -9 ] ) rotate([20,0,0]) cube( [ 26 , 20 , 10 ] ); 
    
    // door closing
    translate( [ 4 , 3.5 , 16.8 ] ) rotate([0,0,0]) cylinder( h = 3.2, r1 = 1.8, r2= 3.5, $fn=30);  
    translate( [ 102 , 3.5 , 16.8 ] ) rotate([0,0,0]) cylinder( h = 3.2, r1 = 1.8, r2= 3.5, $fn=30); 
}

fan_position = [56.5, 45];

module ventilation_holes(fan) {

    intersection() {
        union() {
            for ( i = [0 : 9] ){
                translate([46 + (i*5.5),10.5,-1]) cube([3.65,19+50,1.2]);
                translate([46 + (i*5.5),10.5,-1]) cube([3.65,19,10]);
                translate([46 + (i*5.5),10.5+25,-1]) cube([3.65,19,10]);
                translate([46 + (i*5.5),10.5+50,-1]) cube([3.65,19,10]);
            }
            for ( i = [-6 : 0] ){
                translate([46 + (i*5.5),10.5,-1]) cube([3.65,19+50,1.2]);
            }
            for ( i = [-7 : -6] ){
                translate([46 + (i*5.5),20.5,-1]) cube([3.65,19+40,1.2]);
            }
        }
        translate([0,0,-1]) difference() {
            cube([100,100,10]);
            if (fan) {
                translate([fan_position[0],fan_position[1],0]) rounded_cube(44.5,44.5,10,2, center=true);
                translate([fan_position[0]+23.5,fan_position[1]+12.5,0]) cylinder(d=7,h=10,$fn=20);
                translate([fan_position[0]+23.5,fan_position[1]-12.5,0]) cylinder(d=7,h=10,$fn=20);
            }
        }
    }
}

module cutouts(fan) {
    // door closing screw
    translate( [ 58.5 , 4 , 5 ] ) cylinder( h = 17, r = 1.8, $fn=30);  
    translate( [ 58.5 , 4 , 18.5 ] ) cylinder( h = 2.6, r1 = 1.8, r2=2.2, $fn=30); 
    translate( [ 58.5 , 4 ,15.5] ){
    translate( [ 0 , 0 , 2.5 ] ) cube([5.7,3.8,1], center=true);
    translate( [ 0 , 0 , 3 ] ) cube([3.8,3.8,1], center=true);}

    ventilation_holes(fan);
    
    // rounded side cutoff    
    translate( [ 26.5 , 87.5 , 4.5 ] ) rotate([0,90,0]) cylinder( h = 73, r = 3.5, $fn=30);   
    translate([ 26.5 ,80,5]) cube([73,19,10]); 
    translate([ 26.5 ,82.5,1]) cube([73,5,10]); 
    
    // upper hinge cut
    translate( [ 0 , 60 , -10 ] ) cube( [ 30 , 30 , 10 ] );  
    translate( [ -1 , 87.5 , 0 ] ) cube( [ 22.5 , 10 , 10 ] ); 

    // upper hinge 
    translate( [2 , 80, 6] ) cube( [ 19.5, 10 , 10 ] );       
    translate( [-2 , 89.7, 3] ) rotate([70,0,0]) cube( [ 19.5, 10 , 5 ] );     
    translate( [ -5 , 87.5 , 4.5 ] ) rotate([0,90,0]) cylinder( h = 26.5, r = 2.5, $fn=30);  

    // hinge hole
    translate( [ -5 , 87.5 , 4.5 ] ) rotate([0,90,0]) cylinder( h = 120, r = 2.6, $fn=30);  

    // door closing 
    translate( [ 4 , 3.5 , 16.9 ] ) rotate([0,0,0]) cylinder( h = 3.2, r1 = 1.2, r2= 2.8, $fn=30);  
    translate( [ 102 , 3.5 , 16.9 ] ) rotate([0,0,0]) cylinder( h = 3.2, r1 = 1.2, r2= 2.8, $fn=30);  

    // M3 NUT
    translate( [55.65 , 0.5, 16] ) cube( [ 5.7, 10 , 2.2 ] );  

    // side panel lightning slot
    translate( [2 , 10, 3] ) cube( [ 7, 65 , 5 ] );  
    translate( [101 , 10, 3] ) cube( [ 3, 70 , 5 ] );  

    // corners - cut
    translate( [53 , 3, 1] ) rotate([0,0,70]) cube( [ 10, 10 , 50 ] );  
    translate( [61 , 12, 1] ) rotate([0,0,-70]) cube( [ 10, 10 , 50 ] );  
    translate( [16 , 2, 1] ) rotate([0,0,45]) cube( [ 5, 5 , 50 ] );
    
    if (fan) {
        translate([fan_position[0],fan_position[1],0]) rounded_cube(40.5,40.5,10,2, center=true);
        translate([fan_position[0]-23.5,fan_position[1]+12.5,-0.1]) cylinder(d=3.4,h=10,$fn=20);
        translate([fan_position[0]-23.5,fan_position[1]-12.5,-0.1]) cylinder(d=3.4,h=10,$fn=20);
        translate([fan_position[0]+23.5,fan_position[1]+12.5,-0.1]) cylinder(d=3.4,h=10,$fn=20);
        translate([fan_position[0]+23.5,fan_position[1]-12.5,-0.1]) cylinder(d=3.4,h=10,$fn=20);
        %translate([fan_position[0],fan_position[1],-11/2+1/2]) mock_40mm_fan();
        %translate([fan_position[0],fan_position[1],-11/2+1/2-1.4]) fan_shroud();
        %translate([fan_position[0],fan_position[1],11/2+1/2+1.4]) rotate([180,0,0]) fan_shroud();
    }
}

module RAMBo_doors(fan=false) {
    difference() {
        body();
        cutouts(fan);
        // large corner cut
        translate( [0 , -20, -3] ) rotate([0,45,45]) cube( [ 30, 30 , 20 ] );  
    }
}

module fan_shroud() {
    thickness = 1.6;
    difference() {
        union() {
            translate([0,0,thickness/2]) rounded_cube(47,40.5,thickness,2, center=true);
            cylinder(d=44,h=thickness,$fn=40);
           
            h = (11-1)/2 + thickness;
            translate([-23.5,12.5,0]) cylinder(d=6.5,h=h,$fn=20);
            translate([-23.5,-12.5,0]) cylinder(d=6.5,h=h,$fn=20);
            translate([23.5,12.5,0]) cylinder(d=6.5,h=h,$fn=20);
            translate([23.5,-12.5,0]) cylinder(d=6.5,h=h,$fn=20); 
        }
        difference() {
            cylinder(d=39.5,h=thickness*3,$fn=40,center=true);
            cylinder(d=8,h=thickness,$fn=20);
            
            difference() {
                cylinder(d=26,h=thickness*3,$fn=30,center=true);
                cylinder(d=23,h=thickness*3+1,$fn=30,center=true);
            }
            rotate([0,0,45]) cube([1.5,50,thickness*3],center=true);
            rotate([0,0,-45]) cube([1.5,50,thickness*3],center=true);
            
        }
        for(i=[0:3]) {
            rotate([0,0,i*360/4]) translate([32.5/2,32.5/2,0]) cylinder(d=3.5,h=thickness*3,$fn=20,center=true);
        }
        
        translate([-23.5,12.5,-0.1]) cylinder(d=3.4,h=12,$fn=20);
        translate([-23.5,-12.5,-0.1]) cylinder(d=3.4,h=12,$fn=20);
        translate([23.5,12.5,-0.1]) cylinder(d=3.4,h=12,$fn=20);
        translate([23.5,-12.5,-0.1]) cylinder(d=3.4,h=12,$fn=20); 
    }
}

//RAMBo_doors(fan=false);
//RAMBo_doors(fan=true);
fan_shroud();
