BASE_LENGTH = 1800;
BASE_SUPPORT_LENGHT = 600;
ARM_LENGTH = 1200;
ARM_SUPPORT_LENGTH = 800;

WOOD_HEIGHT = 80;
WOOD_WIDTH = 50;


use <boxes.scad>;

module wood_bar(height, width, length) {
	translate(v=[length/2, width/2,height/2]) {
		roundedBox([length,width,height], 10, false);
	}
}


module frame_side() {
	/* base */
	translate(v=[-BASE_LENGTH/2,0,0]) {
		wood_bar(WOOD_HEIGHT, WOOD_WIDTH, BASE_LENGTH);
	}

	
	translate(v=[BASE_LENGTH/2 -250,0,-100]) {
		rotate(a=[0,-50,0]) {
			wood_bar(WOOD_HEIGHT, WOOD_WIDTH, ARM_LENGTH);
		}
	}

	translate(v=[BASE_LENGTH / 2 -525,0, 15]) {
		rotate(a=[0,-30,0]) {
			wood_bar(WOOD_HEIGHT, WOOD_WIDTH, ARM_SUPPORT_LENGTH);
		}
	}

	translate(v=[-BASE_LENGTH/2 + 250,WOOD_WIDTH,-100]) {
		rotate(a=[0,-50,180]) {
			wood_bar(WOOD_HEIGHT, WOOD_WIDTH, ARM_LENGTH);
		}
	}

	translate(v=[-BASE_LENGTH / 2 + 525,WOOD_WIDTH, 15]) {
		rotate(a=[0,-30,180]) {
			wood_bar(WOOD_HEIGHT, WOOD_WIDTH, ARM_SUPPORT_LENGTH);
		}
	}
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