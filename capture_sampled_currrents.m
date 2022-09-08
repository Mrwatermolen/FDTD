for i = 1:size(sampled_currents, 2)
    sampled_value = 0;
    i_start = sampled_currents(i).is;
    j_start = sampled_currents(i).js;
    k_start = sampled_currents(i).ks;
    i_end = sampled_currents(i).ie;
    j_end = sampled_currents(i).je;
    k_end = sampled_currents(i).ke;

    switch (sampled_currents(i).direction(1))
        case 'x'
            sampled_value = dy * sum(sum(sum(Hy(i_end - 1, j_start:j_end, k_start - 1)))) ...
                + dz * sum(sum(sum(Hz(i_end - 1, j_end, k_start:k_end)))) ...
                - dy * sum(sum(sum(Hy(i_end - 1, j_start:j_end, k_end)))) ...
                - dz * sum(sum(sum(Hz(i_end - 1, j_start - 1, k_start:k_end))));
        case 'y'
            sampled_value = dz * sum(sum(sum(Hz(i_start - 1, j_end - 1, k_start:k_end)))) ...
                + dx * sum(sum(sum(Hx(i_start:i_end, j_end - 1, k_end)))) ...
                - dz * sum(sum(sum(Hz(i_end, j_end - 1, k_start:k_end)))) ...
                - dx * sum(sum(sum(Hx(i_start:i_end, j_end - 1, k_start - 1))));
        case 'z'
            sampled_value = dx * sum(sum(sum(Hx(i_start:i_end, j_start - 1, k_end - 1)))) ...
                + dy * sum(sum(sum(Hy(i_start:i_end, j_start:j_end, k_end - 1)))) ...
                - dx * sum(sum(sum(Hx(i_start:i_end, j_end, k_end - 1)))) ...
                - dy * sum(sum(sum(Hy(i_start - 1, j_start:j_end, k_end - 1))));
    end

    if strcmp(sampled_currents(i).direction(2), 'n')
        sampled_value = -1 * sampled_value;
    end

    sampled_currents(i).sampled_values(time_step) = sampled_value;
end