disp('initialize_fdtd_parameters_and_arrays');

eps_0 = 8.8542e-12;
mu_0 = 4 * pi * 1e-7;
c = 1 / sqrt(mu_0 * eps_0);

dt = 1 / (c * sqrt((1 / dx^2) + (1 / dy^2) + (1 / dz^2)));
dt = courant_factor * dt;

time = ([1:number_time_steps] - 0.5) * dt;

Ex = zeros(nx, ny_p1, nz_p1);
Ey = zeros(nx_p1, ny, nz_p1);
Ez = zeros(nx_p1, ny_p1, nz);

Hx = zeros(nx_p1, ny, nz);
Hy = zeros(nx, ny_p1, nz);
Hz = zeros(nx, ny, nz_p1);
