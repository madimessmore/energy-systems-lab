clc, clear, close all
format long

% data in vector form
x1 = [1.39; 1.396;1.39;1.4;1.397;1.392;1.41];
x2 = [2.56025;2.4753;2.5;2.563;2.43;2.52;2.5879];
x3 = [2.3;2.31;2.33;2.37;2.35;2.335;2.313];
y1 = [74.36576;74.1077696;74.36576;73.936;74.0648104;74.2797184;73.50736];
y2 = [74.33337384;72.40617054;72.875;74.4105935;71.74135;73.3096;75.15212421];
y3 = [72.4218;72.089062;71.429238;70.132198;70.77695;71.2654595;71.98960798];


x = 1:0.01:4;

% equations for our line of best fit
T1 = 145 - 58.6.*x + 5.6*x.^2;
T2 = 310 - 208.*x + 34.4*x.^2;
T3 = 159 - 76.7.*x + 9.42*x.^2;

% figure plotting data points and their respective trendline

hf = figure(1)
figure(1)
hold on
title("Figure 2: Thermistor Calibration Curve")
grid minor on
xlabel('Voltage Output (V)')
ylabel('Actual Temperature (Degrees Celsius)')
scatter(x1,y1, 'r','filled')
scatter(x2,y2,'g','filled')
scatter(x3,y3,'b','filled')
plot(x, T1, 'r')
plot(x, T2, 'g')
plot(x, T3, 'b')
legend("Thermistor 1","Thermistor 2","Thermistor 3")
##text(3.5,3.7,'(3.5,3.7)')
##text(2.8,25.5,'(2.8,25.5)')
##text(1.5,66,'(1.5,66)')
##text(2.07,25.5,'(2.07,25.5)')
##print -djpg figure2.jpg
hold off

%print(hf, "plot10_5.png", "png")