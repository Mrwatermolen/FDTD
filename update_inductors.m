for i = 1:number_inductors
    fi = inductors(i).field_indices;

    switch (inductors(i).direction(1))
        case 'x'
            Ex(fi) = Ex(fi) + inductors(i).Cexj .* inductors(i).Jix;
            inductors(i).Jix = inductors(i).Jix + inductors(i).Cjex .* Ex(fi);
        case 'y'
            Ey(fi) = Ey(fi) + inductors(i).Ceyj .* inductors(i).Jiy;
            inductors(i).Jiy = inductors(i).Jiy + inductors(i).Cjey .* Ey(fi);
        case 'z'
            Ez(fi) = Ez(fi) + inductors(i).Cezj .* inductors(i).Jiz;
            inductors(i).Jiz = inductors(i).Jiz + inductors(i).Cjez .* Ez(fi);
    end

end
