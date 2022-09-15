disp("define_problem_space_parameters");

number_time_steps = 10000;

% factor that determines duration of a time step
% wrt CLF limit
% ?
courant_factor = 0.9;

% a factor that determines accuraycy limit of FDTD solution
number_cells_per_wavelength = 20; % 最高频率 f = c / (max(delta_x, delta_y, delta_z) * n_c_p_w)
number_of_cells_per_wavelength = 20;

% cell size
dx = 0.715e-3;
dy = 0.508e-3;
dz = 0.5e-3;

% define boundary stuct
% pec boundary

% boundary.type_xp = 'pec';
% boundary.air_buffer_number_of_cells_xp = 0;
% boundary.type_xn = 'pec';
% boundary.air_buffer_number_of_cells_xn = 0;

boundary.type_xp = 'cpml';
boundary.cpml_number_of_cells_xp = 8;
boundary.air_buffer_number_of_cells_xp = 10;

boundary.type_xn = 'cpml';
boundary.cpml_number_of_cells_xn = 8;
boundary.air_buffer_number_of_cells_xn = 10;

% boundary.type_yp = 'pec';
% boundary.air_buffer_number_of_cells_yp = 0;
% boundary.type_yn = 'pec';
% boundary.air_buffer_number_of_cells_yn = 0;

boundary.type_yp = 'cpml';
boundary.cpml_number_of_cells_yp = 8;
boundary.air_buffer_number_of_cells_yp = 10;

boundary.type_yn = 'cpml';
boundary.cpml_number_of_cells_yn = 8;
boundary.air_buffer_number_of_cells_yn = 10;

% boundary.type_zp = 'pec';
% boundary.air_buffer_number_of_cells_zp = 0;
% boundary.type_zn = 'pec';
% boundary.air_buffer_number_of_cells_zn = 0;

boundary.type_zp = 'cpml';
boundary.cpml_number_of_cells_zp = 8;
boundary.air_buffer_number_of_cells_zp = 10;

boundary.type_zn = 'cpml';
boundary.cpml_number_of_cells_zn = 8;
boundary.air_buffer_number_of_cells_zn = 10;

boundary.cpml_order = 3;
boundary.cpml_sigma_factor = 1.3;
boundary.cpml_kappa_max = 7;
boundary.cpml_alpha_min = 0;
boundary.cpml_alpha_max = 0.05;

% define material
% air
material_type(1).eps_r = 1;
material_type(1).mu_r = 1;
material_type(1).sigma_e = 0;
material_type(1).sigma_m = 0;
material_type(1).color = [1 1 1]; % RGB
% pec
material_type(2).eps_r = 1;
material_type(2).mu_r = 1;
material_type(2).sigma_e = 1e10;
material_type(2).sigma_m = 0;
material_type(2).color = [1 0 0];
% pmc
material_type(3).eps_r = 1;
material_type(3).mu_r = 1;
material_type(3).sigma_e = 0;
material_type(3).sigma_m = 1e10;
material_type(3).color = [0 1 0];
% dielectric A
material_type(4).eps_r = 9.8;
material_type(4).mu_r = 1;
material_type(4).sigma_e = 0;
material_type(4).sigma_m = 0;
material_type(4).color = [0 0 1];

material_air_index = 1;
material_pec_index = 2;
material_pem_index = 3;


% disp("define_problem_space_parameters");
% 
% number_time_steps = 4000;
% 
% % factor that determines duration of a time step
% % wrt CLF limit
% % ?
% courant_factor = 0.9;
% 
% % a factor that determines accuraycy limit of FDTD solution
% number_cells_per_wavelength = 20; % 最高频率 f = c / (max(delta_x, delta_y, delta_z) * n_c_p_w)
% number_of_cells_per_wavelength = 20;
% 
% % cell size
% dx = 0.406e-3;
% dy = 0.406e-3;
% dz = 0.265e-3;
% 
% % define boundary stuct
% % pec boundary
% 
% % boundary.type_xp = 'pec';
% % boundary.air_buffer_number_of_cells_xp = 0;
% % boundary.type_xn = 'pec';
% % boundary.air_buffer_number_of_cells_xn = 0;
% 
% boundary.type_xp = 'cpml';
% boundary.cpml_number_of_cells_xp = 8;
% boundary.air_buffer_number_of_cells_xp = 5;
% boundary.type_xn = 'cpml';
% boundary.cpml_number_of_cells_xn = 8;
% boundary.air_buffer_number_of_cells_xn = 5;
% 
% % boundary.type_yp = 'pec';
% % boundary.air_buffer_number_of_cells_yp = 0;
% % boundary.type_yn = 'pec';
% % boundary.air_buffer_number_of_cells_yn = 0;
% 
% boundary.type_yp = 'cpml';
% boundary.cpml_number_of_cells_yp = 8;
% boundary.air_buffer_number_of_cells_yp = 5;
% boundary.type_yn = 'cpml';
% boundary.cpml_number_of_cells_yn = 8;
% boundary.air_buffer_number_of_cells_yn = 5;
% 
% % boundary.type_zp = 'pec';
% % boundary.air_buffer_number_of_cells_zp = 0;
% % boundary.type_zn = 'pec';
% % boundary.air_buffer_number_of_cells_zn = 0;
% 
% boundary.type_zp = 'cpml';
% boundary.cpml_number_of_cells_zp = 8;
% boundary.air_buffer_number_of_cells_zp = 5;
% boundary.type_zn = 'cpml';
% boundary.cpml_number_of_cells_zn = 8;
% boundary.air_buffer_number_of_cells_zn = 5;
% 
% boundary.cpml_order = 3;
% boundary.cpml_sigma_factor = 1.5;
% boundary.cpml_kappa_max = 7;
% boundary.cpml_alpha_min = 0;
% boundary.cpml_alpha_max = 0.05;
% 
% % define material
% % air
% material_type(1).eps_r = 1;
% material_type(1).mu_r = 1;
% material_type(1).sigma_e = 0;
% material_type(1).sigma_m = 0;
% material_type(1).color = [1 1 1]; % RGB
% % pec
% material_type(2).eps_r = 1;
% material_type(2).mu_r = 1;
% material_type(2).sigma_e = 1e10;
% material_type(2).sigma_m = 0;
% material_type(2).color = [1 0 0];
% % pmc
% material_type(3).eps_r = 1;
% material_type(3).mu_r = 1;
% material_type(3).sigma_e = 0;
% material_type(3).sigma_m = 1e10;
% material_type(3).color = [0 1 0];
% % dielectric A
% material_type(4).eps_r = 2.2;
% material_type(4).mu_r = 1;
% material_type(4).sigma_e = 0;
% material_type(4).sigma_m = 0;
% material_type(4).color = [0 0 1];
% % dielectric B
% material_type(5).eps_r = 1;
% material_type(5).mu_r = 1;
% material_type(5).sigma_e = 1;
% material_type(5).sigma_m = 142130;
% material_type(5).color = [1 1 0];
% 
% material_air_index = 1;
% material_pec_index = 2;
% material_pem_index = 3;