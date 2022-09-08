disp('initialize_updating_coeffients');

% General eletric field updating coefficients
% Ex
Cexe = (2 * eps_r_x * eps_0 - dt * sigma_e_x) ./ (2 * eps_r_x * eps_0 + dt * sigma_e_x);
Cexhz = (2 * dt / dy) ./ (2 * eps_r_x * eps_0 + dt * sigma_e_x);
Cexhy = -(2 * dt / dz) ./ (2 * eps_r_x * eps_0 + dt * sigma_e_x);

% Ey
Ceye = (2 * eps_r_y * eps_0 - dt * sigma_e_y) ./ (2 * eps_r_y * eps_0 + dt * sigma_e_y);
Ceyhx = (2 * dt / dz) ./ (2 * eps_r_y * eps_0 + dt * sigma_e_y);
Ceyhz = -(2 * dt / dx) ./ (2 * eps_r_y * eps_0 + dt * sigma_e_y);

% Ez
Ceze = (2 * eps_r_z * eps_0 - dt * sigma_e_z) ./ (2 * eps_r_z * eps_0 + dt * sigma_e_z);
Cezhy = (2 * dt / dx) ./ (2 * eps_r_z * eps_0 + dt * sigma_e_z);
Cezhx =- (2 * dt / dy) ./ (2 * eps_r_z * eps_0 + dt * sigma_e_z);

% Hx
Chxh = (2 * mu_r_x * mu_0 - dt * sigma_m_x) ./ (2 * mu_r_x * mu_0 + dt * sigma_m_x);
Chxez = -(2 * dt / dy) ./ (2 * mu_r_x * mu_0 + dt * sigma_m_x);
Chxey = (2 * dt / dz) ./ (2 * mu_r_x * mu_0 + dt * sigma_m_x);

% Hy
Chyh = (2 * mu_r_y * mu_0 - dt * sigma_m_y) ./ (2 * mu_r_y * mu_0 + dt * sigma_m_y);
Chyex = -(2 * dt / dz) ./ (2 * mu_r_y * mu_0 + dt * sigma_m_y);
Chyez = (2 * dt / dx) ./ (2 * mu_r_y * mu_0 + dt * sigma_m_y);

% Hz
Chzh = (2 * mu_r_z * mu_0 - dt * sigma_m_z) ./ (2 * mu_r_z * mu_0 + dt * sigma_m_z);
Chzey = -(2 * dt / dx) ./ (2 * mu_r_z * mu_0 + dt * sigma_m_z);
Chzex = (2 * dt / dy) ./ (2 * mu_r_z * mu_0 + dt * sigma_m_z);

% initialize_
initialize_voltage_sources_updating_cofficients; % ok
initialize_current_sources_updating_cofficients; % ok
initialize_resistors_updating_cofficients; % ok
initialize_inductors_updating_cofficients; % ok
initialize_capacitors_updating_cofficients; % ok
initialize_diodes_updating_cofficients; % ok
