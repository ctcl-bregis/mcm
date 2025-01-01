// MediaCow Micro - CTCL 2021-2025
// Purpose: Parametric case generation for MediaCow Micro devices
// Created: January 1, 2025
// Modified: January 1, 2025

// Units: mm

/* [Hidden] */
disps = [
    [
        "CFAF240320J0-028TN", 
        50, // Module Width
        69.2, // Module Length
        43.2, // Active Area Width
        57.6, // Active Area Length
        4.55 // Module Thickness
    ]
];

function selector(item) = disps[search([item], disps)[0]];

/* [Configuration] */
disp = "CFAF240320J0-028TN"; // [CFAF240320J0-028TN]
dispdata = selector(disp);

draw_mode = "dispmount"; // [dispmount, dispcover, base, assembled, exploded]

// Display Mount Configuration

// Width of walls around display cutout
dispmount_walls = 3; // [1:15]
// Height of the display mount base
dispmount_base = 2; // [1:5]

// Base configuration

// Width of outer walls
base_walls = 2;
// Width of inner walls that the display mount rests on
base_inner_walls = 2;

module dispcover() {
    
}

module dispmount() {
    difference() {
        // Base
        cube([dispdata[1] + (dispmount_walls * 2), dispdata[2] + (dispmount_walls * 2), dispdata[5] + dispmount_base]);
        // Display
        translate([dispmount_walls, dispmount_walls, dispmount_base]) {
            cube([dispdata[1], dispdata[2], dispdata[5] + 0.1]);
        }
    }

}

module base() {
    
}

if (draw_mode == "dispmount") {
    dispmount();
} else if  (draw_mode == "dispcover") {
    dispcover();
} else if (draw_mode == "base") {
    base();
} else if (draw_mode == "assembled") {

} else if (draw_mode == "exploded") {

} else {
    echo("No mode selected");
}
