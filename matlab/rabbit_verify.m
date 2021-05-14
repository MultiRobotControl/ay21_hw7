%% ME4823 Assignment 7
%% Load .bag file and create bag file object. 

fname = '2021-05-12-01-30-52.bag'; 
bag = rosbag(fname);
 
% Display available topics and message types in bag file. 
bag.AvailableTopics

% Create a time series of the Odometry data
% Retrieve the messages as a cell array
<<<<<<< HEAD
odom_msgs = select(bag,'Topic','/rabbit');
 
% Create a timeseries object of the subset of message fields we are interested in
odom_ts = timeseries(odom_msgs,'Point.X','Point.Y','Point.Z');
=======
odom_msgs = select(bag,'Topic','PointStamped');
 
% Create a timeseries object of the subset of message fields we are interested in
odom_ts = timeseries(odom_msgs,'Pose.Pose.Position.X','Pose.Pose.Position.Y', ...
    'Pose.Pose.Orientation.W','Pose.Pose.Orientation.X','Pose.Pose.Orientation.Y',...
    'Pose.Pose.Orientation.Z','Twist.Twist.Linear.X','Twist.Twist.Angular.Z');
>>>>>>> 5d7eb0c0646100bce6760c6a5eea0734d1525256

%% 1) Plot X-Y Position of USV

figure(1); clf();
% Plot the Data index corresponding to 'Pose.Pose.Position.X' & 'Pose.Pose.Position.Y'
<<<<<<< HEAD
plot(odom_ts.Data(:,1),odom_ts.Data(:,2),'LineWidth', 2)
title('(1) X-Y Position of USV')
xlabel('X')
ylabel('Y')
xlim([0 60])
=======
plot(odom_ts.Data(:,1),odom_ts.Data(:,2))
title('(1) X-Y Position of USV')
xlabel('X')
ylabel('Y')
>>>>>>> 5d7eb0c0646100bce6760c6a5eea0734d1525256
grid on

%% 2) Plots of X vs time and Y vs time of USV

figure(2); clf();
% Plot the Data index corresponding to 'Pose.Pose.Position.X' & 'Pose.Pose.Position.Y'
subplot(2,1,1)
<<<<<<< HEAD
plot(odom_ts.Time, odom_ts.Data(:,1))
=======
plot(odom_ts.Data(:,1),odom_ts.Data(:,2))
>>>>>>> 5d7eb0c0646100bce6760c6a5eea0734d1525256
title('(2.a) X Position vs Time of USV')
xlabel('Time')
ylabel('X')
grid on
<<<<<<< HEAD
ylim([0 60])

subplot(2,1,2)
plot(odom_ts.Time,odom_ts.Data(:,2))
=======

subplot(2,1,2)
plot(odom_ts.Data(:,1),odom_ts.Data(:,2))
>>>>>>> 5d7eb0c0646100bce6760c6a5eea0734d1525256
title('(2.b) Y Position vs time of USV')
xlabel('Time')
ylabel('Y')
grid on

