%% close all
close all;
clc;

%% init parameter
X = 6.75;
Y = 3.05;
dY = 2;

%% get solution
[Angle, V] = getAllSolution(X, Y-dY, 1);
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
        time = X / (v * cos(angle*pi/180));
        [x, y, t] = getPath(time, v, angle);
        plot(x, y+dY, '.');
        str = '';
        str = sprintf('Angle=%2.0f,V=%2.2f,t=%2.3f\n', angle, v, t(end));
        text = [text, str];
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


