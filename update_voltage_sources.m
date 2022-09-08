for i = 1:number_voltage_sources
    fi = voltage_sources(i).field_indices;

    switch (voltage_sources(i).direction(1))
        case 'x'
            Ex(fi) = Ex(fi) + voltage_sources(i).Cexs ...
                * voltage_sources(i).voltage_per_e_feild(time_step);
        case 'y'
            Ey(fi) = Ey(fi) + voltage_sources(i).Ceys ...
                * voltage_sources(i).voltage_per_e_feild(time_step);
        case 'z'
            Ez(fi) = Ez(fi) + voltage_sources(i).Cezs ...
                * voltage_sources(i).voltage_per_e_feild(time_step);
    end

end
