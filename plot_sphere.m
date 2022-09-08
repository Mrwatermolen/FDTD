function plot_sphere(center_x, center_y, center_z, radius, color)
%UNTITLED3 此处提供此函数的摘要
%   此处提供详细说明
[x, y, z] = sphere(24);
x = x(:);
y = y(:);
z = z(:);
P = [center_x + x * radius, center_y + y * radius, center_z + z* radius];
P = unique(P,'rows');
shp = alphaShape(P, radius);
plot(shp,'FaceColor', color)
end