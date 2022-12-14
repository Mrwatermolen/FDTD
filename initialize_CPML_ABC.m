disp('initialize_CPML_ABC');

p_order = boundary.cpml_order;
sigma_ratio = boundary.cpml_sigma_factor;
kappa_max = boundary.cpml_kappa_max;
alpha_min = boundary.cpml_alpha_min;
alpha_max = boundary.cpml_alpha_max;

% x方向
% 
if is_cpml_xn
    sigma_max = sigma_ratio * (p_order + 1) / (150 * pi * dx);
    ncells = n_cpml_xn;
    rho_e = ([ncells:-1:1] - 0.75) / ncells;
    rho_m = ([ncells:-1:1] - 0.25) / ncells;
    sigma_pex_xn = sigma_max * rho_e .^ p_order;
    sigma_pmx_xn = sigma_max * rho_m .^ p_order;
    sigma_pmx_xn = (mu_0 / eps_0) * sigma_pmx_xn;
    kappa_ex_xn = 1 + (kappa_max - 1) * rho_e .^ p_order;
    kappa_mx_xn = 1 + (kappa_max - 1) * rho_m .^ p_order;
    alpha_ex_xn = alpha_min + (alpha_max - alpha_min) * (1 - rho_e);
    alpha_mx_xn = alpha_min + (alpha_max - alpha_min) * (1 - rho_m);
    alpha_mx_xn = (mu_0 / eps_0) * alpha_mx_xn;
    %%%%
    %%%%
    cpml_b_ex_xn = exp((-dt / eps_0) ...
        * ((sigma_pex_xn ./ kappa_ex_xn) + alpha_ex_xn));
    cpml_a_ex_xn = (1 / dx) * (cpml_b_ex_xn - 1.0) .* sigma_pex_xn ...
        ./ (kappa_ex_xn .* (sigma_pex_xn + kappa_ex_xn .* alpha_ex_xn));

    cpml_b_mx_xn = exp((-dt / mu_0) ...
        * ((sigma_pmx_xn ./ kappa_mx_xn) + alpha_mx_xn));
    cpml_a_mx_xn = (1 / dx) * (cpml_b_mx_xn - 1.0) .* sigma_pmx_xn ...
        ./ (kappa_mx_xn .* (sigma_pmx_xn + kappa_mx_xn .* alpha_mx_xn));

    Psi_eyx_xn = zeros(ncells, ny, nz_p1);
    Psi_ezx_xn = zeros(ncells, ny_p1, nz);
    Psi_hyx_xn = zeros(ncells, ny_p1, nz);
    Psi_hzx_xn = zeros(ncells, ny, nz_p1);

    Cpsi_eyx_xn = Ceyhz(2:ncells+1, :, :) * dx;
    Cpsi_ezx_xn = Cezhy(2:ncells+1, :, :) * dx;
    Cpsi_hyx_xn = Chyez(1:ncells, :, :) * dx;
    Cpsi_hzx_xn = Chzey(1:ncells, :, :) * dx;

    for i = 1:ncells
        Ceyhz(i + 1, :, :) = Ceyhz(i + 1, :, :) / kappa_ex_xn(i);
        Cezhy(i + 1, :, :) = Cezhy(i + 1, :, :) / kappa_ex_xn(i);
        Chyez(i, :, :) = Chyez(i, :, :) / kappa_mx_xn(i);
        Chzey(i, :, :) = Chzey(i, :, :) / kappa_mx_xn(i);
    end
end

