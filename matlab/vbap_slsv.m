function [v_c, r_c] = vbap_slsv(usv_odom, rabbit_position)
% Function prototype for implementing 
% Virtual Body, Artificial Potential - Single Leader, Single Vehicle
Xerr = usv_odom.Position.X - rabbit_position.Point.X;
Yerr = usv_odom.Position.Y - rabbit_position.Point.Y;
psi = usv_odom.Angular.Z; 

R = [cos(psi) -sin(psi); sin(psi) cos(psi)]; 
u = usv_odom.Linear.X; 
v = usv_odom.Linear.Y; 

% Xerr = usv_odom.Pose.Pose.Position.X - rabbit_position.Point.X;
% Yerr = usv_odom.Pose.Pose.Position.Y - rabbit_position.Point.Y;
% psi = usv_odom.Twist.Twist.Angular.Z; 
% 
% R = [cos(psi) -sin(psi); sin(psi) cos(psi)]; 
% u = usv_odom.Twist.Twist.Linear.X; 
% v = usv_odom.Twist.Twist.Linear.Y; 

kvl = 1; kdx = 0.1; kdy = 0.1; % Set arbitary gains for now
xu_dotdot = -kvl * abs(Xerr)*Xerr / sqrt(Xerr^2) - kdx*u; 
yu_dotdot = -kvl * abs(Yerr)*Yerr / sqrt(Yerr^2) - kdy*v; 

uv_dot = R'*[xu_dotdot; yu_dotdot];

% Just setting surge velocity and yaw-rate commands to zero.
kr = 1; % Set arbitary gain for now
dt = 1; 

v_c = u + uv_dot(1)*dt;
r_c = kr * uv_dot(2); 
return
