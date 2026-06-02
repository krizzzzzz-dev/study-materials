%% Task 2.3 - Get end effector pose for the configuration from Task 2.2

% Build robot and set configuration (from tasks 2.1 and 2.2)
run('Task2_2.m');

% Get transformation matrix: base -> endeffector
T = getTransform(myRobot, config, 'endeffector');
disp('Transformation matrix (base -> endeffector):');
disp(T);

% Extract position (x, y, z) of end effector in base frame
pos = tform2trvec(T);
disp('End effector position [x, y, z] in meters:');
disp(pos);

% Extract orientation as axis-angle [ax, ay, az, angle]
axang = tform2axang(T);
disp('End effector orientation (axis/angle):');
disp(axang);
