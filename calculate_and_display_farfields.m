disp('calculate_and_display_farfields');

if number_of_farfield_frequencies == 0
    return;
end

if incident_plane_wave.enabled
    calculate_incident_plane_wave_power;
else
    calculate_radiated_power;
end

% 绘图参数
step_size = 10;
Nrings = 4;
line_style1 = "b-";
line_style2 = "r--";
scale_type = 'dB';
% plot_type = 'D';
plot_type = 'RCS';

number_of_angles = 360;

% xy平面
farfield_theta = zeros(number_of_angles, 1);
farfield_theta = farfield_theta + pi / 2;
farfield_phi = (pi / 180) * [-180:1:179].';
const_theta = 90;

calculate_farfields_per_plane;

for i=1:number_of_farfield_frequencies
    f = figure;
    pat1 = farfield.dirTheta(i, :).';
    pat2 = farfield.dirPhi(i, :).';

    pat1 = 10 * log10(pat1);
    pat2 = 10 * log10(pat2);
    max_val = max(max([pat1, pat2]));
    max_val = step_size * ceil(max_val / step_size);
    
    legend_str1 = [plot_type, '_{\theta}, f=', num2str(farfield.frequencies(mi) * 1e-9), 'GHz'];
    legend_str2 = [plot_type, '_{\phi}, f=', num2str(farfield.frequencies(mi) * 1e-9), 'GHz'];

    polar_plot_constant_theta(farfield_phi , pat1 , pat2 , max_val, step_size, Nrings, line_style1, line_style2, const_theta, legend_str1, legend_str2, scale_type);
end

% xz平面
farfield_theta = (pi / 180) * [-180:1:179].';
farfield_phi = zeros(number_of_angles, 1);
const_phi = 0;

calculate_farfields_per_plane;

for i=1:number_of_farfield_frequencies
    f = figure;
    pat1 = farfield.dirTheta(i, :).';
    pat2 = farfield.dirPhi(i, :).';

    pat1 = 10 * log10(pat1);
    pat2 = 10 * log10(pat2);
    max_val = max(max([pat1, pat2]));
    max_val = step_size * ceil(max_val / step_size);
    
    legend_str1 = [plot_type, '_{\theta}, f=', num2str(farfield.frequencies(mi) * 1e-9), 'GHz'];
    legend_str2 = [plot_type, '_{\phi}, f=', num2str(farfield.frequencies(mi) * 1e-9), 'GHz'];

    polar_plot_constant_phi(farfield_phi , pat1 , pat2 , max_val, step_size, Nrings, line_style1, line_style2, const_theta, legend_str1, legend_str2, scale_type);
end

% yz平面
farfield_theta = (pi / 180) * [-180:1:179].';
farfield_phi = zeros(number_of_angles, 1);
farfield_phi = farfield_phi + pi / 2;
const_phi = 90;

calculate_farfields_per_plane;

for i=1:number_of_farfield_frequencies
    f = figure;
    pat1 = farfield.dirTheta(i, :).';
    pat2 = farfield.dirPhi(i, :).';

    pat1 = 10 * log10(pat1);
    pat2 = 10 * log10(pat2);
    max_val = max(max([pat1, pat2]));
    max_val = step_size * ceil(max_val / step_size);
    
    legend_str1 = [plot_type, '_{\theta}, f=', num2str(farfield.frequencies(mi) * 1e-9), 'GHz'];
    legend_str2 = [plot_type, '_{\phi}, f=', num2str(farfield.frequencies(mi) * 1e-9), 'GHz'];

    polar_plot_constant_phi(farfield_phi , pat1 , pat2 , max_val, step_size, Nrings, line_style1, line_style2, const_theta, legend_str1, legend_str2, scale_type);
end

