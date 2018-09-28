// PRUSA iteration3
// PSU Cover
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

include <../../Dollo/NEW_long_ties/include.scad>;
use <mockups.scad>;

module CubeAdjust(Xdim, Zdim){
    for (x =[6:11.2:Xdim-12]){
        for (z =[6:11.2:Zdim-12]){
            translate([x,-0.2,z]) cube([10,0.4,10]);
        }
    }
}

module nuttrap(){
    rotate([0, 180, 0]) difference() {
        union() {
            translate([-4.25,-7.5,0]) difference() {
                translate([0,0,0]) cube([8.5, 9, 3]);
                rotate([45,0,0]) cube([11.5,5.7,5.7]);
            }
        }
        translate([0,0, -0.2]) rotate([0,0,30]) cylinder(r=3.5,h=15-1.5, $fn=6);
    }
}

module PSU_COVER(width=100, depth=50, left_back_hole=[6,54.7], right_back_hole=[66.3,58]) {
    
    pillar_h = max(left_back_hole[1], right_back_hole[1]) + 6;
    
    difference() {
        union() {
            translate([0,0,-0.46]) cube([width-3,50+15,depth+5.25]); // Base
            translate([left_back_hole[0]-6,0,-3.5]) cube([14-0.5,pillar_h,5.5]); // Back pillar 1
            translate([right_back_hole[0]-6.8,0,-3.5]) cube([14,pillar_h,5.5]); // Back pillar 2
            translate([width-3,0,-0.46]) cube([6,50+15,depth+5.25]); // Base for bracket
            translate([-2,45.4-4.6,19]) cube([2,3,15]); // nipple on the right

            translate([-1.6,0,0]) cube([1.65,65,2]); // Frame skirt 1
            translate([-1.6,0,0]) cube([1.65,30,53.78]); // Frame skirt 2
            translate([-1.6,0,depth+1.32]) cube([1.65,65,2.46]); // Frame skirt 3
        }

        //pretty corners
        translate([-11,-2,-2]) rotate([0,0,-45]) cube([10,10,58]);
        translate([width,-2,-2]) rotate([0,0,-45]) cube([10,10,58]);

        translate([-3,-9,-4.46]) rotate([-45,0,0]) cube([130,10,10]);
        translate([-3,-12,depth+5.78]) rotate([-45,0,0]) cube([130,10,10]);

        p1_l = left_back_hole[0]-6+3;
        p2_l = (right_back_hole[0]-6.8) - (left_back_hole[0]-6+13.5);
        translate([-3,45+15,-4.46]) rotate([-45,0,0]) cube([p1_l,10,10]);
        translate([left_back_hole[0]-6+13.5,45+15,-4.46]) rotate([-45,0,0]) cube([p2_l,10,10]);
        translate([right_back_hole[0]-6.8+14,45+15,-4.46]) rotate([-45,0,0]) cube([130,10,10]);
        
        translate([-3,pillar_h-4,-4.46]) rotate([-45,0,0]) cube([130,10,10]);
        translate([-3,48+15,depth+5.78]) rotate([-45,0,0]) cube([130,10,10]);

        translate([width-3-3+3,70,-2]) rotate([0,0,-45]) cube([10,10,58]);

        translate([width-3,0-10,-20]) rotate([0,-45,-45]) cube([20,20,20]);
        translate([width-3,0-10,depth-4]) rotate([0,-45,-45] )cube([20,20,20]);

        translate([width-3,60,-10]) rotate([-35,-45,-45]) cube([20,20,20]);
        translate([width-3,60,depth+16]) rotate([-55,48,-48]) cube([20,20,20]);

        translate([width-19,-5,depth+18.28]) rotate([0,45,0]) cube([20,90,20]);

        translate([width-19,-5,-13.96]) rotate([0,45,0]) cube([20,90,20]);

        translate([-14,-5,depth+18.28]) rotate([0,45,0]) cube([20,90,20]);

        // main cutout
        translate([3,2,2]) cube([width-8.98,50.02+15,depth+1.02-0.7]);
        // insert cutout
        translate([-3,50-16.4+15,2]) cube([width+2,16.5,depth+0.3]);

        // right bottom cutout
        translate([-3,50-16.4-15.6+15,2])cube([10,100,17]);
        
        // left bottom cutout
        translate([width-13+2,50-16.4-17.6+15+0.9,2]) cube([10,100,depth+0.3]);

        translate([width-13+2,10,2]) rotate([0,0,45]) cube([10*sqrt(2),10*sqrt(2),depth+0.3]);
        translate([width-13+2,2,2]) cube([10,18,depth+0.3]);

        // bottom cutout
        translate([-3,50-16.4-17.6+15+0.9,2]) cube([width+2,100,10]);

        // left back mounthole cutout
        translate([left_back_hole[0],left_back_hole[1],-10]) cylinder(r=2,h=50,$fn=15);
        translate([left_back_hole[0],left_back_hole[1],-3.7]) cylinder(r2=2, r1=3.5,h=1.5,$fn=15);

        // right back mounthole cutout
        translate([right_back_hole[0],right_back_hole[1],-10]) cylinder(r=2,h=50,$fn=15);
        translate([right_back_hole[0],right_back_hole[1],-3.7]) cylinder(r2=2, r1=3.5,h=1.5,$fn=15);

        // Left side bracket screw hole
        translate([width+32,32+26,depth+2-25]) rotate([0,-90,0]) cylinder(r=2.5,h=50,$fn=35);
        translate([width+3.1,32+26,depth+2-25]) rotate([0,-90,0]) cylinder(r2=2.5, r1=4.1,h=3,$fn=15);
        translate([-0.3,0,-1.2]) CubeAdjust(width+4, depth+5.25);

        hull() {
            // left back mounthole cutout
            translate([20,6.5,-10]) cylinder(r=3.5,h=50);
            translate([29,6.5,-10]) cylinder(r=3.5,h=50);
        }
    }
}

