myRobot = loadrobot('kukaIiwa7');
myIK = inverseKinematics('RigidBodyTree', myRobot);

effectorPosition = [0.4 0.6 0.5];
effectorPose = trvec2tform(effectorPosition);

weights = [1 1 1 1 1 1];
initGuess = myRobot.homeConfiguration;

[config, info] = myIK('iiwa_link_ee', effectorPose, weights, initGuess);

figure;
show(myRobot, config);
title('Task 3.1 - kukaIiwa7 numerical IK configuration');

if info.ExitFlag == 1
    disp('Solver terminated regularly (local minimum found).');
else
    disp('Solver did not terminate regularly.');
end
