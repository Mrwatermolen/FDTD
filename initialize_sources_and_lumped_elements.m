disp('initialize_sources_and_lumped_elements');

number_voltage_sources = size(voltage_sources, 2);
number_current_sources = size(current_sources, 2);
number_resistors = size(resistors, 2);
number_inductors = size(inductors, 2);
number_capacitors = size(capacitors, 2);
number_diodes = size(diodes, 2);

initialize_waveforms

% voltage sources
for i = 1:number_voltage_sources
    voltage_sources(i).is = round((voltage_sources(i).min_x - fdtd_domain.min_x) / dx + 1);
    voltage_sources(i).js = round((voltage_sources(i).min_y - fdtd_domain.min_y) / dy + 1);
    voltage_sources(i).ks = round((voltage_sources(i).min_z - fdtd_domain.min_z) / dz + 1);
    voltage_sources(i).ie = round((voltage_sources(i).max_x - fdtd_domain.min_x) / dx + 1);
    voltage_sources(i).je = round((voltage_sources(i).max_y - fdtd_domain.min_y) / dy + 1);
    voltage_sources(i).ke = round((voltage_sources(i).max_z - fdtd_domain.min_z) / dz + 1);
    i_start = voltage_sources(i).is;
    j_start = voltage_sources(i).js;
    k_start = voltage_sources(i).ks;
    i_end = voltage_sources(i).ie;
    j_end = voltage_sources(i).je;
    k_end = voltage_sources(i).ke;

    switch (voltage_sources(i).direction(1))
        case 'x'
            n_fields = i_end - i_start;
            r_mangitude_factor = (1 + j_end - j_start) * (1 + k_end - k_start) / (i_end - i_start);
        case 'y'
            n_fields = j_end - j_start;
            r_mangitude_factor = (1 + i_end - i_start) * (1 + k_end - k_start) / (j_end - j_start);
        case 'z'
            n_fields = k_end - k_start;
            r_mangitude_factor = (1 + i_end - i_start) * (1 + j_end - j_start) / (k_end - k_start);
    end

    if strcmp(voltage_sources(i).direction(2), 'n')
        v_mangitude_factor =- 1 * voltage_sources(i).mangitude / n_fields;
    else
        v_mangitude_factor = 1 * voltage_sources(i).mangitude / n_fields;
    end

    voltage_sources(i).resistance_per_component = r_mangitude_factor * voltage_sources(i).resistance;

    wt_str = voltage_sources(i).waveform_type;
    wi_str = num2str(voltage_sources(i).waveform_index);
    eval_str = ['a_waveform = waveforms.' wt_str '(' wi_str ').waveform;'];
    eval(eval_str);
    voltage_sources(i).voltage_per_e_feild = v_mangitude_factor * a_waveform;
    voltage_sources(i).waveform = v_mangitude_factor * a_waveform * n_fields;
end

% current sources
% r_mangitude_factor is same as voltage
for i = 1:number_current_sources
    current_sources(i).is = round((current_sources(i).min_x - fdtd_domain.min_x) / dx) + 1;
    current_sources(i).js = round((current_sources(i).min_y - fdtd_domain.min_y) / dy) + 1;
    current_sources(i).ks = round((current_sources(i).min_z - fdtd_domain.min_z) / dz) + 1;
    current_sources(i).ie = round((current_sources(i).max_x - fdtd_domain.min_x) / dx) + 1;
    current_sources(i).je = round((current_sources(i).max_y - fdtd_domain.min_y) / dy) + 1;
    current_sources(i).ke = round((current_sources(i).max_z - fdtd_domain.min_z) / dz) + 1;
    i_start = current_sources(i).is;
    j_start = current_sources(i).js;
    k_start = current_sources(i).ks;
    i_end = current_sources(i).ie;
    j_end = current_sources(i).je;
    k_end = current_sources(i).ke;

    switch (current_sources(i).direction(1))
        case 'x'
            n_fields = (1 + j_end - j_start) * (1 + k_end - k_start);
            r_mangitude_factor = (1 + j_end - j_start) * (1 + k_end - k_start) / (i_end - i_start);
        case 'y'
            n_fields = (1 + i_end - i_start) * (1 + k_end - k_start);
            r_mangitude_factor = (1 + i_end - i_start) * (1 + k_end - k_start) / (j_end - j_start);
        case 'z'
            n_fields = (1 + i_end - i_start) * (1 + j_end - j_start);
            r_mangitude_factor = (1 + i_end - i_start) * (1 + j_end - j_start) / (k_end - k_start);
    end

    if strcmp(current_sources(i).direction(2), 'n')
        i_mangitude_factor =- 1 * current_sources(i).mangitude / n_fields;
    else
        i_mangitude_factor = 1 * current_sources(i).mangitude / n_fields;
    end

    current_sources(i).resistance_per_component = r_mangitude_factor * current_sources(i).resistance;

    wt_str = current_sources(i).waveform_type;
    wi_str = num2str(current_sources(i).waveform_index);
    eval_str = ['a_waveform = waveforms.' wt_str '(' wi_str ').waveform;'];
    eval(eval_str);
    current_sources(i).current_per_e_feild = i_mangitude_factor * a_waveform;
    current_sources(i).waveform = i_mangitude_factor * a_waveform * n_fields;
end

