for i = 1:number_diodes
    fi = diodes(i).field_indices;
    B = diodes(i).B;

    switch (diodes(i).direction(1))
        case 'x'
            E = diodes(i).Exn;
            C = -Ex(fi) + diodes(i).Cexd;
            A = -diodes(i).Cexd .* exp(B * E);
            E = solve_diode_equation(A, B, C, E);
            Ex(fi) = E;
            diodes(i).Exn = E;
        case 'y'
            E = diodes(i).Eyn;
            C = -Ex(fi) + diodes(i).Ceyd;
            A =- diodes(i).Ceyd .* exp(B * E);
            E = solve_diode_equation(A, B, C, E);
            Ey(fi) = E;
            diodes(i).Eyn = E;
        case 'z'
            E = diodes(i).Ezn;
            C = -Ez(fi) + diodes(i).Cezd;
            A =- diodes(i).Cezd .* exp(B * E);
            E = solve_diode_equation(A, B, C, E);
            Ez(fi) = E;
            diodes(i).Ezn = E;
    end

end
