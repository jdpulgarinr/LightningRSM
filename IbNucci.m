function NucciBaseCurrent = IbNucci(time)

% Constants Used in My MSc Thesis (11 kA Peak).
% I1 = 9900;
% I2 = 7500;
% t1 = 7.2e-8;
% t2 = 5e-6;
% t3 = 60e-6;
% t4 = 6e-6;
% n = 0.845;

% Constants Used in Tran 2017 (FDTD Modeling ofLEMP Propagation in the 
% Earth-Ionosphere Waveguide With Emphasis on Realistic Representation of 
% Lightning Source).
I1 = 46.3e3;
I2 = 35e3;
t1 = 7.2e-6;
t2 = 5e-6;
t3 = 100e-6;
t4 = 6e-6;
n = 0.845;

A = (I1/n);
B = (time./t1).^2;
C = ((exp(-time./t2))./(1 + B));

% channel-base current
NucciBaseCurrent = (A.*B.*C) + (I2.*((exp(-time/t3)) - (exp(-time/t4))));