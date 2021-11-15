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
  calc_power(i) = weight(i)*current(i);
  printf("    %.4f        |        %.4f            |        %.4f\n",voltage(i),current(i),calc_power(i))
endfor

