% lab 4 part 1

clc, clear, close all;
format long;

% static variables
voltage = ones(19,1)*119; % volts
bar_length = ones(19,1)*0.24; % meters
gravity_accel = ones(19,1)*9.810; %m/s^2
friction_coeff = 0.3;

% data sets
weight = dlmread('weights.txt');
current = dlmread('current.txt');

n = length(weight);

printf("     =============================================================================================\n")
printf("     Voltage (V)    |       Current (A)        |       Torque (n*m)       |     Calculated Power (W)\n")
printf("     --------       |       --------           |       --------           |    -------------------\n")

for i = 1:n
  calc_power(i) = voltage(i)*current(i);
  torque_grams(i) = weight(i)*gravity_accel(i)*bar_length(i); %g*m^2/s^2
  torque(i) = torque_grams(i)/1000; % N*m
  printf("    %.4f        |        %.4f            |        %.4f            |        %.4f\n",voltage(i),current(i),torque(i),calc_power(i))
endfor

printf("     =============================================================================================\n")


% trendline equations
x = weight;
for i = 1:n
y1(i) = x(i)*(7.92*10^-5) + 0.735;
y2(i) = x(i)*(9.47*10^-3)+87.3;
endfor

% figures
figure(1)
hold on
grid minor on
scatter(weight,current, 'b', 'linewidth', 3)
plot(x,y1)
title("Current as a Function of Weight Added")
xlabel("Weight Added (grams)")
ylabel("Current (A)")
legend('Current', "x*(7.92*10^-5) + 0.735")
hold off
##print -dpng figure1.png

figure(2)
hold on
grid minor on
plot(weight,calc_power,'ro','linewidth',3)
plot(x,y2)
title("Calculated Power as a Function of Weight Added")
xlabel('Weight Added (grams)')
ylabel('Calculated Power (W)')
legend('Power', "x*(9.47*10^-3)+87.3")
hold off
##print -dpng figure2.png

figure(3)
hold on
grid minor on
plot(torque,calc_power,'ro','linewidth',3)
title("Calculated Power as a Function of Torque")
xlabel('Torque (N*m)')
ylabel('Calculated Power (W)')
legend('Power')
hold off
##print -dpng figure3.png

figure(4)
hold on
grid minor on
scatter(torque,current, 'b', 'linewidth', 3)
title("Current as a Function of Torque")
xlabel("Torque (N*m)")
ylabel("Current (A)")
legend('Current')
hold off
##print -dpng figure4.png
