function [X] = time_to_frequency_domain(x, dt, frequency_array, time_shift)
%UNTITLED5 此处提供此函数的摘要
% time_shift : time offset
%   此处提供详细说明
number_time_steps = size(x, 2);
number_frequncies = size(frequency_array, 2);
X = zeros(1, number_frequncies);
w = 2 * pi * frequency_array;
for n = 1:number_time_steps
    t = n * dt + time_shift;
    X = X + x(n) * exp(- 1i * w * t);
end
X = X * dt;
end