current_time = current_time + dt / 2;

Hx = Chxh .* Hx + Chxey .* (Ey(1:nx_p1, 1:ny, 2:nz_p1) - Ey(1:nx_p1, 1:ny, 1:nz)) ...
    + Chxez .* (Ez(1:nx_p1, 2:ny_p1, 1:nz) - Ez(1:nx_p1, 1:ny, 1:nz));

Hy = Chyh .* Hy + Chyez .* (Ez(2:nx_p1, 1:ny_p1, 1:nz) - Ez(1:nx, 1:ny_p1, 1:nz)) ...
    + Chyex .* (Ex(1:nx, 1:ny_p1, 2:nz_p1) - Ex(1:nx, 1:ny_p1, 1:nz));

Hz = Chzh .* Hz + Chzex .* (Ex(1:nx, 2:ny_p1, 1:nz_p1) - Ex(1:nx, 1:ny, 1:nz_p1)) ...
    + Chzey .* (Ey(2:nx_p1, 1:ny, 1:nz_p1) - Ey(1:nx, 1:ny, 1:nz_p1));

if incident_plane_wave.enabled
    % 吸收边界要把入射场吸收，所以不能删去入射场
    ixs = n_cpml_xn + 1;
    ixe = nx - n_cpml_xp;
    iys = n_cpml_yn + 1;
    iye = ny - n_cpml_yp;
    izs = n_cpml_yn + 1;
    ize = nz - n_cpml_zp;
    Hx(ixs:ixe, iys:iye, izs:ize) = Hx(ixs:ixe, iys:iye, izs:ize) + ...
        Chxhic(ixs:ixe, iys:iye, izs:ize) .* Hxic(ixs:ixe, iys:iye, izs:ize) + ...
        Chxhip(ixs:ixe, iys:iye, izs:ize) .* Hxip(ixs:ixe, iys:iye, izs:ize);
    Hy(ixs:ixe, iys:iye, izs:ize) = Hy(ixs:ixe, iys:iye, izs:ize) + ...
        Chyhic(ixs:ixe, iys:iye, izs:ize) .* Hyic(ixs:ixe, iys:iye, izs:ize) + ...
        Chyhip(ixs:ixe, iys:iye, izs:ize) .* Hyip(ixs:ixe, iys:iye, izs:ize);
    Hz(ixs:ixe, iys:iye, izs:ize) = Hz(ixs:ixe, iys:iye, izs:ize) + ...
        Chzhic(ixs:ixe, iys:iye, izs:ize) .* Hzic(ixs:ixe, iys:iye, izs:ize) + ...
        Chzhip(ixs:ixe, iys:iye, izs:ize) .* Hzip(ixs:ixe, iys:iye, izs:ize);
end
