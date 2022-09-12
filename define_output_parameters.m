disp('define_output_parameters');

sampled_electric_fields = [];
sampled_magnetic_fields = [];
sampled_voltages = [];
sampled_currents = [];
ports = [];

% 取样频率
plotting_step = 100;

% frequency domain parameters
frequency_domain.start = 20e6;
frequency_domain.end = 10e9;
frequency_domain.step = 20e6;

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

sampled_voltages(1).mix_x = -15 * dx;
sampled_voltages(1).mix_y = -25 * dy;
sampled_voltages(1).mix_z = 0;
sampled_voltages(1).max_x = -9 * dx;
sampled_voltages(1).max_y = -25 * dy;
sampled_voltages(1).max_z = 3 * dz;
sampled_voltages(1).direction = 'zp';
sampled_voltages(1).display_plot = false;

sampled_voltages(2).mix_x = 9 * dx;
sampled_voltages(2).mix_y = -25 * dy;
sampled_voltages(2).mix_z = 0;
sampled_voltages(2).max_x = 15 * dx;
sampled_voltages(2).max_y = -25 * dy;
sampled_voltages(2).max_z = 3 * dz;
sampled_voltages(2).direction = 'zp';
sampled_voltages(2).display_plot = false;

sampled_voltages(3).mix_x = 9 * dx;
sampled_voltages(3).mix_y = 25 * dy;
sampled_voltages(3).mix_z = 0;
sampled_voltages(3).max_x = 15 * dx;
sampled_voltages(3).max_y = 25 * dy;
sampled_voltages(3).max_z = 3 * dz;
sampled_voltages(3).direction = 'zp';
sampled_voltages(3).display_plot = false;

sampled_voltages(4).mix_x = -15 * dx;
sampled_voltages(4).mix_y = 25 * dy;
sampled_voltages(4).mix_z = 0;
sampled_voltages(4).max_x = -9 * dx;
sampled_voltages(4).max_y = 25 * dy;
sampled_voltages(4).max_z = 3 * dz;
sampled_voltages(4).direction = 'zp';
sampled_voltages(4).display_plot = false;

sampled_currents(1).mix_x = -15 * dx;
sampled_currents(1).mix_y = -25 * dy;
sampled_currents(1).mix_z = 2 * dz;
sampled_currents(1).max_x = -9 * dx;
sampled_currents(1).max_y = -25 * dy;
sampled_currents(1).max_z = 2 * dz;
sampled_currents(1).direction = 'zp';
sampled_currents(1).display_plot = false;

sampled_currents(2).mix_x = 9 * dx;
sampled_currents(2).mix_y = -25 * dy;
sampled_currents(2).mix_z = 2 * dz;
sampled_currents(2).max_x = 15 * dx;
sampled_currents(2).max_y = -25 * dy;
sampled_currents(2).max_z = 2 * dz;
sampled_currents(2).direction = 'zp';
sampled_currents(2).display_plot = false;

sampled_currents(3).mix_x = 9 * dx;
sampled_currents(3).mix_y = 25 * dy;
sampled_currents(3).mix_z = 2 * dz;
sampled_currents(3).max_x = 15 * dx;
sampled_currents(3).max_y = 25 * dy;
sampled_currents(3).max_z = 2 * dz;
sampled_currents(3).direction = 'zp';
sampled_currents(3).display_plot = false;

sampled_currents(4).mix_x = -15 * dx;
sampled_currents(4).mix_y = 25 * dy;
sampled_currents(4).mix_z = 2 * dz;
sampled_currents(4).max_x = -9 * dx;
sampled_currents(4).max_y = 25 * dy;
sampled_currents(4).max_z = 2 * dz;
sampled_currents(4).direction = 'zp';
sampled_currents(4).display_plot = false;

ports(1).sampled_voltage_index = 1;
ports(1).sampled_current_index = 1;
ports(1).impedancc = 50;
ports(1).is_source_port = true;

ports(2).sampled_voltage_index = 2;
ports(2).sampled_current_index = 2;
ports(2).impedancc = 50;
ports(2).is_source_port = false;

ports(3).sampled_voltage_index = 3;
ports(3).sampled_current_index = 3;
ports(3).impedancc = 50;
ports(3).is_source_port = false;

ports(4).sampled_voltage_index = 4;
ports(4).sampled_current_index = 4;
ports(4).impedancc = 50;
ports(4).is_source_port = false;

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
