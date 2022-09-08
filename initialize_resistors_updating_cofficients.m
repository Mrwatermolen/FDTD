disp('initialize_resistors_updating_cofficients');

for i = 1:number_resistors
    R = resistors(i).resistance_per_component;

    if (R == 0)
        R = 1e-20;
    end

    switch (resistors(i).direction(1))
        case 'x'
            fi = create_linear_index_list(eps_r_x, resistors(i).is:resistors(i).ie - 1, resistors(i).js:resistors(i).je, resistors(i).ks:resistors(i).ke);
            a_term = (dt * dx) / (R * dy * dz);
            Cexe(fi) = (2 * eps_0 * eps_r_x(fi) - dt * sigma_e_x(fi) - a_term) ...
                ./ (2 * eps_0 * eps_r_x(fi) + dt * sigma_e_x(fi) + a_term);
            Cexhz(fi) = (2 * dt / dy) ...
                ./ (2 * eps_r_x(fi) * eps_0 + dt * sigma_e_x(fi) + a_term);
            Cexhy(fi) = -(2 * dt / dz) ...
                ./ (2 * eps_r_x(fi) * eps_0 + dt * sigma_e_x(fi) + a_term);
        case 'y'
            fi = create_linear_index_list(eps_r_y, resistors(i).is:resistors(i).ie, resistors(i).js:resistors(i).je - 1, resistors(i).ks:resistors(i).ke);
            a_term = (dt * dy) / (R * dx * dz);
            Ceye(fi) = (2 * eps_0 * eps_r_y(fi) - dt * sigma_e_y(fi) - a_term) ...
                ./ (2 * eps_0 * eps_r_y(fi) + dt * sigma_e_y(fi) + a_term);
            Ceyhx(fi) = (2 * dt / dz) ...
                ./ (2 * eps_r_y(fi) * eps_0 + dt * sigma_e_y(fi) + a_term);
            Ceyhz(fi) = -(2 * dt / dx) ...
                ./ (2 * eps_r_y(fi) * eps_0 + dt * sigma_e_y(fi) + a_term);
        case 'z'
            fi = create_linear_index_list(eps_r_z, resistors(i).is:resistors(i).ie, resistors(i).js:resistors(i).je, resistors(i).ks:resistors(i).ke - 1);
            a_term = (dt * dz) / (R * dx * dy);
            Ceze(fi) = (2 * eps_0 * eps_r_z(fi) - dt * sigma_e_z(fi) - a_term) ...
                ./ (2 * eps_0 * eps_r_z(fi) + dt * sigma_e_z(fi) + a_term);
            Cezhy(fi) = (2 * dt / dx) ...
                ./ (2 * eps_r_z(fi) * eps_0 + dt * sigma_e_z(fi) + a_term);
            Cezhx(fi) = -(2 * dt / dy) ...
                ./ (2 * eps_r_z(fi) * eps_0 + dt * sigma_e_z(fi) + a_term);
    end

    resistors(i).field_indices = fi;
end
