disp('initialize_output_paprameter');

number_sampled_electric_fields = size(sampled_electric_fields, 2);
number_sampled_magnetic_fields = size(sampled_magnetic_fields, 2);
number_sampled_voltages = size(sampled_voltages, 2);
number_sampled_currents = size(sampled_currents, 2);
number_of_ports = size(ports, 2);

frequency_domain.frequencies = [frequency_domain.start:frequency_domain.step:frequency_domain.end];
frequency_domain.number_frequencies = size(frequency_domain.frequencies, 2);

for i = 1:number_sampled_electric_fields
    sampled_electric_fields(i).i = round((sampled_electric_fields(i).x - fdtd_domain.min_x) / dx) + 1;
    sampled_electric_fields(i).j = round((sampled_electric_fields(i).y - fdtd_domain.min_y) / dy) + 1;
    sampled_electric_fields(i).k = round((sampled_electric_fields(i).z - fdtd_domain.min_z) / dz) + 1;
    sampled_electric_fields(i).sampled_values = zeros(1, number_time_steps);
    sampled_electric_fields(i).time = ([1:number_time_steps]) * dt;
end

for i = 1:number_sampled_magnetic_fields
    sampled_magnetic_fields(i).i = round((sampled_magnetic_fields(i).x - fdtd_domain.min_x) / dx) + 1;
    sampled_magnetic_fields(i).j = round((sampled_magnetic_fields(i).y - fdtd_domain.min_y) / dy) + 1;
    sampled_magnetic_fields(i).k = round((sampled_magnetic_fields(i).z - fdtd_domain.min_z) / dz) + 1;
    sampled_magnetic_fields(i).sampled_values = zeros(1, number_time_steps);
    sampled_magnetic_fields(i).time = ([1:number_time_steps] - 0.5) * dt;
end

for i = 1:number_sampled_voltages
    sampled_voltages(i).is = round((sampled_voltages(i).min_x - fdtd_domain.min_x) / dx) + 1;
    sampled_voltages(i).js = round((sampled_voltages(i).min_y - fdtd_domain.min_y) / dy) + 1;
    sampled_voltages(i).ks = round((sampled_voltages(i).min_z - fdtd_domain.min_z) / dz) + 1;
    sampled_voltages(i).ie = round((sampled_voltages(i).max_x - fdtd_domain.min_x) / dx) + 1;
    sampled_voltages(i).je = round((sampled_voltages(i).max_y - fdtd_domain.min_y) / dy) + 1;
    sampled_voltages(i).ke = round((sampled_voltages(i).max_z - fdtd_domain.min_z) / dz) + 1;
    sampled_voltages(i).sampled_values = zeros(1, number_time_steps);
    sampled_voltages(i).time = ([1:number_time_steps]) * dt;

    i_start = sampled_voltages(i).is;
    j_start = sampled_voltages(i).js;
    k_start = sampled_voltages(i).ks;
    i_end = sampled_voltages(i).ie;
    j_end = sampled_voltages(i).je;
    k_end = sampled_voltages(i).ke;

    switch (sampled_voltages(i).direction(1))
        case 'x'
            fi = create_linear_index_list(Ex, i_start:i_end - 1, j_start:j_end, k_start:k_end);
            sampled_voltages(i).Csvf = -dx / ((j_end - j_start + 1) * (k_end - k_start + 1));
        case 'y'
            fi = create_linear_index_list(Ey, i_start:i_end, j_start:j_end - 1, k_start:k_end);
            sampled_voltages(i).Csvf = -dy / ((i_end - i_start + 1) * (k_end - k_start + 1));
        case 'z'
            fi = create_linear_index_list(Ez, i_start:i_end, j_start:j_end, k_start:k_end - 1);
            sampled_voltages(i).Csvf = -dz / ((j_end - j_start + 1) * (i_end - i_start + 1));
    end

    if strcmp(sampled_voltages(i).direction(2), 'n')
        sampled_voltages(i).Csvf = -1 * sampled_voltages(i).Csvf;
    end

    sampled_voltages(i).field_indices = fi;
end

for i = 1:number_sampled_currents
    sampled_currents(i).is = round((sampled_currents(i).min_x - fdtd_domain.min_x) / dx) + 1;
    sampled_currents(i).js = round((sampled_currents(i).min_y - fdtd_domain.min_y) / dy) + 1;
    sampled_currents(i).ks = round((sampled_currents(i).min_z - fdtd_domain.min_z) / dz) + 1;
    sampled_currents(i).ie = round((sampled_currents(i).max_x - fdtd_domain.min_x) / dx) + 1;
    sampled_currents(i).je = round((sampled_currents(i).max_y - fdtd_domain.min_y) / dy) + 1;
    sampled_currents(i).ke = round((sampled_currents(i).max_z - fdtd_domain.min_z) / dz) + 1;
    sampled_currents(i).sampled_values = zeros(1, number_time_steps);
    sampled_currents(i).time = ([1:number_time_steps] - 0.5) * dt;
end