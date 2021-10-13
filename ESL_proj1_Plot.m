clc, clear, close all
format long

% data in vector form
x1 = [3.45855; 3.86543;2.77703;2.77703;2.89909;2.8584;2.80754;2.85332;1.58181];
x2 = [3.516607;2.33333;2.1628;2.1628;2.1628;2.072575;2.072575;2.072575;1.58181];
x3 = [3.6871;3.56504;2.74616;2.52746;2.61392;2.56306;2.38505;2.47151;1.50005];
y = [3.7;5;24;24;24;25.5;25.5;25.5;66];

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
scatter(x1,y, 'r','filled')
scatter(x2,y,'g','filled')
scatter(x3,y,'b','filled')
plot(x, T1, 'r')
plot(x, T2, 'g')
plot(x, T3, 'b')
legend("Thermistor 1","Thermistor 2","Thermistor 3")
##text(3.5,3.7,'(3.5,3.7)')
##text(2.8,25.5,'(2.8,25.5)')
##text(1.5,66,'(1.5,66)')
##text(2.07,25.5,'(2.07,25.5)')
print -djpg figure2.jpg
hold off

%print(hf, "plot10_5.png", "png")