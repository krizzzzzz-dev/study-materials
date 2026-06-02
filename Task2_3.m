%% Task 2.3 - End effector pose for the config from Task 2.2

% ---- Build robot ----
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

% ---- Config: theta1=-30 deg, theta2=80 deg ----
config = homeConfiguration(myRobot);
config(1).JointPosition = deg2rad(-30);
config(2).JointPosition = deg2rad(80);

% ---- Transformation matrix: base -> endeffector ----
T = getTransform(myRobot, config, 'endeffector');
disp('Transformation matrix (base -> endeffector):');
disp(T);

% ---- Cartesian position ----
pos = tform2trvec(T);
disp('End effector position [x, y, z] in meters:');
disp(pos);

% ---- Orientation in axis/angle format [ax ay az, angle_rad] ----
axang = tform2axang(T);
disp('Orientation (axis/angle) [ax ay az angle_rad]:');
disp(axang);
fprintf('Rotation angle: %.4f deg\n', rad2deg(axang(4)));
