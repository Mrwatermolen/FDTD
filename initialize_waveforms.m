disp('initialize_waveforms');

% sinusoidal
if isfield(waveforms, 'sinusoidal')
    for i = 1:size(waveforms.sinusoidal, 2)
        waveforms.sinusoidal(i).waveform = sin(2 * pi * waveforms.sinusoidal(i).frequency * time);
    end
end

% unit step
if isfield(waveforms, 'unit_step')
    for i = 1:size(waveforms.unit_step, 2)
        start_index = waveforms.unit_step(i).start_time_step;
        waveforms.unit_step(i).waveform(1:number_time_steps) = 1;
        waveforms.unit_step(i).waveform(1:start_index - 1) = 0;
        waveforms.unit_step(i).t_0 = 0;
    end
end

% gaussian
if isfield(waveforms, 'gaussian')
    for i = 1:size(waveforms.gaussian, 2)
        if waveforms.gaussian(i).number_cells_per_wavelength == 0
            nc = number_cells_per_wavelength;
        else
            nc = waveforms.gaussian(i).number_cells_per_wavelength;
        end
        waveforms.gaussian(i).maximum_frequency = c / (nc * max([dx,dy,dz]));
        tau = (nc * max([dx,dy,dz])) / (2 * c);
        t_0 = 4.5 * tau;
        waveforms.gaussian(i).tau = tau;
        waveforms.gaussian(i).t_0 = t_0;
        waveforms.gaussian(i).waveform = exp(-((time - t_0) / tau) .^ 2);
    end
end

% derivative gaussian
if isfield(waveforms, 'derivative_gaussian')
    for i = 1:size(waveforms.derivative_gaussian, 2)
        if waveforms.derivative_gaussian(i).number_cells_per_wavelength == 0
            nc = number_cells_per_wavelength;
        else
            nc = waveforms.derivative_gaussian(i).number_cells_per_wavelength;
        end
        waveforms.derivative_gaussian(i).maximum_frequency = c / (nc * max([dx,dy,dz]));
        tau = (nc * max([dx,dy,dz])) / (2 * c);
        t_0 = 4.5 * tau;
        waveforms.derivative_gaussian(i).tau = tau;
        waveforms.derivative_gaussian(i).t_0 = t_0;
        waveforms.derivative_gaussian(i).waveform = -(sqrt(2 * exp(1)) / tau) ...
            * exp(-((time - t_0) / tau) .^ 2);
    end
end

if isfield(waveforms, "cosine_modulated_gaussian")
    for i = 1:size(waveforms.cosine_modulated_gaussian, 2)
        frequency = waveforms.cosine_modulated_gaussian(i).modulation_frequency;
        tau = 0.966 / waveforms.cosine_modulated_gaussian(i).bandwidth;
        t_0 = 4.5 * tau;
        waveforms.cosine_modulated_gaussian(i).tau = tau;
        waveforms.cosine_modulated_gaussian(i).t_0 = t_0;
        waveforms.cosine_modulated_gaussian(i).waveform = cos(2 * pi * frequency * (time - t_0)) ...
            .* exp(-((time - t_0) / tau) .^ 2);
    end
end