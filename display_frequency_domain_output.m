disp('display_frequency_domain_output');

for i = 1:number_sampled_voltages
    if ~sampled_voltages(i).display_plot
        break
    end

    frequencies = sampled_voltages(i).frequencies;
    fd_value = sampled_voltages(i).frequency_domain_value;
    figure;
    subplot(2, 1, 1);
    plot(frequencies, abs(fd_value));
    xlabel('frequency (GHz)');
    ylabel('magnitude');
    grid on;
    subplot(2, 1, 2);
    plot(frequencies, angle(fd_value) * 180 / pi);
    xlabel('frequency (GHz)');
    ylabel('phase (degrees)');
    sgtitle(['sampled voltage ', num2str(i)]);
    grid on;
    drawnow;
end

for i = 1:number_sampled_currents
    if ~sampled_currents(i).display_plot
        break
    end
    frequencies = sampled_currents(i).frequencies;
    fd_value = sampled_voltages(i).frequency_domain_value;
    figure;
    subplot(2, 1, 1);
    plot(frequencies, abs(fd_value));
    xlabel('frequency (GHz)');
    ylabel('magnitude');
    grid on;
    subplot(2, 1, 2);
    plot(frequencies, angle(fd_value) * 180 / pi);
    xlabel('frequency (GHz)');
    ylabel('phase (degrees)');
    sgtitle(['sampled currents ', num2str(i)]);
    grid on;
    drawnow;
end

for i = 1:number_of_ports
    if (ports(i).is_source_port)
        frequencies = ports(i).frequencies * 1e-9;
        for j = 1:number_of_ports
            S = ports(i).S(j).values;
            Sdb = 20 * log10(abs(S));
            Sphase = angle(S) * 180/pi;
            figure;
            subplot(2, 1, 1);
            plot(frequencies, Sdb);
            title(['S', num2str(j), num2str(i)])
            xlabel('frequency (GHz)');
            ylabel('magnitude');
            grid on;
            subplot(2, 1, 2);
            plot(frequencies, Sphase);
            xlabel('frequency (GHz)');
            ylabel('phase (degrees)');
            grid on;
            drawnow;
        end
    end
end