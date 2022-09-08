disp("initializ_fdtd_material_grid");

calculate_domain_size; % ok

material_3d_space = ones(nx, ny, nz); % material type default 1

create_spheres;
create_bricks;

eps_r_x = ones(nx, ny_p1, nz_p1); % 有nx*(ny + 1) * (nz + 1)个Ex分量要求解
eps_r_y = ones(nx_p1, ny, nz_p1);
eps_r_z = ones(nx_p1, ny_p1, nz);
mu_r_x = ones(nx_p1, ny, nz);
mu_r_y = ones(nx, ny_p1, nz);
mu_r_z = ones(nx, ny, nz_p1);
sigma_e_x = ones(nx, ny_p1, nz_p1);
sigma_e_y = ones(nx_p1, ny, nz_p1);
sigma_e_z = ones(nx_p1, ny_p1, nz);
sigma_m_x = ones(nx_p1, ny, nz);
sigma_m_y = ones(nx, ny_p1, nz);
sigma_m_z = ones(nx, ny, nz_p1);

calculate_material_componet_values; % ok

% add PEC plates which thickness is zero;
creat_PEC_plates;
