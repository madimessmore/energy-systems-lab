% generator session

clc, clear, close all;
format long;

% static vars
rho = 1225; %g/m^3
D = ;
A = (pi/4)*D^2;

% importing data
air_flow = dlmread("air_flow.txt");
rms = dlmread("voltage_rms.txt");

% power calc
gross_power = 0.5*rho*A*air_flow^3*e