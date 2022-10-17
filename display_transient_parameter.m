disp('display_transient_parameter');

if incident_plane_wave.enabled
    figure;
    xlabel('time (ns)');
    ylabel('(volt/meter)');
    title('Incident electric field');
    grid on;
    hold on;
    sampled_time = time(1:time_step) * 1e9;
    sampled_value_theta = incident_plane_wave.E_theta * incident_plane_wave.waveform;
    sampled_value_phi = incident_plane_wave.E_phi * incident_plane_wave.waveform;
    plot(sampled_time, sampled_value_theta, 'b--', sampled_time, sampled_value_phi, 'r');
    legend('E_{\theta}', 'E_{\phi}');
    drawnow;
end