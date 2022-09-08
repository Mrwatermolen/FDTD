disp("create_spheres")

for i = 1:number_spheres
    distance = sqrt((spheres(i).center_x - fdtd_domain.cell_center_coordinats_x).^2 ...
        + (spheres(i).center_y - fdtd_domain.cell_center_coordinats_y).^2 ...
        + (spheres(i).center_z - fdtd_domain.cell_center_coordinats_z).^2);
    I = find(distance <= spheres(i).radius);
    material_3d_space(I) = spheres(i).material_type;
end
