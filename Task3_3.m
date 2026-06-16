myRobot = loadrobot('kukaIiwa14');
myFigure = interactiveRigidBodyTree(myRobot);

input('Drag the robot to configuration 1, then press Enter.', 's');
addConfiguration(myFigure);
input('Drag the robot to configuration 2, then press Enter.', 's');
addConfiguration(myFigure);
input('Drag the robot to configuration 3, then press Enter.', 's');
addConfiguration(myFigure);
input('Drag the robot to configuration 4, then press Enter.', 's');
addConfiguration(myFigure);

numberOfConfigurations = size(myFigure.StoredConfigurations, 2);
numberOfSamples = 100 * (numberOfConfigurations - 1);

[q, qd, qdd, tSamples] = trapveltraj(myFigure.StoredConfigurations, numberOfSamples, 'PeakVelocity', 2);

rateController = rateControl(numberOfSamples / (max(tSamples) - tSamples(2)));
for i = 1:numberOfSamples
    myFigure.Configuration = q(:, i);
    waitfor(rateController);
end
