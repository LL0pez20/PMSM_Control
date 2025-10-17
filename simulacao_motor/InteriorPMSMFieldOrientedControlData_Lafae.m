%% Parameters file for SPS model: InteriorPMSMFieldOrientedControl.slx 

%% SPS sample time (s)
Ts = 10e-6;

%% Parameters Variations
Ld_var = 0.9*1.597e-3;        % Stator d-axis inductance (H)
Lq_var = 0.9*2.057e-3;        % Stator q-axis inductance (H)
Rs_var = 1*6.5e-3;          % Stator resistance per phase (Ohm)
lambda_var = 1*0.1757;      % Permanent magnet flux linkage (V.s)

% Reduzindo:
% O sistema suporta variações de até 50% dos valores de indutância, 10% do
% fluxo magnético e de até 100% da resistência.

% Aumentando:
% O sistema suporta variações de até 3% dos valores de indutância, 30% do
% fluxo magnético (com algum erro de torque) e 1e8 e mais da resistência.

% Conclui-se que a alterção da resistência é um parâmetro irrelevante para
% a qualificação do controle.

%% Motor parameters
Tnom = 400;           % Nominal torque (N.m)
wnom = 1200;          % Nominal motor speed (rpm)
wmax = 6000;          % Maximum motor speed (rpm)
Ld = 1.597e-3;        % Stator d-axis inductance (H)
Lq = 2.057e-3;        % Stator q-axis inductance (H)
Rs = 6.5e-3;          % Stator resistance per phase (Ohm)
lambda = 0.1757;      % Permanent magnet flux linkage (V.s)
p = 4;                % Number of pole pairs
J = 0.09;             % Rotor inertia (Kg.m^2)
F = 0.002;            % Friction coefficient (N.m.s)
Vdc_nom = 550;        % Nominal DC voltage (V)

%% Control parameters - Pole Cancellation with Classical Control Methods

% First, calculate plant time constants
Td = Ld/Rs;           % d-axis electrical time constant
Tq = Lq/Rs;           % q-axis electrical time constant
Tm = J/F;             % Mechanical time constant

% Current loop design with pole cancellation
% For d-axis current controller
Kp_Id = Ld/Ts;        % Proportional gain for d-axis current controller
Ki_Id = Rs/Ts;        % Integral gain for d-axis current controller

% For q-axis current controller
Kp_Iq = Lq/Ts;        % Proportional gain for q-axis current controller
Ki_Iq = Rs/Ts;        % Integral gain for q-axis current controller

% For unified current regulator (using average of d and q axis values)
Kp_Ireg = (Kp_Id + Kp_Iq)/2;  % Proportional gain
Ki_Ireg = (Ki_Id + Ki_Iq)/2;  % Integral gain
Limit_Ireg = Vdc_nom/sqrt(3); % Regulator output limit

% Classical Methods
% Bandwidth Calculation for the Speed Control

t_ro = J*wnom/Tnom; % Open-loop rise time 
t_rc = 0.2*t_ro; % Closed-loop rise time
alpha_s = log(9)/t_rc; % Bandwidth

% Speed Control

eta = 0.61;
Kp_wreg = alpha_s * J;  % Ganho proporcional
Ki_wreg = (alpha_s/(2*eta))^2*J; % Ganho Integral
Limit_wreg = Tnom;             % Regulator output limit

% Torque Limiter
rpm_data = [0 1200 2000 3000 4000 5000 6000];  % Speed (rpm)
Tmax_data = [400 400 225 150 100 80 70];       % Torque(N.m)

% SVPWM switching frequency (Hz)
Fsw = 8000;

% Display the new controller parameters
disp('Current Controller Parameters:');
fprintf('Kp_Ireg = %.4f\n', Kp_Ireg);
fprintf('Ki_Ireg = %.4f\n', Ki_Ireg);
fprintf('Limit_Ireg = %.4f\n', Limit_Ireg);

disp('Speed Controller Parameters:');
fprintf('Kp_wreg = %.4f\n', Kp_wreg);
fprintf('Ki_wreg = %.4f\n', Ki_wreg);
fprintf('Limit_wreg = %.4f\n', Limit_wreg);
