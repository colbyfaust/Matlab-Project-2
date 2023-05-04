clc
clear all
syms theta

gamma = 1.4; R = 287; r = 8.4; L = 12; S = 8; V0 = 50; b = 9; T1 = 300;
theta_s = 3*pi/2; ; q_in = 2.8*10^6; Tw = 300;E = 8/(2*12); theta_b = pi;
% p = 1.013e5;
%dV= dv(theta);


tspan = [pi 3*pi];
y0 = [1.013e5 0];

sol = ode45(@Q1,tspan,y0)







function X =x(theta)

gamma = 1.4; R = 287; r = 8.4; L = 12; S = 8; V0 = 50; b = 9; T1 = 300;
theta_s = 3*pi/2; ; q_in = 2.8*10^6; Tw = 300;E = 8/(2*12); theta_b = pi;


if (pi<= theta)&& (theta <= theta_s)

    X = 0;
elseif (theta_s <= theta) && (theta <= theta_s+theta_b)

    X = .5*(1-cos((pi*(theta-theta_s))/theta_b));

elseif  (theta_s+theta_b <=  theta) && (theta<=3*pi)

    X = 1;

end
end
 
 
function Derx = dx(theta)
gamma = 1.4; R = 287; r = 8.4; L = 12; S = 8; V0 = 50; b = 9; T1 = 300;
theta_s = 3*pi/2; ; q_in = 2.8*10^6; Tw = 300;E = 8/(2*12); theta_b = pi;

if (pi<= theta)&& (theta <= theta_s)

    Derx = 0;
elseif (theta_s <= theta) && (theta <= theta_s+theta_b)

    Derx = sin(theta - (3*pi)/2)/2;
elseif  (theta_s+theta_b <=  theta) && (theta<=3*pi)

    Derx = 0;
end
end



function [dP] = Q1(theta,p)

gamma = 1.4; R = 287; r = 8.4; L = 12; S = 8; V0 = 50; b = 9; T1 = 300;
theta_s = 3*pi/2; theta_b = pi; qin = 2.8*10^6; Tw = 300;E = 8/(2*12);



dP = [(gamma*(p(1)*dV(theta))/V(theta))+(gamma-1)*((M(theta)*qin)/V(theta)*dx)-(gamma-1)*h*(Aw)*(T*(theta)-Tw)/(V*w)-((gamma*m1)/(M(theta)*w))*P(theta);
       p(1)*dV(theta)]
end

% function VolumeDer = dv(theta)
% VolumeDer = diff(V(theta),1);
% 
% end

 function deltaV = dV(theta)

deltaV = 185*sin(theta) + (185*cos(theta)*sin(theta))/(3*(1 - sin(theta)^2/9)^(1/2));
end

function Temp = T(theta,p)

gamma = 1.4; R = 287; r = 8.4; L = 12; S = 8; V0 = 50; b = 9; T1 = 300;
theta_s = 3*pi/2; theta_b = pi; q_in = 2.8*10^6; Tw = 300; ;E = 8/(2*12);


Temp = (p(1)*v)/((M(theta))*(R));

end
 
function mass = M(theta)

gamma = 1.4; R = 287; r = 8.4; L = 12; S = 8; V0 = 50; b = 9; T1 = 300;
theta_s = 3*pi/2; theta_b = pi; q_in = 2.8*10^6; Tw = 300; p = 1.013e5;E = 8/(2*12);M0 = pi; C = .8; w = 50;

mass = M0*exp(-C/w)*(theta-pi);

end

function Volume = V(theta)

gamma = 1.4; R = 287; r = 8.4; L = 12; S = 8; V0 = 50; b = 9; T1 = 300;
theta_s = 3*pi/2; theta_b = pi; q_in = 2.8*10^6; Tw = 300; p = 1.013e5;E = 8/(2*12);


 Volume = V0*(1+((r-1)/(2*E))*(1+E*(1-cos(theta))-sqrt(1-E^2*(sin(theta))^2)));
end
