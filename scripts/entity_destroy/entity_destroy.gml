ALIVE = false;
ACTIVE = false;
entity_run_class_scripts("destroy");
ds_clear();
part_emitter_destroy(global.particle_system, draw_particle_emitter);