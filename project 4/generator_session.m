% generator session

clc, clear, close all;
format long;

% static vars
rho = 1225; %g/m^3
D = 0.13208; % meters
A = (pi/4)*D^2;
resistance = 120; % ohms
a = (1/3);


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
  power(i) = 2*rho*A*(air_flow(i)^3)*a*(1-a)^2*.001;
  gross_power(i) = 0.5*rho*A*(air_flow(i)^3)*exp(1)*.001; %watts
  coeff_power(i) = power(i)/gross_power(i);
  printf('         %.2f             |        %.2f             |        %.4f\n',air_flow(i),rms(i),gross_power(i))
endfor

x = air_flow;
for i = 1:n
y1(i) = 4.97*10^-03*x(i)^3;
y2(i) = 350 + -31.3*x(i) + 0.738*x(i)^2;
endfor

figure(1)
hold on
grid minor on
plot(air_flow,power,'ro','linewidth',3)
plot(x,y1)
plot(x,y2)
title("Power as a Function of Air Velocity")
xlabel('Power (W)')
ylabel('Air Flow (m/s)')
legend('Power','4.97*10^-03*x^3','350 + -31.3*x + 0.738*x^2')
hold off
##print -dpng figure1gen.png
