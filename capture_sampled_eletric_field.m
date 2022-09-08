for i = 1:size(sampled_electric_fields, 2)
%     i_start = sampled_electric_fields(i).i;
%     j_start = sampled_electric_fields(i).j;
%     k_start = sampled_electric_fields(i).k;
%     sampled_value = 0;
% 
%     switch (sampled_electric_fields.component)
%         case 'x'
%             sampled_value = 0.5 * sum(Ex(i_start - 1:i_start, j_start, k_start));
%         case 'y'
%             sampled_value = 0.5 * sum(Ey(i_start, j_start - 1:j_start, k_start));
%         case 'z'
%             sampled_value = 0.5 * sum(Ez(i_start, j_start, k_start - 1:k_start));
%     end
% 
%     sampled_electric_fields(i).sampled_values(time_step) = sampled_value;
end