function shiftedBaseCurrent = shiftBaseCurrent(time,shiftFactor,channelBaseCurrent)

if channelBaseCurrent == 1 %Nucci
    shiftedBaseCurrent = IbNucci(time-shiftFactor).*(time>=shiftFactor);
elseif channelBaseCurrent == 2 %Heidler
    shiftedBaseCurrent = IbHeidler(time-shiftFactor).*(time>=shiftFactor);
end