if is_cpml_xp
    sigma_max = sigma_ratio * (p_order + 1) / (150 * pi * dx);
    ncells = n_cpml_xp;
    rho_e = ([1:ncells] - 0.75) / ncells;
    rho_m = ([1:ncells] - 0.25) / ncells;
    sigma_pex_xp = sigma_max * rho_e.^p_order;
    sigma_pmx_xp = sigma_max * rho_m.^p_order;
    sigma_pmx_xp = (mu_0 / eps_0) * sigma_pmx_xp;
    kappa_ex_xp = 1 + (kappa_max - 1) * rho_e.^p_order;
    kappa_mx_xp = 1 + (kappa_max - 1) * rho_m.^p_order;
    alpha_ex_xp = alpha_min + (alpha_max - alpha_min) * (1 - rho_e);
    alpha_mx_xp = alpha_min + (alpha_max - alpha_min) * (1 - rho_m);
    alpha_mx_xp = (mu_0 / eps_0) * alpha_mx_xp;

    cpml_b_ex_xp = exp((-dt / eps_0) ...
        * ((sigma_pex_xp ./ kappa_ex_xp) + alpha_ex_xp));
    cpml_a_ex_xp = (1 / dx) * (cpml_b_ex_xp - 1.0) .* sigma_pex_xp ...
        ./ (kappa_ex_xp .* (sigma_pex_xp + kappa_ex_xp .* alpha_ex_xp));

    cpml_b_mx_xp = exp((-dt / mu_0) ...
        * ((sigma_pmx_xp ./ kappa_mx_xp) + alpha_mx_xp));
    cpml_a_mx_xp = (1 / dx) * (cpml_b_mx_xp - 1.0) .* sigma_pmx_xp ...
        ./ (kappa_mx_xp .* (sigma_pmx_xp + kappa_mx_xp .* alpha_mx_xp));

    Psi_eyx_xp = zeros(ncells, ny, nz_p1);
    Psi_ezx_xp = zeros(ncells, ny_p1, nz);
    Psi_hyx_xp = zeros(ncells, ny_p1, nz);
    Psi_hzx_xp = zeros(ncells, ny, nz_p1);

    Cpsi_eyx_xp = Ceyhz(nx_p1 - ncells:nx, :, :) * dx;
    Cpsi_ezx_xp = Cezhy(nx_p1 - ncells:nx, :, :) * dx;
    Cpsi_hyx_xp = Chyez(nx_p1 - ncells:nx, :, :) * dx;
    Cpsi_hzx_xp = Chzey(nx_p1 - ncells:nx, :, :) * dx;

    for i = 1:ncells
        Ceyhz(nx - ncells + i, :, :) = Ceyhz(nx - ncells + i, :, :) / kappa_ex_xp(i);
        Cezhy(nx - ncells + i, :, :) = Cezhy(nx - ncells + i, :, :) / kappa_ex_xp(i);
        Chyez(nx - ncells + i, :, :) = Chyez(nx - ncells + i, :, :) / kappa_mx_xp(i);
        Chzey(nx - ncells + i, :, :) = Chzey(nx - ncells + i, :, :) / kappa_mx_xp(i);
    end

end

if is_cpml_yn
    sigma_max = sigma_ratio * (p_order + 1) / (150 * pi * dy);
    ncells = n_cpml_yn;
    rho_e = ([ncells:-1:1] - 0.75) / ncells;
    rho_m = ([ncells:-1:1] - 0.25) / ncells;
    sigma_pey_yn = sigma_max * rho_e.^p_order;
    sigma_pmy_yn = sigma_max * rho_m.^p_order;
    sigma_pmy_yn = (mu_0 / eps_0) * sigma_pmy_yn;
    kappa_ey_yn = 1 + (kappa_max - 1) * rho_e.^p_order;
    kappa_my_yn = 1 + (kappa_max - 1) * rho_m.^p_order;
    alpha_ey_yn = alpha_min + (alpha_max - alpha_min) * (1 - rho_e);
    alpha_my_yn = alpha_min + (alpha_max - alpha_min) * (1 - rho_m);
    alpha_my_yn = (mu_0 / eps_0) * alpha_my_yn;

    cpml_b_ey_yn = exp((-dt / eps_0) ...
        * ((sigma_pey_yn ./ kappa_ey_yn) + alpha_ey_yn));
    cpml_a_ey_yn = (1 / dy) * (cpml_b_ey_yn - 1.0) .* sigma_pey_yn ...
        ./ (kappa_ey_yn .* (sigma_pey_yn + kappa_ey_yn .* alpha_ey_yn));

    cpml_b_my_yn = exp((-dt / mu_0) ...
        * ((sigma_pmy_yn ./ kappa_my_yn) + alpha_my_yn));
    cpml_a_my_yn = (1 / dy) * (cpml_b_my_yn - 1.0) .* sigma_pmy_yn ...
        ./ (kappa_my_yn .* (sigma_pmy_yn + kappa_my_yn .* alpha_my_yn));

    Psi_ezy_yn = zeros(nx_p1, ncells, nz);
    Psi_exy_yn = zeros(nx, ncells, nz_p1);
    Psi_hzy_yn = zeros(nx, ncells, nz_p1);
    Psi_hxy_yn = zeros(nx_p1, ncells, nz);

    Cpsi_ezy_yn = Cezhx(:, 2:ncells + 1, :) * dy;
    Cpsi_exy_yn = Cexhz(:, 2:ncells + 1, :) * dy;
    Cpsi_hzy_yn = Chzex(:, 1:ncells, :) * dy;
    Cpsi_hxy_yn = Chxez(:, 1:ncells, :) * dy;

    for i = 1:ncells
        Cezhx(:, i + 1, :) = Cezhx(:, i + 1, :) / kappa_ey_yn(i);
        Cexhz(:, i + 1, :) = Cexhz(:, i + 1, :) / kappa_ey_yn(i);
        Chzex(:, i, :) = Chzex(:, i, :) / kappa_my_yn(i);
        Chxez(:, i, :) = Chxez(:, i, :) / kappa_my_yn(i);
    end

