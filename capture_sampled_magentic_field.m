for i = 1:size(sampled_magnetic_fields, 2)
    sampled_value = 0;

    % 元胞(i, j, k)的磁场是可以由磁场(i,j+1/2, k+1/2)已经(i,j+1/2, k+1/2)其的左、下、左下平均得来
    switch (sampled_magnetic_fields(i).component)
        case 'x'
            sampled_value = 0.25 * sum(sum(Hx(sampled_magnetic_fields(i).i, (sampled_magnetic_fields(i).j - 1):sampled_magnetic_fields(i).j, (sampled_magnetic_fields(i).k - 1):sampled_magnetic_fields(i).k)));
        case 'y'
            sampled_value = 0.25 * sum(sum(Hy((sampled_magnetic_fields(i).i - 1):sampled_magnetic_fields(i).i, sampled_magnetic_fields(i).j, (sampled_magnetic_fields(i).k - 1):sampled_magnetic_fields(i).k)));
        case 'z'
            sampled_value = 0.25 * sum(sum(Hz((sampled_magnetic_fields(i).i - 1):sampled_magnetic_fields(i).i, (sampled_magnetic_fields(i).j - 1):sampled_magnetic_fields(i).j, sampled_magnetic_fields(i).k)));
        case 'm'
            svx = 0.25 * sum(sum(Hx(sampled_magnetic_fields(i).i, (sampled_magnetic_fields(i).j - 1):sampled_magnetic_fields(i).j, (sampled_magnetic_fields(i).k - 1):sampled_magnetic_fields(i).k)));
            svy = 0.25 * sum(sum(Hy((sampled_magnetic_fields(i).i - 1):sampled_magnetic_fields(i).i, sampled_magnetic_fields(i).j, (sampled_magnetic_fields(i).k - 1):sampled_magnetic_fields(i).k)));
            svz = 0.25 * sum(sum(Hz((sampled_magnetic_fields(i).i - 1):sampled_magnetic_fields(i).i, (sampled_magnetic_fields(i).j - 1):sampled_magnetic_fields(i).j, sampled_magnetic_fields(i).k)));
            sampled_value = sqrt(svx^2 + svy^2 + svz^2);
    end

    sampled_magnetic_fields(i).sampled_values(time_step) = sampled_value;
end