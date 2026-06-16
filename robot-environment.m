myRobot = loadrobot('kukaIiwa14');
myFigure = interactiveRigidBodyTree(myRobot);

hold on;

tableLength = 2;
tableWidth = 2;
tableHeight = 0.05;
tableTop = collisionBox(tableLength, tableWidth, tableHeight);
tableTop.Pose = trvec2tform([0 0 -tableHeight/2]);
[~, tablePatch] = show(tableTop);
tablePatch.FaceColor = [0.8 0.8 0.8];
tablePatch.EdgeColor = 'none';

cylinderRadius = 0.15;
cylinderHeight = 0.4;

cylinder1 = collisionCylinder(cylinderRadius, cylinderHeight);
cylinder1.Pose = trvec2tform([0.1 0.5 cylinderHeight/2]);
[~, cylinder1Patch] = show(cylinder1);
cylinder1Patch.FaceColor = [1 0 0];
cylinder1Patch.EdgeColor = 'none';

cylinder2 = collisionCylinder(cylinderRadius, cylinderHeight);
cylinder2.Pose = trvec2tform([0.4 -0.4 cylinderHeight/2]);
[~, cylinder2Patch] = show(cylinder2);
cylinder2Patch.FaceColor = [1 0 0];
cylinder2Patch.EdgeColor = 'none';
