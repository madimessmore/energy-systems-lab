% lab 4 part 1

clc, clear, close all;
format long;

% static variables
voltage = ones(19,1)*119; % volts
bar_length = 0.24; % meters

% data sets
weight = dlmread('weights.txt');
current = dlmread('current.txt');

n = length(weight);

printf("     ======================================================================\n")
printf("     Voltage (V)    |       Current (A)        |    Calculated Power (W)\n")
printf("     --------       |       --------           |    -------------------\n")

for i = 1:n
  calc_power(i) = voltage(i)*current(i);
  printf("    %.4f        |        %.4f            |        %.4f\n",voltage(i),current(i),calc_power(i))
endfor

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

