$fn=50;

BASE_LENGTH = 1800;
BASE_SUPPORT_LENGHT = 600;
ARM_LENGTH = 1200;
ARM_SUPPORT_LENGTH = 800;

WOOD_HEIGHT = 80;
WOOD_WIDTH = 50;

ROUNDED_EDGE = 10;

module wood_bar(height, width, length) {
	rotate(a=[0,90,0]) {
		translate(v=[-height + ROUNDED_EDGE ,ROUNDED_EDGE,0]) {
			minkowski() {
				cube([height - 2 * ROUNDED_EDGE, width - 2 * ROUNDED_EDGE, length]);
				cylinder(r=ROUNDED_EDGE,h=1);
			}
		} 
	}
}

module frame_side() {
	module base() {
		translate(v=[-BASE_LENGTH/2,0,0]) {
			wood_bar(WOOD_HEIGHT, WOOD_WIDTH, BASE_LENGTH);
		}
	}

	module right_arm() {
		translate(v=[BASE_LENGTH/2 -250,0,-100]) { 
			rotate(a=[0,-50,0]) {
				wood_bar(WOOD_HEIGHT, WOOD_WIDTH, ARM_LENGTH);
			}
		}
	}

	module right_arm_support() {
		translate(v=[BASE_LENGTH / 2 -525,0, 15]) { 
			rotate(a=[0,-30,0]) {
				wood_bar(WOOD_HEIGHT, WOOD_WIDTH, ARM_SUPPORT_LENGTH);
			}
		}
	}
	
	module left_arm() {
		translate(v=[-BASE_LENGTH/2 + 250,WOOD_WIDTH,-100]) {
			rotate(a=[0,-50,180]) {
				wood_bar(WOOD_HEIGHT, WOOD_WIDTH, ARM_LENGTH);
			}
		}
	}	
	
	module left_arm_support() {
		translate(v=[-BASE_LENGTH / 2 + 525,WOOD_WIDTH, 15]) {
			rotate(a=[0,-30,180]) {
				wood_bar(WOOD_HEIGHT, WOOD_WIDTH, ARM_SUPPORT_LENGTH);
			}
		}
	}
	
	base();
	right_arm();
	right_arm_support();
	left_arm();
	left_arm_support();
}

module hamac() {
	translate(v=[0,285,0]) {
		rotate(a=[20,0,0]) {
			frame_side();
		}
	}
	translate(v=[0,-285,0]) {
		rotate(a=[20,0,180]) {
			frame_side();
		}
	}
	translate(v=[BASE_LENGTH / 2 - 280,-BASE_SUPPORT_LENGHT / 2,30]) {
		rotate(a=[0,0,90]) {
			wood_bar(WOOD_HEIGHT, WOOD_WIDTH, BASE_SUPPORT_LENGHT);
		}
	}
	
	translate(v=[-BASE_LENGTH / 2 + 280,-BASE_SUPPORT_LENGHT / 2,30 + WOOD_HEIGHT]) {
		rotate(a=[180,0,90]) {
			wood_bar(WOOD_HEIGHT, WOOD_WIDTH, BASE_SUPPORT_LENGHT);
		}
	}
}

hamac();