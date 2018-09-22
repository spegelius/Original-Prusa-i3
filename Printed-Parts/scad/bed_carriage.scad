use <../../AluParts/alu-frame.scad>;
use <mockups.scad>;
use <../../Dollo/NEW_long_ties/include.scad>;
include <../../Dollo/NEW_long_ties/globals.scad>;

module original_bed() {
    translate([0,220,6.3]) rotate([180,0,0]) bed_carriage();

    color("black") {
        bolt_holes(d=1,h=1);
        translate([25,75,0]) cube([10,10,10],center=true);
        bearing_holes();
    }
}


module bolt_holes(d=bolt_hole_dia,h=10) {
    $fn=20;
    translate([5.5,5.5,0]) cylinder(d=d,h=h);
    translate([5.5,220-5.5,0]) cylinder(d=d,h=h);
    translate([220-5.5,5.5,0]) cylinder(d=d,h=h);
    translate([220-5.5,220-5.5,0]) cylinder(d=d,h=h);

    translate([15,75,0]) cylinder(d=d,h=h);
    translate([15,220-75,0]) cylinder(d=d,h=h);
    translate([35,75,0]) cylinder(d=d,h=h);
    translate([35,220-75,0]) cylinder(d=d,h=h);

    translate([220-15,220/2,0]) cylinder(d=d,h=h);
    translate([220-35,220/2,0]) cylinder(d=d,h=h);

    translate([220/2,220-89,0]) cylinder(d=d,h=h);
    translate([220/2,90,0]) cylinder(d=d,h=h);
}

module bearing_holes() {
    side = sqrt(2*5*5);
    module hole() {
        hull() {
            translate([0,0,-5]) rotate([0,45,0]) cube([side,24.2,side],center=true);
            translate([0,0,5]) rotate([0,45,0]) cube([side,24.2,side],center=true);
        }
    }

    top = 12;
    bottom = -5;

    translate([25,75,top]) hole();
    translate([25,75,bottom]) hole();

    translate([25,220-75,top]) hole();
    translate([25,220-75,bottom]) hole();

    translate([220-25,220/2,top]) hole();
    translate([220-25,220/2,bottom]) hole();
}

module bed_carriage() {
    module arm_coutout() {
        _bed_arm_body();
        translate([-20,bed_arm_hole_pos,0]) rotate([0,90,0]) cylinder(d=bolt_hole_dia,h=40,$fn=20);
        translate([-18.2,bed_arm_hole_pos,0]) rotate([0,-90,0]) nut(3);
        translate([18,bed_arm_hole_pos,0]) rotate([0,90,0]) cylinder(d=bolt_head_hole_dia,h=80,$fn=20);
    }

    difference() {
        intersection() {
            translate([0,10,0]) cube([220,200,7]);
            translate([220/2,220/2,9/2]) rotate([0,0,45]) cube([285,285,10],center=true);
        }
        translate([0,0,-0.1]) bolt_holes();
        bearing_holes();

        translate([40,180,0]) sphere(d=3,$fn=10);

        translate([65,220/2,-0.1]) cylinder(d=50,h=10);
        translate([220-70,220/2,-0.1]) cylinder(d=45,h=10);

        translate([220-50,60,-0.1]) cylinder(d=20,h=10);
        translate([220-50,220-60,-0.1]) cylinder(d=20,h=10);

        translate([50,60,-0.1]) cylinder(d=20,h=10);
        translate([50,220-60,-0.1]) cylinder(d=20,h=10);

        translate([220/2,0,0]) hull() {
            translate([0,221]) cube([161,2,20],center=true);
            translate([0,156]) cube([31,2,20],center=true);
        }

        translate([220/2,0,0]) hull() {
            translate([0,-1]) cube([161,1,20],center=true);
            translate([0,65]) cube([31,1,20],center=true);
        }

        translate([-12,175,0]) rotate([0,0,45]) cube([40,40,20],center=true);
        translate([-12,45,0]) rotate([0,0,45]) cube([40,40,20],center=true);

        translate([5+220,167,0]) rotate([0,0,45]) cube([40,40,20],center=true);
        translate([5+220,53,0]) rotate([0,0,45]) cube([40,40,20],center=true);

        translate([0,220/2,0]) cube([20,120,20],center=true);
        translate([220,220/2,0]) cube([20,110,20],center=true);

        translate([5.5,220-5.5,7/2]) rotate([0,0,45]) arm_coutout();
        translate([5.5,5.5,7/2]) rotate([0,0,135]) arm_coutout();
        translate([220-5.5,5.5,7/2]) rotate([0,0,225]) arm_coutout();
        translate([220-5.5,220-5.5,7/2]) rotate([0,0,-45]) arm_coutout();
    }

    translate([50,25,0]) cube([120,10,7]);
    translate([50,220-25-10,0]) cube([120,10,7]);

//    translate([-80.6,83.5,-58.92]) rotate([90,0,0])
//    {
//        import("../../../_downloaded/Prusa/LM8UU_Clip_V2_CompleteSet_ScrewFromTopOnly(2).stl");
//        translate([105.65,71.4,7.5]) mock_LM8UU();
//    }
}

bed_arm_l = 40;
bed_arm_hole_pos = -bed_arm_l/2-10;

module _bed_arm_body(length=bed_arm_l) {
    side = sqrt(2*3.51*3.51); 
    hull() {
        cylinder(d=10,h=7,center=true);
        translate([-7,-length/2-5,0]) rotate([0,45,0]) cube([side,length,side], center=true);
        translate([7,-length/2-5,0]) rotate([0,45,0]) cube([side,length,side], center=true);
        translate([0,-length-5-7/2+1/2,0]) cube([14,1,.2],center=true);
    }
}

module bed_carriage_arm() {
    difference() {
        _bed_arm_body(bed_arm_l-0.2);
        translate([0,0,-0.1]) cylinder(d=bolt_hole_dia,h=10,center=true,$fn=20);
        translate([0,0,7]) cylinder(d=bolt_head_hole_dia,h=10,center=true,$fn=20);
        //translate([0,-bed_arm_l,0]) cube([2,21,10],center=true);
        translate([-20,bed_arm_hole_pos,0]) rotate([0,90,0]) cylinder(d=bolt_hole_dia,h=60,$fn=20);
    }
}

module bed_carriage_washer() {
    difference() {
        cylinder(d=10+slop,h=6,$fn=6);
        translate([0,0,2]) cylinder(d=6+slop,h=6,$fn=6);
        translate([0,0,-0.1]) cylinder(d=bolt_hole_dia,h=5,$fn=20);
    }
}

translate([-220/2,-220/2,0]) bed_carriage();
//translate([-220/2+5.5,-220/2+220-5.5,7/2]) rotate([0,0,45]) bed_carriage_arm();

//bed_carriage_arm();
//bed_carriage_washer();
