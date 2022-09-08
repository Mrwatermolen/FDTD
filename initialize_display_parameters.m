disp('initialize_display_parameter');

% for i = 1:size(sampled_electric_fields, 2)
% 
%     if sampled_electric_fields(i).display_plot
%         sampled_electric_fields(i).figure_number = figure;
%         sampled_electric_fields(i).plot_handle = plot(0, 0, 'b- ');
%         xlabel('time (ns)', 'FontSize', 12);
%         ylabel('(volt/meter)', 'FontSize', 12);
%         title(['sampled eletric field', num2str(i)], 'FontSize', 12);
%         grid on;
%         hold on;
%     end
% 
% end

for i = 1:size(sampled_voltages, 2)

    if sampled_voltages(i).display_plot
        sampled_voltages(i).figure_number = figure;
        sampled_voltages(i).plot_handle = plot(0, 0, 'r- ');
        xlabel('time (ns)', 'FontSize', 12);
        ylabel('(volt)', 'FontSize', 12);
        title(['sampled voltages', num2str(i)], 'FontSize', 12);
        grid on;
        hold on;
    end

end

for i = 1:size(sampled_currents, 2)

    if sampled_currents(i).display_plot
        sampled_currents(i).figure_number = figure;
        sampled_currents(i).plot_handle = plot(0, 0, 'r- ');
        xlabel('time (ns)', 'FontSize', 12);
        ylabel('(anbei)', 'FontSize', 12);
        title(['sampled currents', num2str(i)], 'FontSize', 12);
        grid on;
        hold on;
    end

end
% initialize_animation_parameter;