% resistors
for i = 1:number_resistors
    resistors(i).is = round((resistors(i).min_x - fdtd_domain.min_x) / dx) + 1;
    resistors(i).js = round((resistors(i).min_y - fdtd_domain.min_y) / dy) + 1;
    resistors(i).ks = round((resistors(i).min_z - fdtd_domain.min_z) / dz) + 1;
    resistors(i).ie = round((resistors(i).max_x - fdtd_domain.min_x) / dx) + 1;
    resistors(i).je = round((resistors(i).max_y - fdtd_domain.min_y) / dy) + 1;
    resistors(i).ke = round((resistors(i).max_z - fdtd_domain.min_z) / dz) + 1;
    i_start = resistors(i).is;
    j_start = resistors(i).js;
    k_start = resistors(i).ks;
    i_end = resistors(i).ie;
    j_end = resistors(i).je;
    k_end = resistors(i).ke;

    switch (resistors(i).direction(1))
        case 'x'
            r_mangitude_factor = (1 + j_end - j_start) * (1 + k_end - k_start) / (i_end - i_start);
        case 'y'
            r_mangitude_factor = (1 + i_end - i_start) * (1 + k_end - k_start) / (j_end - j_start);
        case 'z'
            r_mangitude_factor = (1 + i_end - i_start) * (1 + j_end - j_start) / (k_end - k_start);
    end

    resistors(i).resistance_per_component = r_mangitude_factor * resistors(i).resistance;
end

% inductors
for i = 1:number_inductors
    inductors(i).is = round((inductors(i).min_x - fdtd_domain.min_x) / dx) + 1;
    inductors(i).js = round((inductors(i).min_y - fdtd_domain.min_y) / dy) + 1;
    inductors(i).ks = round((inductors(i).min_z - fdtd_domain.min_z) / dz) + 1;
    inductors(i).ie = round((inductors(i).max_x - fdtd_domain.min_x) / dx) + 1;
    inductors(i).je = round((inductors(i).max_y - fdtd_domain.min_y) / dy) + 1;
    inductors(i).ke = round((inductors(i).max_z - fdtd_domain.min_z) / dz) + 1;
    i_start = inductors(i).is;
    j_start = inductors(i).js;
    k_start = inductors(i).ks;
    i_end = inductors(i).ie;
    j_end = inductors(i).je;
    k_end = inductors(i).ke;

    switch (inductors(i).direction(1))
        case 'x'
            l_mangitude_factor = (1 + j_end - j_start) * (1 + k_end - k_start) / (i_end - i_start);
        case 'y'
            l_mangitude_factor = (1 + i_end - i_start) * (1 + k_end - k_start) / (j_end - j_start);
        case 'z'
            l_mangitude_factor = (1 + i_end - i_start) * (1 + j_end - j_start) / (k_end - k_start);
    end

    inductors(i).inductance_per_component = l_mangitude_factor * inductors(i).inductance;
end

% capacitors
for i = 1:number_capacitors
    capacitors(i).is = round((capacitors(i).min_x - fdtd_domain.min_x) / dx) + 1;
    capacitors(i).js = round((capacitors(i).min_y - fdtd_domain.min_y) / dy) + 1;
    capacitors(i).ks = round((capacitors(i).min_z - fdtd_domain.min_z) / dz) + 1;
    capacitors(i).ie = round((capacitors(i).max_x - fdtd_domain.min_x) / dx) + 1;
    capacitors(i).je = round((capacitors(i).max_y - fdtd_domain.min_y) / dy) + 1;
    capacitors(i).ke = round((capacitors(i).max_z - fdtd_domain.min_z) / dz) + 1;
    i_start = capacitors(i).is;
    j_start = capacitors(i).js;
    k_start = capacitors(i).ks;
    i_end = capacitors(i).ie;
    j_end = capacitors(i).je;
    k_end = capacitors(i).ke;

    switch (capacitors(i).direction(1))
        case 'x'
            c_mangitude_factor = (i_end - i_start) / ((1 + j_end - j_start) * (1 + k_end - k_start));
        case 'y'
            c_mangitude_factor = (j_end - j_start) / ((1 + i_end - i_start) * (1 + k_end - k_start));
        case 'z'
            c_mangitude_factor = (k_end - k_start) / ((1 + i_end - i_start) * (1 + j_end - j_start));
    end

    capacitors(i).capacitance_per_component = c_mangitude_factor * capacitors(i).capacitance;
end

sigma_pec = material_type(material_pec_index).sigma_e; % get sigma_e of pec from define_problem_space_parameters.m

% doides
% doides is a plate ?
for i = 1:number_diodes
    diodes(i).is = round((diodes(i).min_x - fdtd_domain.min_x) / dx) + 1;
    diodes(i).js = round((diodes(i).min_y - fdtd_domain.min_y) / dy) + 1;
    diodes(i).ks = round((diodes(i).min_z - fdtd_domain.min_z) / dz) + 1;
    diodes(i).ie = round((diodes(i).max_x - fdtd_domain.min_x) / dx) + 1;
    diodes(i).je = round((diodes(i).max_y - fdtd_domain.min_y) / dy) + 1;
    diodes(i).ke = round((diodes(i).max_z - fdtd_domain.min_z) / dz) + 1;

    % set sigma
    switch (diodes(i).direction(1))
        case 'x'
            sigma_e_x(diodes(i).is + 1:diodes(i).ie - 1, diodes(i).js, diodes(i).ks) = sigma_pec;
        case 'y'
            sigma_e_y(diodes(i).is, diodes(i).js + 1:diodes(i).je - 1, diodes(i).ks) = sigma_pec;
        case 'z'
            sigma_e_z(diodes(i).is, diodes(i).js, diodes(i).ks + 1:diodes(i).ke - 1) = sigma_pec;
    end

end