end


if is_cpml_yp
    sigma_max = sigma_ratio * (p_order + 1) / (150 * pi * dy);
    ncells = n_cpml_yp;
    rho_e = ([1:ncells] - 0.75) / ncells;
    rho_m = ([1:ncells] - 0.25) / ncells;
    sigma_pey_yp = sigma_max * rho_e.^p_order;
    sigma_pmy_yp = sigma_max * rho_m.^p_order;
    sigma_pmy_yp = (mu_0 / eps_0) * sigma_pmy_yp;
    kappa_ey_yp = 1 + (kappa_max - 1) * rho_e.^p_order;
    kappa_my_yp = 1 + (kappa_max - 1) * rho_m.^p_order;
    alpha_ey_yp = alpha_min + (alpha_max - alpha_min) * (1 - rho_e);
    alpha_my_yp = alpha_min + (alpha_max - alpha_min) * (1 - rho_m);
    alpha_mx_yp = (mu_0 / eps_0) * alpha_my_yp;

    cpml_b_ey_yp = exp((-dt / eps_0) ...
        * ((sigma_pey_yp ./ kappa_ey_yp) + alpha_ey_yp));
    cpml_a_ey_yp = (1 / dy) * (cpml_b_ey_yp - 1.0) .* sigma_pey_yp ...
        ./ (kappa_ey_yp .* (sigma_pey_yp + kappa_ey_yp .* alpha_ey_yp));

    cpml_b_my_yp = exp((-dt / mu_0) ...
        * ((sigma_pmy_yp ./ kappa_my_yp) + alpha_my_yp));
    cpml_a_my_yp = (1 / dy) * (cpml_b_my_yp - 1.0) .* sigma_pmy_yp ...
        ./ (kappa_my_yp .* (sigma_pmy_yp + kappa_my_yp .* alpha_my_yp));

    Psi_ezy_yp = zeros(nx_p1, ncells, nz);
    Psi_exy_yp = zeros(nx, ncells, nz_p1);
    Psi_hzy_yp = zeros(nx, ncells, nz_p1);
    Psi_hxy_yp = zeros(nx_p1, ncells, nz);

    Cpsi_ezy_yp = Cezhx(:, ny_p1 - ncells:ny, :) * dy;
    Cpsi_exy_yp = Cexhz(:, ny_p1 - ncells:ny, :) * dy;
    Cpsi_hzy_yp = Chzex(:, ny_p1 - ncells:ny, :) * dy;
    Cpsi_hxy_yp = Chxez(:, ny_p1 - ncells:ny, :) * dy;

    for i = 1:ncells
        Cezhx(:, ny - ncells + i, :) = Cezhx(:, ny - ncells + i, :) / kappa_ey_yp(i);
        Cexhz(:, ny - ncells + i, :) = Cexhz(:, ny - ncells + i, :) / kappa_ey_yp(i);
        Chzex(:, ny - ncells + i, :) = Chzex(:, ny - ncells + i, :) / kappa_my_yp(i);
        Chxez(:, ny - ncells + i, :) = Chxez(:, ny - ncells + i, :) / kappa_my_yp(i);
    end

end

