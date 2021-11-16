% generator session

clc, clear, close all;
format long;

% static vars
rho = 1225; %g/m^3
D = 0.13208; % meters
A = (pi/4)*D^2;

% importing data
air_flow = dlmread("air_flow.txt");
rms = dlmread("voltage_rms.txt");
n = length(air_flow);

% beginning of table
printf("  =====================================================================================\n")
printf("     Air Velocity (m/s)    |     RMS Voltage (V)     |      Gross Power (W)\n")
printf("     -----------------     |    --------------       |    -------------------\n")

% power calc
i = 1;
for i = 1:n
gross_power(i) = 0.5*rho*A*(air_flow(i)^3)*exp(1);
printf('         %.2f             |        %.2f             |        %.4f\n',air_flow(i),rms(i),gross_power(i))
endfor
