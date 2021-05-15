%% ME4823 Assignment 7
%% Load .bag file and create bag file object. 

fname = '2021-05-12-01-30-52.bag'; 
bag = rosbag(fname);
 
% Display available topics and message types in bag file. 
bag.AvailableTopics

% Create a time series of the Odometry data
% Retrieve the messages as a cell array
odom_msgs = select(bag,'Topic','/rabbit');
 
% Create a timeseries object of the subset of message fields we are interested in
odom_ts = timeseries(odom_msgs,'Point.X','Point.Y','Point.Z');

%% 1) Plot X-Y Position of USV

figure(1); clf();
% Plot the Data index corresponding to 'Pose.Pose.Position.X' & 'Pose.Pose.Position.Y'
plot(odom_ts.Data(:,1),odom_ts.Data(:,2),'LineWidth', 2)
title('(1) X-Y Position of USV')
xlabel('X')
ylabel('Y')
xlim([0 60])
grid on

%% 2) Plots of X vs time and Y vs time of USV

figure(2); clf();
% Plot the Data index corresponding to 'Pose.Pose.Position.X' & 'Pose.Pose.Position.Y'
subplot(2,1,1)
plot(odom_ts.Time, odom_ts.Data(:,1))
title('(2.a) X Position vs Time of USV')
xlabel('Time')
ylabel('X')
grid on
ylim([0 60])

subplot(2,1,2)
plot(odom_ts.Time,odom_ts.Data(:,2))
title('(2.b) Y Position vs time of USV')
xlabel('Time')
ylabel('Y')
grid on

