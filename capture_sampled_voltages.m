for i = 1:size(sampled_voltages, 2)
    fi = sampled_voltages(i).field_indices;
    Csvf = sampled_voltages(i).Csvf;
    sampled_value = 0;  

    switch (sampled_voltages(i).direction(1))
        case 'x'
            sampled_value = Csvf * sum(Ex(fi));
        case 'y'
            sampled_value = Csvf * sum(Ey(fi));
        case 'z'
            sampled_value = Csvf * sum(Ez(fi));
    end

    sampled_voltages(i).sampled_values(time_step) = sampled_value;
end