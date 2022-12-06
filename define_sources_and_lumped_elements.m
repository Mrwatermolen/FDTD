disp('define_sources_and_lumped_elements');

voltage_sources = [];
current_sources = [];
diodes = [];
resistors = [];
inductors = [];
capacitors = [];
incident_plane_wave = [];

% define source waveform types and parameters
waveforms.sinusoidal(1).frequency = 1e9;
waveforms.sinusoidal(2).frequency = 5e8;
waveforms.unit_step(1).start_time_step = 50;
waveforms.gaussian(1).number_cells_per_wavelength = 0;
waveforms.gaussian(2).number_cells_per_wavelength = 15;
waveforms.derivative_gaussian(1).number_cells_per_wavelength = 20;
waveforms.cosine_modulated_gaussian(1).bandwidth = 4e9;
waveforms.cosine_modulated_gaussian(1).modulation_frequency = 2e9;

% voltage sources
voltage_sources(1).min_x = 0;
voltage_sources(1).min_y = 12.2e-3;
voltage_sources(1).min_z = 0;
voltage_sources(1).max_x = 0;
voltage_sources(1).max_y = 13.2e-3;
voltage_sources(1).max_z = 1e-3;
voltage_sources(1).direction = 'zp';
voltage_sources(1).resistance = 50; % ohms
voltage_sources(1).mangitude = 1; % volts
voltage_sources(1).waveform_type = 'gaussian';
voltage_sources(1).waveform_index = 1;

% % current sources
% current_sources(1).min_x = 30 * dx;
% current_sources(1).min_y = 10 * dy;
% current_sources(1).min_z = 10 * dz;
% current_sources(1).max_x = 36 * dx;
% current_sources(1).max_y = 10 * dy;
% current_sources(1).max_z = 13 * dz;
% current_sources(1).direction = 'xp';
% current_sources(1).resistance = 50; % ohms
% current_sources(1).mangitude = 1; % volts
% current_sources(1).waveform_type = 'unit_step';
% current_sources(1).waveform_index = 1;
% 
% resistors
% resistors(1).min_x = 4.8e-3;
% resistors(1).min_y = 17.6e-3;
% resistors(1).min_z = 0;
% resistors(1).max_x = 5.2e-3;
% resistors(1).max_y = 18e-3;
% resistors(1).max_z = 1e-3;
% resistors(1).direction = 'z';
% resistors(1).resistance = 100; % ohms

% inductors
% inductors(1).min_x = 0;
% inductors(1).min_y = 0;
% inductors(1).min_z = 1e-3;
% inductors(1).max_x = 1e-3;
% inductors(1).max_y = 1e-3;
% inductors(1).max_z = 1e-3;
% inductors(1).direction = 'x';
% inductors(1).inductance = 10e-9; % henrys

% capacitors
% capacitors(1).min_x = 1e-3;
% capacitors(1).min_y = 0;
% capacitors(1).min_z = 1e-3;
% capacitors(1).max_x = 2e-3;
% capacitors(1).max_y = 1e-3;
% capacitors(1).max_z = 1e-3;
% capacitors(1).direction = 'x';
% capacitors(1).capacitance = 10e-12; % farads
% 
% diodes
% diodes(1).min_x = 2.0e-3;
% diodes(1).min_y = 1.0e-3;
% diodes(1).min_z = 0.0e-3;
% diodes(1).max_x = 2.0e-3;
% diodes(1).max_y = 1.0e-3;
% diodes(1).max_z = 1.0e-3;
% diodes(1).direction = 'zn';

% incident_plane_wave.E_theta = 1;
% incident_plane_wave.E_phi = 0; 
% incident_plane_wave.theta_incident = 0; % degrees
% incident_plane_wave.phi_incident = 0;
% incident_plane_wave.waveform_type = 'gaussian';
% incident_plane_wave.waveform_index = 1;
