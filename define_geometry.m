disp("define_geometry");

bricks = [];
spheres = [];

bricks(1).min_x = -20 * dx;
bricks(1).min_y = -25 * dy;
bricks(1).min_z = 0;
bricks(1).max_x = 20 * dx;
bricks(1).max_y = 25 * dy;
bricks(1).max_z = 3 * dz;
bricks(1).material_type = 4;

bricks(2).min_x = -12 * dx;
bricks(2).min_y = -15 * dy;
bricks(2).min_z = 3 * dz;
bricks(2).max_x = 12 * dx;
bricks(2).max_y = -9 * dy;
bricks(2).max_z = 3 * dz;
bricks(2).material_type = 2;

bricks(3).min_x = -12 * dx;
bricks(3).min_y = 9 * dy;
bricks(3).min_z = 3 * dz;
bricks(3).max_x = 12 * dx;
bricks(3).max_y = 15 * dy;
bricks(3).max_z = 3 * dz;
bricks(3).material_type = 2;

bricks(4).min_x = -17 * dx;
bricks(4).min_y = -12 * dy;
bricks(4).min_z = 3 * dz;
bricks(4).max_x = -7 * dx;
bricks(4).max_y = 12 * dy;
bricks(4).max_z = 3 * dz;
bricks(4).material_type = 2;

bricks(5).min_x = 7 * dx;
bricks(5).min_y = -12 * dy;
bricks(5).min_z = 3 * dz;
bricks(5).max_x = 17 * dx;
bricks(5).max_y = 12 * dy;
bricks(5).max_z = 3 * dz;
bricks(5).material_type = 2;

bricks(6).min_x = -15 * dx;
bricks(6).min_y = -25 * dy;
bricks(6).min_z = 3 * dz;
bricks(6).max_x = -9 * dx;
bricks(6).max_y = -12 * dy;
bricks(6).max_z = 3 * dz;
bricks(6).material_type = 2;

bricks(7).min_x = 9 * dx;
bricks(7).min_y = -25 * dy;
bricks(7).min_z = 3 * dz;
bricks(7).max_x = 15 * dx;
bricks(7).max_y = -12 * dy;
bricks(7).max_z = 3 * dz;
bricks(7).material_type = 2;

bricks(8).min_x = -15 * dx;
bricks(8).min_y = 12 * dy;
bricks(8).min_z = 3 * dz;
bricks(8).max_x = -9 * dx;
bricks(8).max_y = 25 * dy;
bricks(8).max_z = 3 * dz;
bricks(8).material_type = 2;

bricks(9).min_x = 9 * dx;
bricks(9).min_y = 12 * dy;
bricks(9).min_z = 3 * dz;
bricks(9).max_x = 15 * dx;
bricks(9).max_y = 25 * dy;
bricks(9).max_z = 3 * dz;
bricks(9).material_type = 2;

bricks(10).min_x = -20 * dx;
bricks(10).min_y = -25 * dy;
bricks(10).min_z = 0 * dz;
bricks(10).max_x = 20 * dx;
bricks(10).max_y = 25 * dy;
bricks(10).max_z = 0 * dz;
bricks(10).material_type = 2;

% spheres(1).radius = 20e-3;
% spheres(1).center_x = 0;
% spheres(1).center_y = 0;
% spheres(1).center_z = 40e-3;
% spheres(1).material_type = 5;
% 
% spheres(2).radius = 15e-3;
% spheres(2).center_x = 0;
% spheres(2).center_y = 0;
% spheres(2).center_z = 40e-3;
% spheres(2).material_type = material_air_index;
