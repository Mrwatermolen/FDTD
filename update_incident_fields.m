if incident_plane_wave.enabled == false
    return;
end

tm = current_time + dt / 2;
te = current_time + dt;

Hxip = Hxic;
Hyip = Hyic;
Hzip = Hzic;

Exip = Exic;
Eyip = Eyic;
Ezip = Ezic;

wt_str = incident_plane_wave.waveform_type;
wi = incident_plane_wave.waveform_index;

if strcmp(wt_str, 'gaussian')
    tau = waveforms.gaussian(wi).tau;
    t_0 = waveforms.gaussian(wi).t_0;
    Exic = Exi0 * exp(- ((te - t_0 - k_dot_r_ex) / tau).^2);
    Eyic = Eyi0 * exp(- ((te - t_0 - k_dot_r_ey) / tau).^2);
    Ezic = Ezi0 * exp(- ((te - t_0 - k_dot_r_ez) / tau).^2);

    Hxic = Hxi0 * exp(- ((tm - t_0 - k_dot_r_hx) / tau).^2);
    Hyic = Hyi0 * exp(- ((tm - t_0 - k_dot_r_hy) / tau).^2);
    Hzic = Hzi0 * exp(- ((tm - t_0 - k_dot_r_hz) / tau).^2);
end