// default Prusa socket
module socket_cutout(width, depth) {
    translate([5.5,0,depth-9]) {
        translate([45,2,0]) cube([27.5,31.9,30]); // socket cutout
        translate([45-4.5,2+15.6,0]) cylinder(r=2,h=50, $fn=8); // socket right hole cutout
        translate([45-4.5+37-0.5,2+15.6,0]) cylinder(r=2,h=50, $fn=8); // socket left hole cutout

        translate([1,2,0]) cube([20,14,30]); // switch cutout
    }
}

// https://www.banggood.com/250V-15A-AC-3-in-1-Fuse-Power-Supply-Socket-Connector-Rocker-Switch-p-1145927.html
module all_in_one_socket_cutout(width, depth) {
    cut_side = 7.5;
    
    module form() {
        difference() {
            cube([47.5,27,30], center=true);
            translate([47.5/2,-27/2,0]) rotate([0,0,45]) cube([cut_side,cut_side,35],center=true);
            translate([47.5/2,27/2,0]) rotate([0,0,45]) cube([cut_side,cut_side,35],center=true);
        }
    }
    
    translate([width-40,18,depth-10]) {
        form();
        hull() {
            translate([0,0,-1.7]) scale([1,1.1,1]) form();
            translate([0,1.7,-4.7]) scale([1,1.2,1]) form();
        }
    }
}

//all_in_one_socket_cutout();

