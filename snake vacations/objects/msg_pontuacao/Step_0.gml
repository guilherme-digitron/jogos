if (global.morte == 1) {exit}
y += vspd;
time -= 1;

if (time <= 0) {
    instance_destroy();
}
