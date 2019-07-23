close all
clear all
clc

timeVector = linspace(0,1e-4,5000);
heightVector = [0 500 3000];

ChannelParameters.speed = 1.5e8;
ChannelParameters.height = 6e3;
ChannelParameters.lambda = 2e3;

modelOption = 3;
baseCurrentOption = 2;

currentProfile = computeReturnStrokeCurrent(timeVector,heightVector,ChannelParameters,modelOption,baseCurrentOption);

% current-profile plot
for iHeight = 1:length(heightVector)
    plot(timeVector,currentProfile(iHeight,:),'LineWidth',2), hold on;
end
grid on;

title('Return-Stroke Current Profile','Interpreter','LaTeX','FontSize',20)
xlabel('Time [s]','Interpreter','LaTeX','FontSize',20);
ylabel('Current [A]','Interpreter','LaTeX','FontSize',20)
set(gca,'FontSize',20,'FontName','TimesNewRoman')
axis([0 max(timeVector) 0 1.1*max(currentProfile(1,:))])