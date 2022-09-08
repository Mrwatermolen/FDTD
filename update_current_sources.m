for i = 1:number_current_sources
    fi = current_sources(i).field_indices;

    switch (current_sources(i).direction)
        case 'x'
            Ex(fi) = Ex(fi) + current_sources(i).Cexs ...
                * current_sources(i).current_per_e_field(time_step);
        case 'y'
            Ey(fi) = Ey(fi) + current_sources(i).Ceys ...
                * current_sources(i).current_per_e_field(time_step);
        case 'z'
            Ez(fi) = Ez(fi) + current_sources(i).Cezs ...
                * current_sources(i).current_per_e_field(time_step);
    end

end
