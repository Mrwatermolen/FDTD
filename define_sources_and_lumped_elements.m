disp('define_sources_and_lumped_elements');

voltage_sources = [];
current_sources = [];
diodes = [];
resistors = [];
inductors = [];
capacitors = [];

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
voltage_sources(1).min_x = -15 * dx;
voltage_sources(1).min_y = -25 * dy;
voltage_sources(1).min_z = 0;
voltage_sources(1).max_x = -9 * dx;
voltage_sources(1).max_y = -25 * dy;
voltage_sources(1).max_z = 3 * dz;
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
resistors(1).min_x = 9 * dx;
resistors(1).min_y = -25 * dy;
resistors(1).min_z = 0;
resistors(1).max_x = 15 * dx;
resistors(1).max_y = -25 * dy;
resistors(1).max_z = 3 * dz;
resistors(1).direction = 'z';
resistors(1).resistance = 50; % ohms

resistors(2).min_x = 9 * dx;
resistors(2).min_y = 25 * dy;
resistors(2).min_z = 0;
resistors(2).max_x = 15 * dx;
resistors(2).max_y = 25 * dy;
resistors(2).max_z = 3 * dz;
resistors(2).direction = 'z';
resistors(2).resistance = 50; % ohms

resistors(3).min_x = -15 * dx;
resistors(3).min_y = 25 * dy;
resistors(3).min_z = 0;
resistors(3).max_x = -9 * dx;
resistors(3).max_y = 25 * dy;
resistors(3).max_z = 3 * dz;
resistors(3).direction = 'z';
resistors(3).resistance = 50; % ohms

% 
% inductors
% inductors(1).min_x = 1e-3;
% inductors(1).min_y = 0;
% inductors(1).min_z = 0;
% inductors(1).max_x = 1e-3;
% inductors(1).max_y = 1e-3;
% inductors(1).max_z = 1e-3;
% inductors(1).direction = 'z';
% inductors(1).inductance = 10e-9; % henrys

% capacitors
% capacitors(1).min_x = 1e-3;
% capacitors(1).min_y = 0;
% capacitors(1).min_z = 1e-3;
% capacitors(1).max_x = 1e-3;
% capacitors(1).max_y = 1e-3;
% capacitors(1).max_z = 2e-3;
% capacitors(1).direction = 'z';
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
