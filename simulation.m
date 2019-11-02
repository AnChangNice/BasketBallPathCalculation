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
    % 计算新阻力
    Fz = V * k;
    % 计算阻力的分量
    Fzx = Fz * cos(teta);
    Fzy = Fz * sin(teta);
    % 计算加速度
    %ax = 0;
    ax = - Fzx / m;
    %ay = - g;
    %ay = - Fzy / m - g + F/m;
    ay = - Fzy / m + g - F/m;
    % 更新速度
    vx = vx + ax * dt;
    vy = vy + ay * dt;
    % 更新位置
    x_ = x_ + vx * dt;
    y_ = y_ + vy * dt;
    % 更新角度
    teta = atan(vy/vx);
    % 更新速度
    V = sqrt(vx^2 + vy^2);
    % 记录数据
    x = [x, x_];
    y = [y, y_];
    % 更新时间
    t = t + dt;
    time = [time, t];
    
    if t > time_last
        break;
    end
end

plot(x, y, '.');