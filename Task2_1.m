%% Task 2.1 - Build a 2-DOF robot model from scratch

% Step 1: Create bodies
link1 = rigidBody('link1');
link2 = rigidBody('link2');
endeffector = rigidBody('endeffector');

% Step 2: Define joints (revolute = rotates around z-axis)
link1.Joint = rigidBodyJoint('joint1', 'revolute');
link2.Joint = rigidBodyJoint('joint2', 'revolute');
endeffector.Joint = rigidBodyJoint('joint_ee', 'fixed');

% Step 3: Home position = 0 degrees for both joints
link1.Joint.HomePosition = 0;
link2.Joint.HomePosition = 0;

% Step 4: Transformation matrices (distances along x-axis between joints)
% base -> joint1: 0.2 m
% joint1 -> joint2: 0.3 m
% joint2 -> TCP: 0.4 m
tMatrix1 = trvec2tform([0.2 0 0]);
tMatrix2 = trvec2tform([0.3 0 0]);
tMatrix3 = trvec2tform([0.4 0 0]);

% Step 5: Assign transformation matrices to joints
setFixedTransform(link1.Joint, tMatrix1);
setFixedTransform(link2.Joint, tMatrix2);
setFixedTransform(endeffector.Joint, tMatrix3);

% Step 6: Create the robot (multi-body tree)
myRobot = rigidBodyTree;

% Step 7: Connect bodies
addBody(myRobot, link1, 'base');
addBody(myRobot, link2, 'link1');
addBody(myRobot, endeffector, 'link2');

% Show robot at home position
show(myRobot);
title('Task 2.1 - 2-DOF Robot (home position)');