module PSU_Y_REINFORCEMENT() {
    difference() {
        union() { // base shape
            translate([ 59.5, 0, -18 ]) cube([ 33, 6, 19 ]);  // reinforcement plate
            translate([ 73.5, 5, -18 ]) cube([ 5, 16, 19 ]);  // vertical_reinforcement    
        }
        union () {   // cutouts
            // corner cuts
            translate([ 87.5, -8, -20 ]) rotate([ 0, 45, 0 ]) cube([ 10, 20, 10 ]);  //corner cut
            translate([ 52.5, -8, -20 ]) rotate([ 0, 45, 0 ]) cube([ 10, 20, 10 ]);  //corner cut
            
            // angled vertical support
            translate([ 68.5, 20, -34 ]) rotate([ 45, 0, 0 ]) cube([ 15, 23, 20 ]);  //vertical reinf cutout
            
            // bottom surface cuts
            translate([ 66.2, -0.2, -5])cube([23.6, 0.4, 5.6]);
            translate([ 68 + 1.8 +2.6, -0.2, -7.7 -5.6])cube([11.2, 0.4, 5.6]);
            
            // hole A
            hull() {
                translate([ 88, 8, -11.5 ]) rotate([ 90, 0, 0]) cylinder( h = 10, r = 1.8, $fn=30 );
                translate([ 88, 8, -9.5 ]) rotate([ 90, 0, 0]) cylinder( h = 10, r = 1.8, $fn=30 );
            }
            
            // hole B
            hull() {
                translate([ 68, 8, -11.5 ]) rotate([ 90, 0, 0 ]) cylinder( h = 10, r = 1.8, $fn=30 );
                translate([ 68, 8, -9.5 ]) rotate([ 90, 0, 0 ]) cylinder( h = 10, r = 1.8, $fn=30 );
            }
        }
    }
}

// default Prusa version
module PSU_cover() {
    w = 98;
    d = 49;
    union() {
        difference() {
            PSU_COVER(w, d, left_back_hole=[6,54.7], right_back_hole=[66.3,58]);
            socket_cutout(w, d);
        }
        PSU_Y_REINFORCEMENT();
        translate([82.5,2+15.6,d+2.6]) nuttrap();
        translate([46,2+15.6,d+2.6]) nuttrap();
    }
    translate([-1.5,38,2.2]) mock_PSU_Prusa();
}

// Chinese 240W S-250-12
module PSU_cover_240W() {
    w = 110;
    d = 50;
    union() {
        difference() {
            PSU_COVER(w, d, left_back_hole=[8.3,99], right_back_hole=[110-16.6,99]);
            all_in_one_socket_cutout(w, d);
        }
        PSU_Y_REINFORCEMENT();
    }
    //translate([-1.5,38,2.2]) mock_PSU_240W();
}

// Chinese 240W S-250-12 for Dollo
module dollo_PSU_cover_240W() {
    w = 110;
    d = 50;
    union() {
        difference() {
            union() {
                PSU_COVER(w, d, left_back_hole=[8.3,99], right_back_hole=[110-16.6,99]);
                translate([-1,0,28.5]) cube([6.5,48.6,12]);
            }
            all_in_one_socket_cutout(w, d);
            translate([-2,-1,34.5]) rotate([-90,-90,0]) male_dovetail(50);
        }
        translate([-20,0,0]) PSU_Y_REINFORCEMENT();
    }
    //translate([-1.5,38,2.2]) mock_PSU_240W();
}

module dollo_PSU_top_harness() {
    difference() {
        union() {
            chamfered_cube_side(46,35,6,3);
            translate([-4.5,17.5,0]) chamfered_cube_side(55,119,6,2);
        }
        translate([8,-7,-0.1]) cube([30,30,7]);
        translate([8.001,8,-0.1]) rotate([0,0,90]) male_dovetail();
        translate([8+30,8,-0.1]) rotate([0,0,-90]) male_dovetail();
        
        translate([-2,23.5,-0.1]) cube([50,110,7]);
    }
}

module dollo_PSU_spacer() {
    difference() {
        chamfered_cube_side(12,8,1.5,1);
        translate([6,0,-0.1]) male_dovetail();
    }
}

//PSU_cover();
//PSU_cover_240W();
//dollo_PSU_cover_240W();
dollo_PSU_top_harness();
//dollo_PSU_spacer();
