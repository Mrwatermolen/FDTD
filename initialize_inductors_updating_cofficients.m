disp('initialize_inductors_updating_cofficients');

for i = 1:number_inductors
    L = inductors(i).inductance_per_component;

    switch (inductors(i).direction(1))
        case 'x'
            fi = create_linear_index_list(eps_r_x, inductors(i).is:inductors(i).ie - 1, inductors(i).js:inductors(i).je, inductors(i).ks:inductors(i).ke);
            inductors(i).Cexj = -(2 * dt) ...
                ./ (2 * eps_0 * eps_r_x(fi) + dt * sigma_e_x(fi));
            inductors(i).Jix = zeros(size(fi));
            inductors(i).Cjex = (dt * dx) / (L * dy * dz);
        case 'y'
            fi = create_linear_index_list(eps_r_y, inductors(i).is:inductors(i).ie, inductors(i).js:inductors(i).je - 1, inductors(i).ks:inductors(i).ke);
            inductors(i).Ceyj = -(2 * dt) ...
                ./ (2 * eps_0 * eps_r_y(fi) + dt * sigma_e_y(fi));
            inductors(i).Jiy = zeros(size(fi));
            inductors(i).Cjey = (dt * dy) / (L * dx * dz);
        case 'z'
            fi = create_linear_index_list(eps_r_z, inductors(i).is:inductors(i).ie, inductors(i).js:inductors(i).je, inductors(i).ks:inductors(i).ke - 1);
            inductors(i).Cezj = -(2 * dt) ...
                ./ (2 * eps_0 * eps_r_z(fi) + dt * sigma_e_z(fi));
            inductors(i).Jiz = zeros(size(fi));
            inductors(i).Cjez = (dt * dz) / (L * dx * dy);
    end

    inductors(i).field_indices = fi;
end
