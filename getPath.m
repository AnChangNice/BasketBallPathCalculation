function [x, y, time] = getPath(time_last, V, angle)
%% init parameter
teta = angle * pi / 180;
%% calaculte time
%% calculate path
x = [];
y = [];
time = [];
t = 0;
dt = 0.01;
while true
    x_ = V * cos(teta) * t;
    y_ = V * sin(teta) * t - 0.5 * 9.8 * t^2;
    x = [x, x_];
    y = [y, y_];
    time = [time, t];
    t = t + dt;
    if t > time_last
        break;
    end
end
end

