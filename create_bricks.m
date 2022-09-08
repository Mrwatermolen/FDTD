disp("create_bricks");

for i = 1:number_bricks
    % convert brick ebd coordinates to node induces
    create_brick_x1 = round((bricks(i).min_x - fdtd_domain.min_x) / dx) + 1;
    create_brick_y1 = round((bricks(i).min_y - fdtd_domain.min_y) / dy) + 1;
    create_brick_z1 = round((bricks(i).min_z - fdtd_domain.min_z) / dz) + 1;

    create_brick_x2 = round((bricks(i).max_x - fdtd_domain.min_x) / dx) + 1;
    create_brick_y2 = round((bricks(i).max_y - fdtd_domain.min_y) / dy) + 1;
    create_brick_z2 = round((bricks(i).max_z - fdtd_domain.min_z) / dz) + 1;

    material_3d_space(create_brick_x1:create_brick_x2 - 1, create_brick_y1:create_brick_y2 - 1, create_brick_z1:create_brick_z2 - 1) = bricks(i).material_type;
end
