function HeidlerBaseCurrent = IbHeidler(time)

% constants
currentPeak = 50e3;
frontTime = 1.2e-6;
tailTime = 50e-6;
n = 2;

% channel-base current
k = time/frontTime;
adjFactor = (k.^n)./(1+(k.^n));
HeidlerBaseCurrent = currentPeak*(((exp(-time/tailTime))).*(adjFactor));