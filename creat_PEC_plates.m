disp("creat_PEC_plates");
% 如果定义中出现了厚度为0的PEC板 则执行

for i = 1:number_bricks
    % be like
    sigma_pec = material_type(bricks(i).material_type).sigma_e;
    blx = round((bricks(i).min_x - fdtd_domain.min_x) / dx) + 1;
    bux = round((bricks(i).max_x - fdtd_domain.min_x) / dx) + 1;
    bly = round((bricks(i).min_y - fdtd_domain.min_y) / dy) + 1;
    buy = round((bricks(i).max_y - fdtd_domain.min_y) / dy) + 1;
    blz = round((bricks(i).min_z - fdtd_domain.min_z) / dz) + 1;
    buz = round((bricks(i).max_z - fdtd_domain.min_z) / dz) + 1;

    if (blx == bux)
        sigma_e_y(blx, bly:buy - 1, blz:buz) = sigma_pec;
        sigma_e_z(blx, bly:buy, blz:buz - 1) = sigma_pec;
    end

    if (bly == buy)
        sigma_e_x(blx:bux - 1, bly, blz:buz) = sigma_pec;
        sigma_e_z(blx:bux, bly, blz:buz - 1) = sigma_pec;
    end

    if (blz == buz)
        sigma_e_x(blx:bux - 1, bly:buy, blz) = sigma_pec;
        sigma_e_y(blx:bux, bly:buy - 1, blz) = sigma_pec;
    end

end