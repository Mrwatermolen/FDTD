clear;
close all;
clc;

disp("fdtt_solve");

% 定义问题
define_problem_space_parameters; % ok
define_geometry; % ok
% 集总元件
define_sources_and_lumped_elements; % ok
define_output_parameters;

% 初始化问题空间和参数
initialize_fdtd_material_grid; % ok

initialize_fdtd_parameters_and_arrays; % ok
initialize_sources_and_lumped_elements; % ok
initialize_updating_coeffients; % ok
initialize_boundary_conditions;
initialize_output_paprameter;
initialize_farfield_arrays;
initialize_display_parameters;

run_fdtd_time_marching_loop;

post_process_and_display_results;
