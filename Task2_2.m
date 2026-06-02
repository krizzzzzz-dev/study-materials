%% Task 2.2 - Visualize the 2-DOF robot at theta1=-30 deg, theta2=80 deg

% ---- Build robot (same as Task 2.1) ----
link1       = rigidBody('link1');
link2       = rigidBody('link2');
endeffector = rigidBody('endeffector');

link1.Joint       = rigidBodyJoint('joint1', 'revolute');
link2.Joint       = rigidBodyJoint('joint2', 'revolute');
endeffector.Joint = rigidBodyJoint('joint_ee', 'fixed');

link1.Joint.HomePosition = 0;
link2.Joint.HomePosition = 0;

setFixedTransform(link1.Joint,       trvec2tform([0.2 0 0]));
setFixedTransform(link2.Joint,       trvec2tform([0.3 0 0]));
setFixedTransform(endeffector.Joint, trvec2tform([0.4 0 0]));

myRobot = rigidBodyTree;
addBody(myRobot, link1,       'base');
addBody(myRobot, link2,       'link1');
addBody(myRobot, endeffector, 'link2');

% ---- Create configuration ----
config = homeConfiguration(myRobot);
config(1).JointPosition = deg2rad(-30);   % theta1
config(2).JointPosition = deg2rad(80);    % theta2

% ---- Visualize ----
figure;
show(myRobot, config);
title('Task 2.2 - theta1 = -30 deg, theta2 = 80 deg');
axis equal;
