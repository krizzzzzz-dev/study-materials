%% Task 3.3

myRobot = loadrobot('kukaIiwa14');

myFigure = interactiveRigidBodyTree(myRobot);

addConfiguration(myFigure);
addConfiguration(myFigure);
addConfiguration(myFigure);
addConfiguration(myFigure);

NumberOfConfigurations = size(myFigure.StoredConfigurations,2);

NumberOfSamples = 100*(NumberOfConfigurations-1);

[q,qd,qdd,tSamples] = trapveltraj(myFigure.StoredConfigurations,NumberOfSamples,'PeakVelocity',2);

rateController = rateControl(NumberOfSamples/(max(tSamples)-tSamples(2)));
for i = 1:NumberOfSamples
    myFigure.Configuration = q(:,i);
    waitfor(rateController);
end