if is_cpml_zn
    sigma_max = sigma_ratio * (p_order + 1) / (150 * pi * dz);
    ncells = n_cpml_zn;
    rho_e = ([ncells:-1:1] - 0.75) / ncells;
    rho_m = ([ncells:-1:1] - 0.25) / ncells;
    sigma_pez_zn = sigma_max * rho_e.^p_order;
    sigma_pmz_zn = sigma_max * rho_m.^p_order;
    sigma_pmz_zn = (mu_0 / eps_0) * sigma_pmz_zn;
    kappa_ez_zn = 1 + (kappa_max - 1) * rho_e.^p_order;
    kappa_mz_zn = 1 + (kappa_max - 1) * rho_m.^p_order;
    alpha_ez_zn = alpha_min + (alpha_max - alpha_min) * (1 - rho_e);
    alpha_mz_zn = alpha_min + (alpha_max - alpha_min) * (1 - rho_m);
    alpha_mz_zn = (mu_0 / eps_0) * alpha_mz_zn;

    cpml_b_ez_zn = exp((-dt / eps_0) ...
        * ((sigma_pez_zn ./ kappa_ez_zn) + alpha_ez_zn));
    cpml_a_ez_zn = (1 / dy) * (cpml_b_ez_zn - 1.0) .* sigma_pez_zn ...
        ./ (kappa_ez_zn .* (sigma_pez_zn + kappa_ez_zn .* alpha_ez_zn));

    cpml_b_mz_zn = exp((-dt / mu_0) ...
        * ((sigma_pmz_zn ./ kappa_mz_zn) + alpha_mz_zn));
    cpml_a_mz_zn = (1 / dz) * (cpml_b_mz_zn - 1.0) .* sigma_pmz_zn ...
        ./ (kappa_mz_zn .* (sigma_pmz_zn + kappa_mz_zn .* alpha_mz_zn));

    Psi_exz_zn = zeros(nx, ny_p1, ncells);
    Psi_eyz_zn = zeros(nx_p1, ny, ncells);
    Psi_hxz_zn = zeros(nx_p1, ny, ncells);
    Psi_hyz_zn = zeros(nx, ny_p1, ncells);

    Cpsi_exz_zn = Cexhy(:, :, 2:ncells + 1) * dz;
    Cpsi_eyz_zn = Ceyhx(:, :, 2:ncells + 1) * dz;
    Cpsi_hxz_zn = Chxey(:, :, 1:ncells) * dz;
    Cpsi_hyz_zn = Chyex(:, :, 1:ncells) * dz;

    for i = 1:ncells
        Cexhy(:, :, i + 1) = Cexhy(:, :, i + 1)  / kappa_ez_zn(i);
        Ceyhx(:, :, i + 1) = Ceyhx(:, :, i + 1)  / kappa_ez_zn(i);
        Chxey(:, :, i)  = Chxey(:, :, i)  / kappa_mz_zn(i);
        Chyex(:, :, i)  = Chyex(:, :, i)  / kappa_mz_zn(i);
    end

end

if is_cpml_zp
    sigma_max = sigma_ratio * (p_order + 1) / (150 * pi * dz);
    ncells = n_cpml_zp;
    rho_e = ([1:ncells] - 0.75) / ncells;
    rho_m = ([1:ncells] - 0.25) / ncells;
    sigma_pez_zp = sigma_max * rho_e.^p_order;
    sigma_pmz_zp = sigma_max * rho_m.^p_order;
    sigma_pmz_zp = (mu_0 / eps_0) * sigma_pmz_zp;
    kappa_ez_zp = 1 + (kappa_max - 1) * rho_e.^p_order;
    kappa_mz_zp = 1 + (kappa_max - 1) * rho_m.^p_order;
    alpha_ez_zp = alpha_min + (alpha_max - alpha_min) * (1 - rho_e);
    alpha_mz_zp = alpha_min + (alpha_max - alpha_min) * (1 - rho_m);
    alpha_mz_zp = (mu_0 / eps_0) * alpha_mz_zp;

    cpml_b_ez_zp = exp((-dt / eps_0) ...
        * ((sigma_pez_zp ./ kappa_ez_zp) + alpha_ez_zp));
    cpml_a_ez_zp = (1 / dx) * (cpml_b_ez_zp - 1.0) .* sigma_pez_zp ...
        ./ (kappa_ez_zp .* (sigma_pez_zp + kappa_ez_zp .* alpha_ez_zp));

    cpml_b_mz_zp = exp((-dt / mu_0) ...
        * ((sigma_pmz_zp ./ kappa_mz_zp) + alpha_mz_zp));
    cpml_a_mz_zp = (1 / dz) * (cpml_b_mz_zp - 1.0) .* sigma_pmz_zp ...
        ./ (kappa_mz_zp .* (sigma_pmz_zp + kappa_mz_zp .* alpha_mz_zp));

    Psi_exz_zp = zeros(nx, ny_p1, ncells);
    Psi_eyz_zp = zeros(nx_p1, ny, ncells);
    Psi_hxz_zp = zeros(nx_p1, ny, ncells);
    Psi_hyz_zp = zeros(nx, ny_p1, ncells);

    Cpsi_exz_zp = Cexhy(:, :, nz_p1 - ncells:nz) * dz;
    Cpsi_eyz_zp = Ceyhx(:, :, nz_p1 - ncells:nz) * dz;
    Cpsi_hxz_zp = Chxey(:, :, nz_p1 - ncells:nz) * dz;
    Cpsi_hyz_zp = Chyex(:, :, nz_p1 - ncells:nz) * dz;

    for i = 1:ncells
        Cexhy(:, :, nz - ncells + i) = Cexhy(:, :, nz - ncells + i) / kappa_ez_zp(i);
        Ceyhx(:, :, nz - ncells + i) = Ceyhx(:, :, nz - ncells + i) / kappa_ez_zp(i);
        Chxey(:, :, nz - ncells + i) = Chxey(:, :, nz - ncells + i) / kappa_mz_zp(i);
        Chyex(:, :, nz - ncells + i) = Chyex(:, :, nz - ncells + i) / kappa_mz_zp(i);
    end

end
