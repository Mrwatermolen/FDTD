disp('initialize_diodes_updating_cofficients');

q = 1.602 * 1e-19;
k = 1.38066e-23;
T = 273 + 27;
I_0 = 1e-14;

for i = 1:number_diodes

    if strcmp(diodes(i).direction(2), 'n')
        sgn = -1;
    else
        sgn = 1;
    end

    switch (diodes(i).direction(1))
        case 'x'
            fi = create_linear_index_list(eps_r_x, diodes(i).is:diodes(i).ie, diodes(i).js:diodes(i).je, diodes(i).ks:diodes(i).ke);
            diodes(i).B = sgn * q * dx / (2 * k * T);
            diodes(i).Cexd = -sgn * (2 * dt * I_0 / (dy * dz)) ...
                * exp(diodes(i).B) ./ (2 * eps_r_x(fi) * eps_0 + dt * sigma_e_x(fi));
            diodes(i).Exn = 0;
        case 'y'
            fi = create_linear_index_list(eps_r_y, diodes(i).is:diodes(i).ie, diodes(i).js:diodes(i).je, diodes(i).ks:diodes(i).ke);
            diodes(i).B = sgn * q * dy / (2 * k * T);
            diodes(i).Ceyd = -sgn * (2 * dt * I_0 / (dx * dz)) ...
                * exp(diodes(i).B) ./ (2 * eps_r_y(fi) * eps_0 + dt * sigma_e_y(fi));
            diodes(i).Eyn = 0;
        case 'z'
            fi = create_linear_index_list(eps_r_z, diodes(i).is:diodes(i).ie, diodes(i).js:diodes(i).je, diodes(i).ks:diodes(i).ke);
            diodes(i).B = sgn * q * dz / (2 * k * T);
            diodes(i).Cezd = -sgn * (2 * dt * I_0 / (dx * dy)) ...
                * exp(diodes(i).B) ./ (2 * eps_r_z(fi) * eps_0 + dt * sigma_e_z(fi));
            diodes(i).Ezn = 0;
    end

    diodes(i).field_indices = fi;
end