% eta_0 = sqrt(mu_0 / eps_0);
% 
% exp_jk_rpr = zeros(number_of_angles, 1);
% 
% dx_sinth_cosphi = dx * sin(farfield_theta) .* cos(farfield_phi);
% dy_sinth_sinphi = dy * sin(farfield_theta) .* sin(farfield_phi);
% dz_costh = dz * cos(farfield_theta);
% 
% dy_dz_costh_sinphi = dy * dz * cos(farfield_theta) .* sin(farfield_phi);
% dy_dz_sinth = dy * dz * sin(farfield_theta);
% dy_dz_cosphi = dy * dz * cos(farfield_phi);
% dx_dz_costh_cosphi = dx * dz * cos(farfield_theta) .* cos(farfield_phi);
% dx_dz_sinth = dx * dz * sin(farfield_theta);
% dx_dz_sinphi = dx * dz * sin(farfield_phi);
% dx_dy_costh_cosphi = dx * dy * cos(farfield_theta) .* cos(farfield_phi);
% dx_dy_costh_sinphi = dx * dy * cos(farfield_theta) .* sin(farfield_phi);
% dx_dy_sinphi = dx * dy * sin(farfield_phi);
% dx_dy_cosphi = dx * dy * cos(farfield_phi);
% 
% farfield.dirTheta = zeros(number_of_farfield_frequencies, number_of_angles);
% farfield.dir = zeros(number_of_farfield_frequencies, number_of_angles);
% farfield.dirPhi = zeros(number_of_farfield_frequencies, number_of_angles);
% 
% ci = 0.5 * (ui + li);
% cj = 0.5 * (uj + lj);
% ck = 0.5 * (uk + lk);
% 
% for mi = 1:number_of_farfield_frequencies
%     k = 2 * pi * farfield.frequencies(mi) * sqrt(mu_0 * eps_0);
%     Ntheta = zeros(number_of_angles, 1);
%     Ltheta = zeros(number_of_angles, 1);
%     Nphi = zeros(number_of_angles, 1);
%     Lphi = zeros(number_of_angles, 1);
%     rpr = zeros(number_of_angles, 1);
% 
%     for nj = lj:uj - 1
% 
%         for nk = lk:uk - 1
%             % xp
%             rpr = (ui - ci) * dx_sinth_cosphi ...
%                 + (nj - cj + 0.5) * dy_sinth_sinphi ...
%                 + (nk - ck + 0.5) * dz_costh;
%             exp_jk_rpr = exp(-1i * k * rpr);
%             Ntheta = Ntheta ...
%                 + (cjyxp(mi, 1, nj - lj + 1, nk - lk + 1) .* dy_dz_costh_sinphi ...
%                 - cjzxp(mi, 1, nj - lj + 1, nk - lk + 1) .* dy_dz_sinth) .* exp_jk_rpr;
%             Ltheta = Ltheta ...
%                 + (cmyxp(mi, 1, nj - lj + 1, nk - lk + 1) .* dy_dz_costh_sinphi ...
%                 - cmzxp(mi, 1, nj - lj + 1, nk - lk + 1) .* dy_dz_sinth) .* exp_jk_rpr;
%             Nphi = Nphi ...
%                 + (cjyxp(mi, 1, nj - lj + 1, nk - lk + 1) .* dy_dz_cosphi) .* exp_jk_rpr;
%             Lphi = Lphi ...
%                 + (cmyxp(mi, 1, nj - lj + 1, nk - lk + 1) .* dy_dz_cosphi) .* exp_jk_rpr;
%             % xn
%             rpr = (li - ci) * dx_sinth_cosphi ...
%                 + (nj - cj + 0.5) * dy_sinth_sinphi ...
%                 + (nk - ck + 0.5) * dz_costh;
%             exp_jk_rpr = exp(-1i * k * rpr);
%             Ntheta = Ntheta ...
%                 + (cjyxn(mi, 1, nj - lj + 1, nk - lk + 1) .* dy_dz_costh_sinphi ...
%                 - cjzxn(mi, 1, nj - lj + 1, nk - lk + 1) .* dy_dz_sinth) .* exp_jk_rpr;
%             Ltheta = Ltheta ...
%                 + (cmyxn(mi, 1, nj - lj + 1, nk - lk + 1) .* dy_dz_costh_sinphi ...
%                 - cmzxn(mi, 1, nj - lj + 1, nk - lk + 1) .* dy_dz_sinth) .* exp_jk_rpr;
%             Nphi = Nphi ...
%                 + (cjyxn(mi, 1, nj - lj + 1, nk - lk + 1) .* dy_dz_cosphi) .* exp_jk_rpr;
%             Lphi = Lphi ...
%                 + (cmyxn(mi, 1, nj - lj + 1, nk - lk + 1) .* dy_dz_cosphi) .* exp_jk_rpr;
%         end
% 
%     end
% 
%     for ni = li:ui - 1
% 
%         for nk = lk:uk - 1
%             % yp
%             rpr = (ni - ci + 0.5) * dx_sinth_cosphi ...
%                 + (uj - cj) * dy_sinth_sinphi ...
%                 + (nk - ck + 0.5) * dz_costh;
%             exp_jk_rpr = exp(-li * k * rpr);
%             Ntheta = Ntheta ...
%                 + (cjxyp(mi, ni - li + 1, 1, nk - lk + 1) .* dx_dz_costh_cosphi ...
%                 -cjzyp(mi, ni - li + 1, 1, nk - lk + 1) .* dx_dz_sinth) .* exp_jk_rpr;
%             Ltheta = Ltheta ...
%                 + (cmxyp(mi, ni - li + 1, 1, nk - lk + 1) .* dx_dz_costh_cosphi ...
%                 -cmzyp(mi, ni - li + 1, 1, nk - lk + 1) .* dx_dz_sinth) .* exp_jk_rpr;
%             Nphi = Nphi ...
%                 + (-cjxyp(mi, ni - li + 1, 1, nk - lk + 1) .* dx_dz_sinphi) .* exp_jk_rpr;
%             Lphi = Lphi ...
%                 + (-cmxyp(mi, ni - li + 1, 1, nk - lk + 1) .* dx_dz_sinphi) .* exp_jk_rpr;
%             % yn
%             rpr = (ni - ci + 0.5) * dx_sinth_cosphi ...
%                 + (lj - cj) * dy_sinth_sinphi ...
%                 + (nk - ck + 0.5) * dz_costh;
%             exp_jk_rpr = exp(-li * k * rpr);
%             Ntheta = Ntheta ...
%                 + (cjxyn(mi, ni - li + 1, 1, nk - lk + 1) .* dx_dz_costh_cosphi ...
%                 -cjzyn(mi, ni - li + 1, 1, nk - lk + 1) .* dx_dz_sinth) .* exp_jk_rpr;
%             Ltheta = Ltheta ...
%                 + (cmxyn(mi, ni - li + 1, 1, nk - lk + 1) .* dx_dz_costh_cosphi ...
%                 -cmzyn(mi, ni - li + 1, 1, nk - lk + 1) .* dx_dz_sinth) .* exp_jk_rpr;
%             Nphi = Nphi ...
%                 + (-cjxyn(mi, ni - li + 1, 1, nk - lk + 1) .* dx_dz_sinphi) .* exp_jk_rpr;
%             Lphi = Lphi ...
%                 + (-cmxyn(mi, ni - li + 1, 1, nk - lk + 1) .* dx_dz_sinphi) .* exp_jk_rpr;
%         end
% 
%     end
% 
%     for ni = li:ui -1
% 
%         for nj = lj:uj - 1
%             % zp
%             rpr = (ni - ci + 0.5) * dx_sinth_cosphi ...
%                 + (nj - cj + 0.5) * dy_sinth_sinphi ...
%                 + (uk - ck) * dz_costh;
%             exp_jk_rpr = exp(-li * k * rpr);
%             Ntheta = Ntheta ...
%                 + (cjxzp(mi, ni - li + 1, nj - lj + 1, 1) .* dx_dy_costh_cosphi ...
%                 + cjyzp(mi, ni - li + 1, nj - lj + 1, 1) .* dx_dy_costh_sinphi) ...
%                 .* exp_jk_rpr;
%             Ltheta = Ltheta ...
%                 + (cmxzp(mi, ni - li + 1, nj - lj + 1, 1) .* dx_dy_costh_cosphi ...
%                 + cmyzp(mi, ni - li + 1, nj - lj + 1, 1) .* dx_dy_costh_sinphi) ...
%                 .* exp_jk_rpr;
%             Nphi = Nphi + (-cjxzp(mi, ni - li + 1, nj - lj + 1, 1) ...
%                 .* dx_dy_sinphi + cjyzp(mi, ni - li + 1, nj - lj + 1, 1) .* dx_dy_cosphi) ...
%                 .* exp_jk_rpr;
%             Lphi = Lphi + (-cmxzp(mi, ni - li + 1, nj - lj + 1, 1) ...
%                 .* dx_dy_sinphi + cmyzp(mi, ni - li + 1, nj - lj + 1, 1) .* dx_dy_cosphi) ...
%                 .* exp_jk_rpr;
%             % zn
%             rpr = (ni - ci + 0.5) * dx_sinth_cosphi ...
%                 + (nj - cj + 0.5) * dy_sinth_sinphi ...
%                 + (lk - ck) * dz_costh;
%             exp_jk_rpr = exp(-1i * k * rpr);
%             Ntheta = Ntheta ...
%                 + (cjxzn(mi, ni - li + 1, nj - lj + 1, 1) .* dx_dy_costh_cosphi ...
%                 + cjyzn(mi, ni - li + 1, nj - lj + 1, 1) .* dx_dy_costh_sinphi) ...
%                 .* exp_jk_rpr;
%             Ltheta = Ltheta ...
%                 + (cmxzn(mi, ni - li + 1, nj - lj + 1, 1) .* dx_dy_costh_cosphi ...
%                 + cmyzn(mi, ni - li + 1, nj - lj + 1, 1) .* dx_dy_costh_sinphi) ...
%                 .* exp_jk_rpr;
%             Nphi = Nphi + (-cjxzn(mi, ni - li + 1, nj - lj + 1, 1) ...
%                 .* dx_dy_sinphi + cjyzn(mi, ni - li + 1, nj - lj + 1, 1) .* dx_dy_cosphi) ...
%                 .* exp_jk_rpr;
%             Lphi = Lphi + (-cmxzn(mi, ni - li + 1, nj - lj + 1, 1) ...
%                 .* dx_dy_sinphi + cmyzn(mi, ni - li + 1, nj - lj + 1, 1) .* dx_dy_cosphi) ...
%                 .* exp_jk_rpr;
%         end
% 
%     end
% 
%     if incident_plane_wave.enabled
%         farfield.dirTheta(mi, :) = (k^2 ./ (8 * pi * eta_0 * incident_plane_wave.incident_power(mi))) ...
%             .* (abs(Lphi + eta_0 * Ntheta).^2);
%         farfield.dirPhi(mi, :) = (k^2 ./ (8 * pi * eta_0 * incident_plane_wave.incident_power(mi))) ...
%             .* (abs(Ltheta - eta_0 * Nphi).^2);
%     else
%         farfield.dirTheta(mi, :) = (k^2 ./ (8 * pi * eta_0 * radiated_power(mi))) ...
%             .* (abs(Lphi + eta_0 * Ntheta).^2);
%         farfield.dirPhi(mi, :) = (k^2 ./ (8 * pi * eta_0 * radiated_power(mi))) ...
%             .* (abs(Ltheta - eta_0 * Nphi).^2);
%     end
% end
