function currentProfile = computeReturnStrokeCurrent(timeVector,heightVector,ChannelParameters,modelOption,baseCurrentOption)

% current-profile matrix preallocation
currentProfile = zeros(length(heightVector),length(timeVector));

% current shifting and attenuation
for iHeight = 1:length(heightVector)
    timeToHeight = heightVector(iHeight)/ChannelParameters.speed;
    currentProfile(iHeight,:) = shiftBaseCurrent(timeVector,timeToHeight,baseCurrentOption);
    
    % calculation of the attenuation factor
    if modelOption == 1 %TL model
        % attenuation factor:
        attenuationFactor = 1;
    elseif modelOption == 2 %MTLL model
        % attenuation factor:
        attenuationFactor = 1 - (heightVector(iHeight)/ChannelParameters.height);
    elseif modelOption == 3 %MTLE model
        % attenuation factor:
        attenuationFactor = exp(-heightVector(iHeight)/ChannelParameters.lambda);
    end
    
    % application of the attenuation factor
    currentProfile(iHeight,:) = attenuationFactor*currentProfile(iHeight,:);
end