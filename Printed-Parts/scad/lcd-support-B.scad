// PRUSA iteration3
// lcd-support-B
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <lcd-support-A.scad>;

module _B_additions() {
    rotate([0,0,45]) difference(){
        translate( [ -3 , 3 , 10 ] )  cube( [ 2 , 55 , 10 ] ); 
        translate( [ -4 , 3 , 20 ] ) rotate([0,90,0]) cylinder( h = 4, r = 7, $fn=30); 
        translate( [ -4 , 58 , 20 ] ) rotate([0,90,0]) cylinder( h = 4, r = 7, $fn=30); 
    }
}

//SD card cover
module lcd_support_B() {
    union() {
        lcd_support_A();
        _B_additions();
    }
}

module dollo_lcd_support_B(contrast_trimmer=false) {
    module _doit() {
        union() {
            mirror([1,0,0]) dollo_lcd_support_A();
            _B_additions();
        }
    }
    
    if (contrast_trimmer) {
        difference() {
            union() {
                _doit();
                translate([-35,20,0]) rotate([0,0,45]) cube([10,10,10]);
            }
            translate([-35,24,-0.1]) rotate([0,0,45]) cube([8,8,12.1]);
        }
    } else {
        _doit();
    }
}

//lcd_support_B();
dollo_lcd_support_B(contrast_trimmer=false);
//dollo_lcd_support_B(contrast_trimmer=true);