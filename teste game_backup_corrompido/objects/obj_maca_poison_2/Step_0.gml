if (global.paused) {exit}
if (global.morte == 1) {exit}
if !(time == 0)
{
    time -= 1;
}
if time <= 0{

	explode_particles(x, y, 10)
	pos_random();
	time = 180

}