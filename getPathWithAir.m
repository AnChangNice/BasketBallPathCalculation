function [x, y, time] = getPathWithAir(time_last, V, angle)
%% init parameter
teta = angle * pi / 180;
F = 0.17*0.6;      % float force
k = 0.53;  % drag force / speed
g = 9.8;    % gravity constant
m = 0.6; % mass of ball
%% calaculte time
%% calculate path
x = [];
y = [];
time = [];
t = 0;
dt = 0.01;
c1 = (m/k) * (V*sin(teta) - (m/k) * (F/m - g));
c2 = -c1;
while true
    x_ = (m/k) * V * cos(teta) * (1 - exp(-(k/m) * t));
    y_ = c1 + c2 * exp(-(k/m) * t) + (m/k) * (F/m - g) * t;
    x = [x, x_];
    y = [y, y_];
    time = [time, t];
    t = t + dt;
    if t > time_last
        break;
    end
end
end

