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
figure;
[Angle, V] = getAllSolution(X, Y-dY, 1);
plot(Angle, V, '.');
hold on;
[Angle, V] = getAllSolutionWithAir(X, Y-dY, 1);
plot(Angle, V, 'x');
hold off;
grid on;
legend('no air','air');
title('Some Solution');
xlabel('Angle deg');
ylabel('Speed m/s');

%% plot all path
figure;
title('Some Solution Path');
hold on;
text = string;
% no air
[Angle, V] = getAllSolution(X, Y-dY, 1);
for i = 1:length(V)
    v = V(i);
    angle = Angle(i);
    if int8(angle) == 40 || int8(angle) == 50 || int8(angle) == 60
        time = X / (v * cos(angle*pi/180));
        [x, y, t] = getPath(time, v, angle);
        plot(x, y+dY, '.');
        str = '';
        str = sprintf('Angle=%2.0f,V=%2.2f,t=%2.3f\n', angle, v, t(end));
        text = [text, str];
    end
end
% with air
[Angle, V] = getAllSolutionWithAir(X, Y-dY, 1);
for i = 1:length(V)
    v = V(i);
    angle = Angle(i);
    if int8(angle) == 40 || int8(angle) == 50 || int8(angle) == 60
        teta = angle*pi/180;
        time = - (m/k)*log(1 - (k*X)/(m*v*cos(teta)));
        [x, y, t] = getPathWithAir(time, v, angle);
        plot(x, y+dY, 'x');
        str = '';
        str = sprintf('Angle=%2.2f,V=%2.2f,t=%2.3f\n', angle, v, t(end));
        text = [text,str];
    end
end

axis equal;
grid on;
plot(X, Y, 'o');
legend(text(2:end), 'Basket');
axis([0, 7, 1.5, 7]);
xlabel('Distance (m)');
ylabel('High (m)');
hold off;
