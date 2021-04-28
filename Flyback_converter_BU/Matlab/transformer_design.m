clc;
clear all;

%% Project Requirements

Vi_min=220; %V
Vi_max=400; %V
Vo=12;      %V
Vf=1;       %V
Po=100;     %W

fs_min= 140*10^3;
fs_max= 220*10^3;

%% Flyback Converter

V_secondary=Vo+Vf;  %secondary side
N1= 32;
N2= 4;
ratio=N1/N2;
V_primary=V_secondary*ratio;  %primary side
Dmax=V_secondary/(V_secondary+Vi_min); % Maximum Duty Cycle

%% Calculating the secondary winding inductance  and secondary-side peak current 

Io_max=Po/Vo;
Ls_max=((V_secondary)*(1-Dmax)^2)/(2*Io_max*fs_max); %>L_s
I_secondary_peak=(2*Io_max)/(1-Dmax);
L_secondary= Ls_max;

%% Calculating the primary winding inductance and primary peak current 

L_primary=L_secondary*(ratio^2);
I_primary_peak=I_secondary_peak/ratio;

%% Determining the transformer size

Ae=60;
Bsat= 0.3; % T
AL_value= 454;  % H/turn^2

%% Calculating the primary winding turns 

N1_check=(L_primary*I_primary_peak)/(Ae*Bsat); % N1>N1_check
N1=sqrt(L_primary/AL_value); % turn
N1=round(N1);
NI=ratio*I_primary_peak; %  NI value

%% Calculating the secondary winding turns 

N2=N1/ratio; % turn
N2=round(N2); 

%% Calculating the VCC winding turns 
Vcc=12; % V
Vf_Vcc= 1; % V
N3= N2*((Vcc+Vf_Vcc)/(Vo+Vf)); % Vcc winding turns

%% Calculating Winding Factor

window_area %belirlenecek %m^2
AWG %belirlenecek %m^2

total_copper_area %m^2
fill_factor=total_copper_area/window_area; 

