disp('define_output_parameters');

sampled_electric_fields = [];
sampled_magnetic_fields = [];
sampled_voltages = [];
sampled_currents = [];

% 取样频率
plotting_step = 100;

% frequency domain parameters
frequency_domain.start = 2e7;
frequency_domain.end = 8e9;
frequency_domain.step = 2e7;

% sampled_electric_fields(1).x = 30 * dx;
% sampled_electric_fields(1).y = 13 * dy;
% sampled_electric_fields(1).z = 10 * dz;
% sampled_electric_fields(1).component = 'x';
% sampled_electric_fields(1).display_plot = false;
% 
% sampled_magnetic_fields(1).x = 30 * dx;
% sampled_magnetic_fields(1).y = 13 * dy;
% sampled_magnetic_fields(1).z = 10 * dz;
% sampled_magnetic_fields(1).component = 'm'; % mangitude
% sampled_magnetic_fields(1).display_plot = false;

sampled_voltages(1).mix_x = 4e-3;
sampled_voltages(1).mix_y = 0;
sampled_voltages(1).mix_z = 0;
sampled_voltages(1).max_x = 5.8e-3;
sampled_voltages(1).max_y = 0.4e-3;
sampled_voltages(1).max_z = 1e-3;
sampled_voltages(1).direction = 'zp';
sampled_voltages(1).display_plot = false;

sampled_voltages(2).mix_x = 4.8e-3;
sampled_voltages(2).mix_y = 17.6e-3;
sampled_voltages(2).mix_z = 0;
sampled_voltages(2).max_x = 5.2e-3;
sampled_voltages(2).max_y = 18e-3;
sampled_voltages(2).max_z = 1e-3;
sampled_voltages(2).direction = 'zp';
sampled_voltages(2).display_plot = false;

sampled_currents(1).mix_x = 4e-3;
sampled_currents(1).mix_y = 0;
sampled_currents(1).mix_z = 0.4e-3;
sampled_currents(1).max_x = 5.8e-3;
sampled_currents(1).max_y = 0.4e-3;
sampled_currents(1).max_z = 0.6e-3;
sampled_currents(1).direction = 'zp';
sampled_currents(1).display_plot = false;

sampled_currents(2).mix_x = 4e-3;
sampled_currents(2).mix_y = 17.6e-3;
sampled_currents(2).mix_z = 0.4e-3;
sampled_currents(2).max_x = 5.2e-3;
sampled_currents(2).max_y = 18e-3;
sampled_currents(2).max_z = 0.6e-3;
sampled_currents(2).direction = 'zp';
sampled_currents(2).display_plot = false;

ports(1).sampled_voltage_index = 1;
ports(1).sampled_current_index = 1;
ports(1).impedancc = 50;
ports(1).is_source_port = true;

ports(2).sampled_voltage_index = 2;
ports(2).sampled_current_index = 2;
ports(2).impedancc = 100;
ports(2).is_source_port = false;

problem_space_display.labels = true;
problem_space_display.axis_at_origin = false;
problem_space_display.axis_outside_domain = true;
problem_space_display.grid_xn = false;
problem_space_display.grid_xp = true;
problem_space_display.grid_yn = false;
problem_space_display.grid_yp = true;
problem_space_display.grid_zn = true;
problem_space_display.grid_zp = false;
problem_space_display.outer_boundaries = true;
problem_space_display.cpml_boundaries = true;
