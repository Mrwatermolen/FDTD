disp('initialize_capacitors_updating_cofficients');

for i = 1:number_capacitors
    C = capacitors(i).capacitance_per_component;

    switch (capacitors(i).direction(1))
        case 'x'
            fi = create_linear_index_list(eps_r_x, capacitors(i).is:capacitors(i).ie - 1, capacitors(i).js:capacitors(i).je, capacitors(i).ks:capacitors(i).ke);
            a_term = (2 * C * dx) / (dy * dz);
            Cexe(fi) = (2 * eps_0 * eps_r_x(fi) - dt * sigma_e_x(fi) + a_term) ...
                ./ (2 * eps_0 * eps_r_x(fi) + dt * sigma_e_x(fi) + a_term);
            Cexhz(fi) = (2 * dt / dy) ...
                ./ (2 * eps_r_x(fi) * eps_0 + dt * sigma_e_x(fi) + a_term);
            Cexhy(fi) = -(2 * dt / dz) ...
                ./ (2 * eps_r_x(fi) * eps_0 + dt * sigma_e_x(fi) + a_term);
        case 'y'
            fi = create_linear_index_list(eps_r_y, capacitors(i).is:capacitors(i).ie, capacitors(i).js:capacitors(i).je - 1, capacitors(i).ks:capacitors(i).ke);
            a_term = (2 * C * dy) / (dx * dz);
            Ceye(fi) = (2 * eps_0 * eps_r_y(fi) - dt * sigma_e_y(fi) + a_term) ...
                ./ (2 * eps_0 * eps_r_y(fi) + dt * sigma_e_y(fi) + a_term);
            Ceyhx(fi) = (2 * dt / dz) ...
                ./ (2 * eps_r_y(fi) * eps_0 + dt * sigma_e_y(fi) + a_term);
            Ceyhz(fi) = -(2 * dt / dx) ...
                ./ (2 * eps_r_y(fi) * eps_0 + dt * sigma_e_y(fi) + a_term);
        case 'z'
            fi = create_linear_index_list(eps_r_z, capacitors(i).is:capacitors(i).ie, capacitors(i).js:capacitors(i).je, capacitors(i).ks:capacitors(i).ke - 1);
            a_term = (2 * C * dz) / (R * dx * dy);
            Ceze(fi) = (2 * eps_0 * eps_r_z(fi) - dt * sigma_e_z(fi) + a_term) ...
                ./ (2 * eps_0 * eps_r_z(fi) + dt * sigma_e_z(fi) + a_term);
            Cezhy(fi) = (2 * dt / dx) ...
                ./ (2 * eps_r_z(fi) * eps_0 + dt * sigma_e_z(fi) + a_term);
            Cezhx(fi) = -(2 * dt / dy) ...
                ./ (2 * eps_r_z(fi) * eps_0 + dt * sigma_e_z(fi) + a_term);
    end

    inductors(i).field_indices = fi;
end
