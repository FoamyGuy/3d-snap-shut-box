$fn = 54;

/***********
 * Modules *
 ***********/
module lid_slides(l, w, h){
    difference(){
        translate([l/2 - 2, 0, h/2 - 2.5])cube([2, w, 5], center=true);
        translate([l/2-3,w/2, h/2-2])rotate([90, 0,0])cylinder(h=w, d=3);
    }
    
    
    difference(){
        translate([-l/2 + 2, 0, h/2 - 2.5])cube([2, w, 5], center=true);
        translate([-l/2+3,w/2, h/2-2])rotate([90, 0,0])cylinder(h=w, d=3);
    }
    difference(){
        translate([-l/2+2,0, h/2-6])cube([2, w, 2], center=true);
        translate([-l/2+3,w/2, h/2-7])rotate([90, 0,0])cylinder(h=w, d=4);
    
    }
    difference(){
        translate([l/2-2,0, h/2-6])cube([2, w, 2], center=true);
        translate([l/2-3,w/2, h/2-7])rotate([90, 0,0])cylinder(h=w, d=4);
    
    }
    // snap closed tabs
    translate([-l/2+1.5,-w/4, h/2-2])scale(v=[.8,1,1])sphere(d=3);
    translate([l/2-1.5,-w/4, h/2-2])scale(v=[.8,1,1])sphere(d=3);
}

module box_bottom(l, w, h, wall_thickness=1){
    difference(){
        cube([l,w,h], center=true);
        translate([0,0,wall_thickness])cube([l-wall_thickness,w-wall_thickness,h], center=true);
        translate([0, w/2, h/2-2])cube([l-2, wall_thickness + .1, 4], center=true);
        
        //window to see in.
        //translate([0, w/2, h/2-2])cube([l-2, wall_thickness + .1, 34], center=true);
        
        translate([0,-w/2 + wall_thickness, h/2 + 2])rotate([90, 0,0])cylinder(h=3, d=14);
    }
    lid_slides(l, w, h);
    

}


module lid(l, w, h, wall_thickness=1){
    difference(){
        union(){
            translate([0,0,h/2 +2 ])cube([l-6.5,w-2,wall_thickness], center=true);
            translate([-l/2+3.25,w/2-1, h/2+2])rotate([90, 0,0])cylinder(h=w-2, d=wall_thickness);
            translate([l/2-3.25,w/2-1, h/2+2])rotate([90, 0,0])cylinder(h=w-2, d=wall_thickness);
            
            
        }
        
        //snap close taper 
        translate([l/2-1.75,-w/4 - 4, h/2+2])rotate([0, 0,-5])cube([2.2,w/2, 2], center=true);
        translate([-l/2+1.75,-w/4 - 4, h/2+2])rotate([0, 0,5])cube([2.2,w/2, 2], center=true);
        
        //snap closed tabs
        translate([l/2-2,-w/4, h/2+1])cylinder(d=3, h=2);
        translate([-l/2+2,-w/4, h/2+1])cylinder(d=3, h=2);
    }
}


/***********
 *  Render *
 ***********/

lid(30,36, 20, wall_thickness=2);

//box_bottom(30, 36, 20, wall_thickness=2);

//lid(40, 56, 20, wall_thickness=2);
//box_bottom(40, 56, 20, wall_thickness=2);