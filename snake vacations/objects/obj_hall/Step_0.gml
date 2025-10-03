if (global.paused) {exit}
if (global.morte == 1) {exit}
image_angle += 2

x += vel

if x > 570 or x < 0 {

	vel = vel * -1

}

