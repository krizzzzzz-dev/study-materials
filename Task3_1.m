%% Task 3.1

myRobot = loadrobot('kukaiiwa7');


myIK = inverseKinematics('RigidBodyTree', myRobot);

EffectorPosition = [0.4 0.6 0.5];

EffectorPose = trvec2tform(EffectorPosition);

weights = [1 1 1 1 1 1];

initGuess = myRobot.homeConfiguration;

[configSol, info] = myIK('iiwa_link_ee', ...
    EffectorPose, ...
    weights, ...
    initGuess);

figure
show(myRobot,configSol)

info.ExitFlag
