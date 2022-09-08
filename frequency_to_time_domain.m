function [x] = frequency_to_time_domain(X, df, time_array)
%UNTITLED6 此处提供此函数的摘要
%   此处提供详细说明
number_frequencies = size(X, 2);
number_time_points = size(time_array, 2);
x = zeros(1, number_time_points);
dw = 2 * pi * df;
x = X(1);
for m = 2:number_frequencies
    w = (m - 1) * dw;
    x = x + X(m) * exp(1i * w * time_array) ...
        + conj(X(m)) * exp(-1i * w * time_array);
end
x = x * df;
end