disp('calculate_frequency_domain_output');

frequency_array = frequency_domain.frequencies;

for i = 1:size(sampled_electric_fields, 2)
    x = sampled_electric_fields(i).sampled_values;
    time_shift = 0;
    [X] = time_to_frequency_domain(x, dt, frequency_array, time_shift);
    sampled_electric_fields(i).frequency_domain_value = X;
    sampled_electric_fields(i).frequencies = frequency_array;
end

for i = 1:size(sampled_magnetic_fields, 2)
    x = sampled_magnetic_fields(i).sampled_values;
    time_shift = - dt / 2;
    [X] = time_to_frequency_domain(x, dt, frequency_array, time_shift);
    sampled_magnetic_fields(i).frequency_domain_value = X;
    sampled_magnetic_fields(i).frequencies = frequency_array;
end

for i = 1:size(sampled_voltages, 2)
    x = sampled_voltages(i).sampled_values;
    time_shift = 0;
    [X] = time_to_frequency_domain(x, dt, frequency_array, time_shift);
    sampled_voltages(i).frequency_domain_value = X;
    sampled_voltages(i).frequencies = frequency_array;
end

for i = 1:size(sampled_currents, 2)
    x = sampled_currents(i).sampled_values;
    time_shift = 0;
    [X] = time_to_frequency_domain(x, dt, frequency_array, time_shift);
    sampled_currents(i).frequency_domain_value = X;
    sampled_currents(i).frequencies = frequency_array;
end

for i = 1:number_of_ports
    svi = ports(i).sampled_voltage_index;
    sci = ports(i).sampled_current_index;
    Z = ports(i).impedancc;
    V = sampled_voltages(svi).frequency_domain_value;
    I = sampled_currents(sci).frequency_domain_value;
    ports(i).a = 0.5 * (V + Z .* I) ./ sqrt(real(Z));
    ports(i).b = 0.5 * (V - conj(Z) .* I) ./ sqrt(real(Z));
    ports(i).frequencies = frequency_array;
end

for i = 1:number_of_ports
    if ports(i).is_source_port
        for j = 1:number_of_ports
            ports(i).S(j).values = ports(j).b ./ ports(i).a;
        end
    end
end