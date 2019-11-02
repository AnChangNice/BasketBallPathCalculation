function [Angle, V] = getAllSolutionWithAir(x, y, d_teta)
%% constant
F = 0.17*0.6;      % float force
k = 0.53;  % drag force / speed
g = 9.8;    % gravity constant
m = 0.6; % mass of ball

%% calculate parameter
dv = 0.01;
dy = 0.01;
v_max = 100;

%% calculate resulation
V = [];
Angle = [];
teta_min = atan(y/x) * 180 / pi;
teta_min = ceil(teta_min);
for teta = (teta_min + d_teta):d_teta:(90 - d_teta)
	teta = teta*pi/180;
	% find a solution
    v_min = k*x/(m*cos(teta));
    for v = (v_min+dv):dv:v_max
        c1 = (m/k)*(v*sin(teta)-(m/k)*(F/m - g));
        c2 = -c1;
        t = - (m/k)*log(1 - (k*x)/(m*v*cos(teta)));
        y_ = c1 + c2*exp(-(k/m)*t) + (m/k)*(F/m - g)*t;
        deta = y - y_;
        if deta < 0
            angle = teta * 180 / pi;
            V = [V, v];
            Angle = [Angle, angle];
            break;
        end
    end
end
end

