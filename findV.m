%% init parameter
% give angle
angle = 45;
% give x
x = 6.75;
% give y
y = 3.05;
% 
teta = angle * pi / 180;
F = 0.17*0.6;      % float force
k = 0.53;  % drag force / speed
g = 9.8;    % gravity constant
m = 0.6; % mass of ball

%% test V
Vmax = 100;
Vmin = 0;
dV = 0.001;
V = [];
error = [];
dif_min = Inf;
for v = Vmin:dV:Vmax
    c1 = (m/k)*(v*cos(teta) - (m/k)*(F/m - g));
    c2 = -c1;
    t = - (m/k)*log(1-(k*x)/(m*v*cos(teta)));
    dif = c1 + c2*exp(-(k/m)*t) + (m/k)*(F/m - g)*t - y;
    dif = abs(dif);
    if dif < dif_min
        dif_min = dif;
        disp(t)
        disp(v);
    end
    V = [V, v];
    error = [error, dif];
end
plot(V, error, '.');