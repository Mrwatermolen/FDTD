current_time = current_time + dt / 2;

Hx = Chxh .* Hx + Chxey .* (Ey(1:nx_p1, 1:ny, 2:nz_p1) - Ey(1:nx_p1, 1:ny, 1:nz)) ...
    + Chxez .* (Ez(1:nx_p1, 2:ny_p1, 1:nz) - Ez(1:nx_p1, 1:ny, 1:nz));

Hy = Chyh .* Hy + Chyez .* (Ez(2:nx_p1, 1:ny_p1, 1:nz) - Ez(1:nx, 1:ny_p1, 1:nz)) ...
    + Chyex .* (Ex(1:nx, 1:ny_p1, 2:nz_p1) - Ex(1:nx, 1:ny_p1, 1:nz));

Hz = Chzh .* Hz + Chzex .* (Ex(1:nx, 2:ny_p1, 1:nz_p1) - Ex(1:nx, 1:ny, 1:nz_p1)) ...
    + Chzey .* (Ey(2:nx_p1, 1:ny, 1:nz_p1) - Ey(1:nx, 1:ny, 1:nz_p1));
