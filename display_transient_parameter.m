disp('display_transient_parameter');

for i = 1:size(sampled_voltages, 2)

    if sampled_voltages(i).display_plot == false
        sampled_voltages(i).figure_number = figure;
        xlabel('time(ns)');
        ylabel('(volt)');
        title(['sampled voltage ', num2str(i)]);
        grid on;
        hold on;
    else
        figure(sampled_voltages(i).figure_number);
        delete(sampled_voltages.plot_handle);
    end

    sampled_time = sampled_voltages(i).time(1:time_step) * 1e9;
    sampled_value = sampled_voltages(i).sampled_values(1:time_step);
    sampled_voltages(i).plot_handle = plot(sampled_time, sampled_value, 'b- ');
    drawnow;
end