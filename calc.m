close all
clear all
clc

% Vacuum Constants.
u0 = 4*pi*1e-7;
e0 = 8.8541878176*1e-12;
c = 1/sqrt(u0*e0);

timeVector = linspace(0,100e-6,5000);
heightVector = 0;

ChannelParameters.speed = c/2;
ChannelParameters.height = 7e3;
ChannelParameters.lambda = 2e3;


modelOption = 2;    % TL = 1, MTLL = 2, MTLE = 3
baseCurrentOption = 1;  % Nucci = 1, Heidler = 2

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