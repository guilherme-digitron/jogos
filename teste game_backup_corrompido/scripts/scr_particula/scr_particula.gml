/// explode_particles(x, y, quantidade)
function explode_particles(x, y, quantidade) {
    for (var i = 0; i < quantidade; i++) {
        instance_create_layer(x, y, "Instances", obj_particle);
    }
}
