width = 120;
rod_d=3.1;
spacer_d=13;
spacer_r=spacer_d/2;
bracket_w = 25;
bracket_base_h = 1;


difference(){
    union(){
        translate([0,25,0])import("original-v2.stl", convexity=10);

        // bottom thumb nut interfaces
        translate([-52,-54,0])cylinder(h=5, d=12);
        translate([52,-54,0])cylinder(h=5, d=12);

        // top thumb nut interfaces
        translate([52,-5,0])rotate([0,0,0])linear_extrude(5)spacer_profile();
        translate([-52,-5,0])rotate([0,0,0])linear_extrude(5)spacer_profile();

        // cover for top center hole
        translate([-5,-10,0])cube([10,8,5]);
    }

    union(){
        // top holes
        translate([52,-5,0])linear_extrude(5)spacer_hole(6.1);
        translate([-52,-5,0])linear_extrude(5)spacer_hole(6.1);

        // bottom holes
        translate([-52,-54,0])cylinder(h=5, d=6.1);
        translate([52,-54,0])cylinder(h=5, d=6.1);

        // cutout for top interface
        translate([52,-5,-2.5])cylinder(h=2.5, d=13);
        translate([-52,-5,-2.5])cylinder(h=2.5, d=13);

    }
}
translate([0,0,-20]){
translate([0,50]){
    translate([25,0])
    difference(){
        linear_extrude(25)spacer_profile();
        linear_extrude(25)spacer_hole(3.1);
    }
    
    translate([-25,0])difference(){
        linear_extrude(25)spacer_profile();
        linear_extrude(25)spacer_hole(3.1);
    }
}
translate([0,-30]){
    translate([25,0])
    difference(){
        linear_extrude(25)spacer_profile();
        linear_extrude(25)spacer_hole(3.1);
    }
    
    translate([-25,0])difference(){
        linear_extrude(25)spacer_profile();
        linear_extrude(25)spacer_hole(3.1);
    }
}
}
    
translate([0,75]){
difference(){
    union(){
        translate([0,25,0])import("original-v2.stl", convexity=10);

        // bottom thumb nut interfaces
        translate([-52,-54,0])cylinder(h=5, d=9);
        translate([52,-54,0])cylinder(h=5, d=9);

        // top thumb nut interfaces
        translate([52,-5,0])rotate([0,0,0])linear_extrude(5)spacer_profile();
        translate([-52,-5,0])rotate([0,0,0])linear_extrude(5)spacer_profile();

        // cover for top center hole
        translate([-5,-10,0])cube([10,8,5]);
    }

    union(){
        // top holes
        translate([52,-5,0])linear_extrude(5)spacer_hole(3.1);
        translate([-52,-5,0])linear_extrude(5)spacer_hole(3.1);

        // bottom holes
        translate([-52,-54,0])cylinder(h=5, d=3.1);
        translate([52,-54,0])cylinder(h=5, d=3.1);

        // cutout for top interface
        translate([52,-5,-2.5])cylinder(h=2.5, d=9);
        translate([-52,-5,-2.5])cylinder(h=2.5, d=9);

    }
}
}



module spacer_profile(bbh){
    difference(){
        union(){
            hull(){
                circle(d=spacer_d, $fn=36);
                polygon([[0,0],[-bracket_w/2, -spacer_r],[bracket_w/2,-spacer_r]]);
            }
            translate([-bracket_w/2, -spacer_r-bracket_base_h])square([bracket_w, bracket_base_h]);
        }
    }
}

module spacer_hole(hole_d){
            circle(d=hole_d, $fn=36);
}