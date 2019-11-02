clear;
%% software simulate
V = 10;
angle = 45;
time_last = 2;
teta = angle * pi / 180;
F = 0.17*0.6;      % float force
k = 0.53;  % drag force / speed
g = 9.8;    % gravity constant
m = 0.6; % mass of ball

x = [];
y = [];
x_ = 0;
y_ = 0;
vx = V * cos(teta);
vy = V * sin(teta);
time = [];
t = 0;
dt = 0.01;
while true
    % ����������
    Fz = V * k;
    % ���������ķ���
    Fzx = Fz * cos(teta);
    Fzy = Fz * sin(teta);
    % ������ٶ�
    %ax = 0;
    ax = - Fzx / m;
    %ay = - g;
    %ay = - Fzy / m - g + F/m;
    ay = - Fzy / m + g - F/m;
    % �����ٶ�
    vx = vx + ax * dt;
    vy = vy + ay * dt;
    % ����λ��
    x_ = x_ + vx * dt;
    y_ = y_ + vy * dt;
    % ���½Ƕ�
    teta = atan(vy/vx);
    % �����ٶ�
    V = sqrt(vx^2 + vy^2);
    % ��¼����
    x = [x, x_];
    y = [y, y_];
    % ����ʱ��
    t = t + dt;
    time = [time, t];
    
    if t > time_last
        break;
    end
end

plot(x, y, '.');