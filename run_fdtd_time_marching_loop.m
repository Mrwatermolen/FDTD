disp('run_fdtd_time_marching_loop');

start_time = cputime;
current_time = 0;

for time_step = 1:number_time_steps
    update_incident_fields;
    update_magentic_field;
    update_magentic_field_CPML_ABC;
    capture_sampled_magentic_field;
    capture_sampled_currrents;
    update_electric_field;
    update_electric_field_CPML_ABC;
    update_voltage_sources;
    update_current_sources;
    update_inductors;
    update_diodes;
    capture_sampled_eletric_field;
    capture_sampled_voltages;
    calculate_JandM;
    display_sampled_parameters;
end

end_time = cputime;
total_time = (end_time - start_time);
disp(['Total simulation time is ', num2str(total_time), ' seconds.']);