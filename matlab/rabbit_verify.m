% ME4823 
% LT S. Royster
% HW7
% Spring 2021
clear all
close all
clc

%Load the file
fname = '2021-05-16-10-15-30.bag';       % Filename
%Create a bag file object with the file name
bag = rosbag(fname)
%Display a list of the topics and message types in the bag file
bag.AvailableTopics

%Create time series for the Odometry & Command data
%Retrieve the messages as a cell array
rabbit_msgs = select(bag,'Topic','/rabbit');
%Create a timeseries object of the subset of message fields we are interested in
rabbit_ts = timeseries(rabbit_msgs,'Point.X','Point.Y');



%Plot X / Y Positions of the Rabbit
figure(1); clf();
%Plot the Data indicies for X and Y
plot(rabbit_ts.Data(:,2),rabbit_ts.Data(:,1))
xlabel('East [m]')
ylabel('North [m]')
legend('Rabbit Position')
title('Rabbit X/Y Position')
axis padded

grid on

%Plot X & Y vs Time
figure(2); clf();
%Plot X vs time
subplot(2,1,1)
plot(rabbit_ts.Time-rabbit_ts.Time(1),rabbit_ts.Data(:,1))
xlabel('Time [s]')
ylabel('X-position (NORTH) [m]')
legend('Rabbit position')
title('X & Y position vs. Time')
axis padded
grid on
%Plot Y vs Time
subplot(2,1,2)
plot(rabbit_ts.Time-rabbit_ts.Time(1),rabbit_ts.Data(:,2))
grid on
xlabel('Time [s]')
ylabel('Y-position (EAST) [m]')
legend('Rabbit Position')
axis padded

