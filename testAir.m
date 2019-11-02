%% close all
close all;
clc;

%% init parameter
X = 6.75;
Y = 3.05;
dY = 2;

%% constant
F = 0.17*0.6;      % float force
k = 0.53;  % drag force / speed
g = 9.8;    % gravity constant
m = 0.6; % mass of ball

%% get solution
[Angle, V] = getAllSolutionWithAir(X, Y-dY, 1);
figure;
plot(Angle, V, '.');
title('solution');

%% show all result
figure;
title('All Solution');
hold on;
text = [];
for i = 1:length(V)
    v = V(i);
    angle = Angle(i);
    if int8(angle) == 40 || int8(angle) == 50 || int8(angle) == 60
        teta = angle*pi/180;
        time = - (m/k)*log(1 - (k*X)/(m*v*cos(teta)));
        [x, y, t] = getPathWithAir(time, v, angle);
        plot(x, y+dY, '.');
        strtemp = '';
        strtemp = sprintf('Angle=%2.2f,V=%2.2f,t=%2.3f\n', angle, v, t(end));
        text = [text,strtemp];
    end
end
legend(text(1:end-1));
axis equal;
grid on;
plot(X, Y, 'o');
axis([0, 7, 1.5, 7]);
xlabel('Distance');
ylabel('High');
hold off;
