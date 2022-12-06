disp('define_output_parameters');

sampled_electric_fields = [];
sampled_magnetic_fields = [];
sampled_voltages = [];
sampled_currents = [];
ports = [];
farfield.frequencies = [];

% 取样频率
plotting_step = 20;

% frequency domain parameters
frequency_domain.start = 2e9;
frequency_domain.end = 6e9;
frequency_domain.step = 20e6;

% 远场计算参数
% farfield.frequencies(1) = 3.5e9;
% farfield.frequencies(2) = 4.3e9;
% farfield.number_of_cells_from_outer_boundary = 13; % 外推边界大于吸收边界小于空气缓冲层

sampled_voltages(1).min_x = 0;
sampled_voltages(1).min_y = 12.2e-3;
sampled_voltages(1).min_z = 0;
sampled_voltages(1).max_x = 0;
sampled_voltages(1).max_y = 13.2e-3;
sampled_voltages(1).max_z = 1e-3;
sampled_voltages(1).direction = 'zp';
sampled_voltages(1).display_plot = false;

sampled_currents(1).min_x = 0;
sampled_currents(1).min_y = 12.2e-3;
sampled_currents(1).min_z = 0.5e-3;
sampled_currents(1).max_x = 0;
sampled_currents(1).max_y = 13.2e-3;
sampled_currents(1).max_z = 0.5e-3;
sampled_currents(1).direction = 'zp';
sampled_currents(1).display_plot = false;

ports(1).sampled_voltage_index = 1;
ports(1).sampled_current_index = 1;
ports(1).impedance = 50;
ports(1).is_source_port = true;
