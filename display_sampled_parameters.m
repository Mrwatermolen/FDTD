if mod(time_step, plotting_step) ~= 0
    return;
end

remain_time = (number_time_steps - time_step) * (cputime - start_time) / time_step;
disp([num2str(time_step), ' of ', num2str(number_time_steps), ' is completed, ', num2str(remain_time), 'seconds remaining']);

for i = 1:number_sampled_electric_fields
    
    if ~sampled_electric_fields(i).display_plot
        break
    end

    sampled_time = sampled_electric_fields(i).time(1:time_step) * 1e9;
    sampled_value = sampled_electric_fields(i).sampled_values(1:time_step);
    figure(sampled_electric_fields(i).figure_number);
    delete(sampled_electric_fields(i).plot_handle);
    sampled_electric_fields(i).plot_handle = plot(sampled_time, sampled_value, 'b- ');
    drawnow;
end

for i = 1:number_sampled_voltages
    
    if ~sampled_voltages(i).display_plot
        break
    end

    sampled_time = sampled_voltages(i).time(1:time_step) * 1e9;
    sampled_value = sampled_voltages(i).sampled_values(1:time_step);
    figure(sampled_voltages(i).figure_number);
    delete(sampled_voltages(i).plot_handle);
    sampled_voltages(i).plot_handle = plot(sampled_time, sampled_value, 'b- ');
    drawnow;
end

for i = 1:number_sampled_currents
    
    if ~sampled_currents(i).display_plot
        break
    end

    sampled_time = sampled_currents(i).time(1:time_step) * 1e9;
    sampled_value = sampled_currents(i).sampled_values(1:time_step);
    figure(sampled_currents(i).figure_number);
    delete(sampled_currents(i).plot_handle);
    sampled_currents(i).plot_handle = plot(sampled_time, sampled_value, 'b- ');
    drawnow;
end
