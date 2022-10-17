disp('initialize_incident_field_updating_cofficients');

if incident_plane_wave.enabled == false
    return;
end

Cexeic = (2 * (1 - eps_r_x) * eps_0 - dt * sigma_e_x) ...
    ./ (2 * eps_r_x * eps_0 + dt * sigma_e_x);
Cexeip =- (2 * (1 - eps_r_x) * eps_0 + dt * sigma_e_x) ...
    ./ (2 * eps_r_x * eps_0 + dt * sigma_e_x);
%CoeffiecientsupdatingEy
Ceyeic = (2 * (1 - eps_r_y) * eps_0 - dt * sigma_e_y) ...
./ (2 * eps_r_y * eps_0 + dt * sigma_e_y);
Ceyeip =- (2 * (1 - eps_r_y) * eps_0 + dt * sigma_e_y) ...
    ./ (2 * eps_r_y * eps_0 + dt * sigma_e_y);
%CoeffiecientsupdatingEz
Cezeic = (2 * (1 - eps_r_z) * eps_0 - dt * sigma_e_z) ...
./ (2 * eps_r_z * eps_0 + dt * sigma_e_z);
Cezeip =- (2 * (1 - eps_r_z) * eps_0 + dt * sigma_e_z) ...
    ./ (2 * eps_r_z * eps_0 + dt * sigma_e_z);
%CoeffiecientsupdatingHx
Chxhic = (2 * (1 - mu_r_x) * mu_0 - dt * sigma_m_x) ./ (2 * mu_r_x * mu_0 + dt * sigma_m_x);
Chxhip =- (2 * (1 - mu_r_x) * mu_0 + dt * sigma_m_x) ./ (2 * mu_r_x * mu_0 + dt * sigma_m_x);
%CoeffiecientsupdatingHy
Chyhic = (2 * (1 - mu_r_y) * mu_0 - dt * sigma_m_y) ./ (2 * mu_r_y * mu_0 + dt * sigma_m_y);
Chyhip =- (2 * (1 - mu_r_y) * mu_0 + dt * sigma_m_y) ./ (2 * mu_r_y * mu_0 + dt * sigma_m_y);
%CoeffiecientsupdatingHz
Chzhic = (2 * (1 - mu_r_z) * mu_0 - dt * sigma_m_z) ./ (2 * mu_r_z * mu_0 + dt * sigma_m_z);
Chzhip =- (2 * (1 - mu_r_z) * mu_0 + dt * sigma_m_z) ./ (2 * mu_r_z * mu_0 + dt * sigma_m_z);


% Cexeic = (2 * (1 - eps_r_x) * eps_0 - dt * sigma_e_x) ...
%     ./ (2 * eps_r_x * eps_0 + dt * sigma_e_x);
% Cexeip = -(2 * (1 - eps_r_x) * eps_0 + dt * sigma_e_x) ...
%     ./ (2 * eps_r_x * eps_0 + dt * sigma_e_x);
% 
% Ceyeic = (2 * (1 - eps_r_y) * eps_0 - dt * sigma_e_y) ...
%     ./ (2 * eps_r_y * eps_0 + dt * sigma_e_y);
% Ceyeip = -(2 * (1 - eps_r_y) * eps_0 + dt * sigma_e_y) ...
%     ./ (2 * eps_r_y * eps_0 + dt * sigma_e_y);
% 
% Cezeic = (2 * (1 - eps_r_z) * eps_0 - dt * sigma_e_z) ...
%     ./ (2 * eps_r_z * eps_0 + dt * sigma_e_z);
% Cezeip = -(2 * (1 - eps_r_z) * eps_0 + dt * sigma_e_z) ...
%     ./ (2 * eps_r_z * eps_0 + dt * sigma_e_z);
% 
% Chxhic = (2 * (1 - mu_r_x) * mu_0 - dt * sigma_m_x) ...
%     ./ (2 * mu_r_x * mu_0 + dt * sigma_m_x);
% Chxhip = -(2 * (1 - mu_r_x) * mu_0 + dt * sigma_m_x) ...
%     ./ (2 * mu_r_x * mu_0 + dt * sigma_m_x);
% 
% Chyhic = (2 * (1 - mu_r_y) * mu_0 - dt * sigma_m_y) ...
%     ./ (2 * mu_r_y * mu_0 + dt * sigma_m_y);
% Chyhip = -(2 * (1 - mu_r_y) * mu_0 + dt * sigma_m_y) ...
%     ./ (2 * mu_r_y * mu_0 + dt * sigma_m_y);
% 
% Chzhic = (2 * (1 - mu_r_z) * mu_0 - dt * sigma_m_z) ...
%     ./ (2 * mu_r_z * mu_0 + dt * sigma_m_z);
% Chzhip = -(2 * (1 - mu_r_z) * mu_0 + dt * sigma_m_z) ...
%     ./ (2 * mu_r_z * mu_0 + dt * sigma_m_z);