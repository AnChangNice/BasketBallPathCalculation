function [Angle, V] = getAllSolution(x, y, d_angle)
%% constant
g = 9.8;
%% calculate resulation
V = [];
Angle = [];
angle_min = atan(y/x) * 180 / pi;
angle_min = ceil(angle_min);
for teta = (angle_min + d_angle):d_angle:(90 - d_angle)
    teta = teta*pi/180;
	one_v2 = ((2*sin(teta)*cos(teta))/g - (2*y*(cos(teta)^2))/(g*x))/x;
	if one_v2 > 0
        v = sqrt(1/one_v2);
        angle = teta * 180 / pi;
        V = [V, v];
        Angle = [Angle, angle];
	end
end
end

