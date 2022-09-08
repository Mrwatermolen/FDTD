disp("calculate_domain_size");

number_spheres = size(spheres, 2); % size of dim = 2;
number_bricks = size(bricks, 2);

% find maximum and minmun coordinate of a box
min_x = zeros;
min_y = zeros;
min_z = zeros;
max_x = zeros;
max_y = zeros;
max_z = zeros;
number_object = 1;
% sphere
for i = 1:number_spheres
    min_x(number_object) = spheres(i).center_x - spheres(i).radius;
    min_y(number_object) = spheres(i).center_y - spheres(i).radius;
    min_z(number_object) = spheres(i).center_z - spheres(i).radius;
    max_x(number_object) = spheres(i).center_x + spheres(i).radius;
    max_y(number_object) = spheres(i).center_y + spheres(i).radius;
    max_z(number_object) = spheres(i).center_z + spheres(i).radius;
    number_object = number_object + 1;
end

% brick
for i = 1:number_bricks
    min_x(number_object) = bricks(i).min_x;
    min_y(number_object) = bricks(i).min_y;
    min_z(number_object) = bricks(i).min_z;
    max_x(number_object) = bricks(i).max_x;
    max_y(number_object) = bricks(i).max_y;
    max_z(number_object) = bricks(i).max_z;
    number_object = number_object + 1;
end

% voltage source
for i = 1:size(voltage_sources, 2)
    min_x(number_object) = voltage_sources(i).min_x;
    min_y(number_object) = voltage_sources(i).min_y;
    min_z(number_object) = voltage_sources(i).min_z;
    max_x(number_object) = voltage_sources(i).max_x;
    max_y(number_object) = voltage_sources(i).max_y;
    max_z(number_object) = voltage_sources(i).max_z;
    number_object = number_object + 1;
end

% current source
for i = 1:size(current_sources, 2)
    min_x(number_object) = current_sources(i).min_x;
    min_y(number_object) = current_sources(i).min_y;
    min_z(number_object) = current_sources(i).min_z;
    max_x(number_object) = current_sources(i).max_x;
    max_y(number_object) = current_sources(i).max_y;
    max_z(number_object) = current_sources(i).max_z;
    number_object = number_object + 1;
end

% resistor
for i = 1:size(resistors, 2)
    min_x(number_object) = resistors(i).min_x;
    min_y(number_object) = resistors(i).min_y;
    min_z(number_object) = resistors(i).min_z;
    max_x(number_object) = resistors(i).max_x;
    max_y(number_object) = resistors(i).max_y;
    max_z(number_object) = resistors(i).max_z;
    number_object = number_object + 1;
end

% inductor
for i = 1:size(inductors, 2)
    min_x(number_object) = inductors(i).min_x;
    min_y(number_object) = inductors(i).min_y;
    min_z(number_object) = inductors(i).min_z;
    max_x(number_object) = inductors(i).max_x;
    max_y(number_object) = inductors(i).max_y;
    max_z(number_object) = inductors(i).max_z;
    number_object = number_object + 1;
end

% capacitor
for i = 1:size(capacitors, 2)
    min_x(number_object) = capacitors(i).min_x;
    min_y(number_object) = capacitors(i).min_y;
    min_z(number_object) = capacitors(i).min_z;
    max_x(number_object) = capacitors(i).max_x;
    max_y(number_object) = capacitors(i).max_y;
    max_z(number_object) = capacitors(i).max_z;
    number_object = number_object + 1;
end

% diode
for i = 1:size(diodes, 2)
    min_x(number_object) = diodes(i).min_x;
    min_y(number_object) = diodes(i).min_y;
    min_z(number_object) = diodes(i).min_z;
    max_x(number_object) = diodes(i).max_x;
    max_y(number_object) = diodes(i).max_y;
    max_z(number_object) = diodes(i).max_z;
    number_object = number_object + 1;
end

