% sources of Uncertainty:
% ruler, thermometer, DAQ
res_ruler = 1; %mm
res_thermometer = 1; %celsius

% DAQ absolute accuracy (from datasheet)
daq_unc = 4.28;

% resolution error (uo)
uo_ruler = 0.5*res_ruler;
uo_thermometer = 0.5*res_thermometer;

% calculate design stage uncertainty
ud = sqrt((uo_thermometer^2)+(uo_ruler^2)+(daq_unc^2))

uA = uo_thermometer*2;

%using k = q/A(delT), we know compound:
uk = sqrt((2*daq_unc^2)+(uA)^2+(uo_thermometer)^2)