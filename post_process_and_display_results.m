disp('post_process_and_display_results');

display_transient_parameter;
calculate_frequency_domain_output;
display_frequency_domain_output;

if number_of_farfield_frequencies == 0
    return;
end

% calculate_radiated_power;
calculate_incident_plane_wave_power;

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

calculate_and_display_farfields;

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