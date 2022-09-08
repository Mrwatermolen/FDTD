function [x] = solve_diode_equation(A, B, C, x)
    %solve_diode_equation - Description
    %
    % Syntax: [x] = solve_diode_equation(A, B, C, x)
    %
    % Long description
    tolerance = 1e-25;
    max_iter = 50;
    iter = 0;
    f = A .* exp(B * x) + x + C;

    while ((iter < max_iter) && (max(abs(f) > tolerance)))
        fp = A .* (B * exp(B * x))+ 1;
        x = x - f ./ fp;
        f = A .* exp(B * x) + x + C;
        iter = iter + 1;
    end

end
