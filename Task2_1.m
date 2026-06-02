%% Task 2.1 - Build a 2-DOF planar robot model

% --- Bodies ---
link1       = rigidBody('link1');
link2       = rigidBody('link2');
endeffector = rigidBody('endeffector');

% --- Joints ---
link1.Joint       = rigidBodyJoint('joint1', 'revolute');
link2.Joint       = rigidBodyJoint('joint2', 'revolute');
endeffector.Joint = rigidBodyJoint('joint_ee', 'fixed');

% --- Home positions (0 deg) ---
link1.Joint.HomePosition = 0;
link2.Joint.HomePosition = 0;

% --- Transforms: offset along x between each consecutive frame ---
%   base  -> joint1 : 0.2 m
%   joint1 -> joint2: 0.3 m
%   joint2 -> TCP   : 0.4 m
setFixedTransform(link1.Joint,       trvec2tform([0.2 0 0]));
setFixedTransform(link2.Joint,       trvec2tform([0.3 0 0]));
setFixedTransform(endeffector.Joint, trvec2tform([0.4 0 0]));

% --- Assemble robot ---
myRobot = rigidBodyTree;
addBody(myRobot, link1,       'base');
addBody(myRobot, link2,       'link1');
addBody(myRobot, endeffector, 'link2');

% --- Show at home position ---
figure;
show(myRobot);
title('Task 2.1 - 2-DOF Robot (home position)');
axis equal;
