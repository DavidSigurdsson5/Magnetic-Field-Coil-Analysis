%% Magnetic Field Coil (MFC) Experiment Analysis
% This script processes experimental data from an MFC experiment to analyze
% the magnetic field around a single coil and a two-coil system.
% 
% The script reads data from 'mfcreal.xlsx', processes it, and compares measured
% and theoretical magnetic field values using MATLAB calculations and visualization.

clear all; close all; clc;

%% Load Data from Excel File
% Read the experimental data from 'mfcreal.xlsx'
gogn = readtable('mfcreal.xlsx');
data = table2array(gogn);

%% Define Experiment Parameters
% These parameters define the setup of the coils used in the experiment.
I1 = 0.47;  % Current for one of the runs (Amperes)
I2 = 0.8;   % Current for another run (Amperes)
I3 = 0.25;  % Current for a different run (Amperes)
I = I2;     % Select the current value for this particular run
N = 200;    % Number of turns in the coil
d = 20;     % Distance between coils (cm)
R = 19.5/2 * 10^(-2);  % Coil radius (converted to meters)
mu = 4*pi*10^(-7);     % Magnetic permeability of free space (H/m)

%% Process Magnetic Field Data
% Extract positional data and measured magnetic field strength from the dataset.
pos = data((30:350),3); % Extract positional data
pos = pos - 0.127; % Adjust for sensor alignment offset
mag = data((30:350),4); % Extract measured magnetic field values
mag = (-1)*mag*10^(-4); % Convert to Gauss and invert sign

%% Compute Theoretical Magnetic Field Values
% Using the Biot-Savart law to compute expected values for comparison.
ofan = mu*N*I*(R^2); % Precompute numerator of Biot-Savart formula
x3 = pos.^2;
R2 = R^2;
i = 1;
Bx = zeros(length(pos),1);
for c = 1:length(pos)
    Bx(i) = (ofan./(2.*(x3(c)+R2).^(3/2))).*10^4; % Compute field value in Gauss
    i = i + 1;
end

%% Fit a Polynomial to Theoretical Data for Smoother Visualization
p = polyfit(pos,Bx,2);
y = polyval(p,pos);

%% Plot Results
figure;
plot(pos,Bx,'LineWidth',3) % Plot theoretical values
hold on;
plot(pos,mag,'.') % Plot measured values

title('Magnetic Field Analysis with I = 0.8 A')
legend('Theoretical Values','Measured Values')
grid on;
xlabel('Position x [m]')
ylabel('Magnetic Field B [Gauss]')

% Save figure as an image
saveas(gcf,'highI.png')

%% Compute Magnetic Field in Coil Center
B0 = (mu*N*I)/(2*R)*10^4; % Expected central magnetic field
max_value = max(mag); % Maximum measured value
error = max_value - B0; % Difference between measured and theoretical

%% Additional Runs: Lower Current Cases
% Repeat analysis with lower current values and different coil configurations
clear all; close all; clc;
gogn = readtable('mfcreal.xlsx');
data = table2array(gogn);

% Extract positional and field data for lower current scenario
pos = data((23:360),5);
pos = pos - 0.1371;
mag = data((23:360),6);
mag = (-1).*mag.*10^-3;

% Define coil parameters
I = 0.47;
N = 200;
d = 20; %cm
R = (19.5/2)*10^-2;
mu = 4*pi*10^(-7);

% Compute theoretical field values
Bx = abs((mu.*N.*I.*R.^2)./(2.*(pos.^(2)+R.^2).^(3/2)))*10^4;

% Plot results
figure;
plot(pos,mag) % Measured values
hold on;
plot(pos,Bx)  % Theoretical values
legend('Measured Values','Theoretical Values')
xlabel('Position x [m]')
ylabel('Magnetic Field B [Gauss]')
grid on;

title('Magnetic Field Analysis with I = 0.47 A')

% Save figure
saveas(gcf,'lowI.png')

%% Additional Configurations: Two-Coil Setup
clear all; close all; clc;
gogn = readtable('mfcreal.xlsx');
data = table2array(gogn);

% Extract data for two-coil scenario
pos = data((16:399),7);
x = pos;
mag = data((16:399),8);
mag = mag.*10^-4;

% Define parameters for two-coil case
N = 200;
d = 20*10^-2; %cm
R = (19.5/2)*10^-2;
mu = 4*pi*10^(-7);
I = 0.21;

i = 1;
xx2 = flip(-x);
xx1 = [xx2;x];
R2 = R^2;
ofan = mu*N*I*(R^2);
x3 = pos.^2;

% Compute theoretical values for two-coil system
Bx = zeros(length(xx1),1);
for c = 1:length(xx1)
    Bx(i) = ((ofan./(2.*((xx1(c)+d/2).^2+R2).^(3/2))).*10^4 + ...
            (ofan./(2.*((xx1(c)-d/2).^2+R2).^(3/2))).*10^4 );
    i = i + 1;
end

% Plot comparison
figure;
plot(xx1,Bx,'b','Linewidth',2) % Theoretical
hold on;
plot(x,mag,'.') % Measured

title('Two-Coil System Magnetic Field')
grid on;
xlabel('Position x [m]')
ylabel('Magnetic Field B [Gauss]')
legend('Theoretical Values','Measured Values')

% Save figure
saveas(gcf,'2spools.png')

%% Summary
% This script analyzes different coil configurations, processes experimental
% data, and compares measured vs. theoretical values. Adjustments may be needed
% based on sensor accuracy and experimental conditions.