% domain
fdtd_domain.min_x = min(min_x);
fdtd_domain.min_y = min(min_y);
fdtd_domain.min_z = min(min_z);
fdtd_domain.max_x = max(max_x);
fdtd_domain.max_y = max(max_y);
fdtd_domain.max_z = max(max_z);
% add buffer
fdtd_domain.min_x = fdtd_domain.min_x - dx * (boundary.air_buffer_number_of_cells_xn);
fdtd_domain.min_y = fdtd_domain.min_y - dy * boundary.air_buffer_number_of_cells_yn;
fdtd_domain.min_z = fdtd_domain.min_z - dz * boundary.air_buffer_number_of_cells_zn;
fdtd_domain.max_x = fdtd_domain.max_x + dx * boundary.air_buffer_number_of_cells_xp;
fdtd_domain.max_y = fdtd_domain.max_y + dy * boundary.air_buffer_number_of_cells_yp;
fdtd_domain.max_z = fdtd_domain.max_z + dz * boundary.air_buffer_number_of_cells_zp;

if strcmp(boundary.type_xp, 'cpml') && (boundary.cpml_number_of_cells_xp > 0)
    fdtd_domain.max_x = fdtd_domain.max_x + dx * boundary.cpml_number_of_cells_xp;
end

if strcmp(boundary.type_xn, 'cpml') && (boundary.cpml_number_of_cells_xn > 0)
    fdtd_domain.min_x = fdtd_domain.min_x - dx * boundary.cpml_number_of_cells_xn;
end

if strcmp(boundary.type_yp, 'cpml') && (boundary.cpml_number_of_cells_yp > 0)
    fdtd_domain.max_y = fdtd_domain.max_y + dy * boundary.cpml_number_of_cells_yp;
end

if strcmp(boundary.type_yn, 'cpml') && (boundary.cpml_number_of_cells_yn > 0)
    fdtd_domain.min_y = fdtd_domain.min_y - dy * boundary.cpml_number_of_cells_yn;
end

if strcmp(boundary.type_zp, 'cpml') && (boundary.cpml_number_of_cells_zp > 0)
    fdtd_domain.max_z = fdtd_domain.max_z + dz * boundary.cpml_number_of_cells_zp;
end

if strcmp(boundary.type_zn, 'cpml') && (boundary.cpml_number_of_cells_zn > 0)
    fdtd_domain.min_z = fdtd_domain.min_z - dz * boundary.cpml_number_of_cells_zn;
end

% problem space size
nx = round((fdtd_domain.max_x - fdtd_domain.min_x) / dx);
ny = round((fdtd_domain.max_y - fdtd_domain.min_y) / dy);
nz = round((fdtd_domain.max_z - fdtd_domain.min_z) / dz);
fdtd_domain.size_x = nx * dx;
fdtd_domain.size_y = ny * dy;
fdtd_domain.size_z = nz * dz;
% adjust domain
fdtd_domain.max_x = fdtd_domain.min_x + fdtd_domain.size_x;
fdtd_domain.max_y = fdtd_domain.min_y + fdtd_domain.size_y;
fdtd_domain.max_z = fdtd_domain.min_z + fdtd_domain.size_z;

% define auxiliary parameters
nx_p1 = nx + 1;
ny_p1 = ny + 1;
nz_p1 = nz + 1;
nx_n1 = nx - 1;
ny_n1 = ny - 1;
nz_n1 = nz - 1;
nx_n2 = nx - 2;
ny_n2 = ny - 2;
nz_n2 = nz - 2;

% create arrays storing center coordinate of the cells
fdtd_domain.cell_center_coordinats_x = zeros(nx, ny, nz);
fdtd_domain.cell_center_coordinats_y = zeros(nx, ny, nz);
fdtd_domain.cell_center_coordinats_z = zeros(nx, ny, nz);

for i = 1:nx
    fdtd_domain.cell_center_coordinats_x(i, :, :) = ...
        (i - 0.5) * dx + fdtd_domain.min_x;
end

for i = 1:ny
    fdtd_domain.cell_center_coordinats_y(:, i, :) = ...
        (i - 0.5) * dy + fdtd_domain.min_y;
end

for i = 1:nz
    fdtd_domain.cell_center_coordinats_z(:, :, i) = ...
        (i - 0.5) * dz + fdtd_domain.min_z;
end
