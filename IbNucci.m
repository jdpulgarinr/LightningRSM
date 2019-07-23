function NucciBaseCurrent = IbNucci(time)

% constants
I1 = 9900;
I2 = 7500;
t1 = 7.2e-8;
t2 = 5e-6;
t3 = 60e-6;
t4 = 6e-6;
n = 0.845;

A = (I1/n);
B = (time./t1).^2;
C = ((exp(-time./t2))./(1 + B));

% channel-base current
NucciBaseCurrent = (A.*B.*C) + (I2.*((exp(-time/t3)) - (exp(-time/t4))));