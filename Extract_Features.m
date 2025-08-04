f = waitbar(0,'extracting wind features (train)');

WL = 0.5; % window length
SL = 0.3; % step length

windTrainFreqFeatures = [];
windTrainTimeFeatures = [];
for i=1:length(windTrain)
    [C,S,R,ceps]=frequency_features(windTrain(i).name,WL,SL);
    [E,EE,Z] = timedomainFeats(windTrain(i).name,WL,SL);
    tmp = [C' S' R' ceps'];
    windTrainFreqFeatures = [windTrainFreqFeatures; tmp];
    tmp = [E' EE' Z'];
    windTrainTimeFeatures = [windTrainTimeFeatures; tmp];
    waitbar(i / length(windTrain),f)
end

waitbar(0,f,'extracting wind features (test)')
windTestFreqFeatures = [];
windTestTimeFeatures = [];
for i=1:length(windTest)
    [C,S,R,ceps]=frequency_features(windTest(i).name,WL,SL);
    [E,EE,Z] = timedomainFeats(windTest(i).name,WL,SL);
    tmp = [C' S' R' ceps'];
    windTestFreqFeatures = [windTestFreqFeatures; tmp];
    tmp = [E' EE' Z'];
    windTestTimeFeatures = [windTestTimeFeatures; tmp];
    waitbar(i / length(windTest),f)
end

waitbar(0,f,'extracting vacuum features (train)');
vacuumTrainFreqFeatures = [];
vacuumTrainTimeFeatures = [];
for i=1:length(vacuumTrain)
    [C,S,R,ceps]=frequency_features(vacuumTrain(i).name,WL,SL);
    [E,EE,Z] = timedomainFeats(vacuumTrain(i).name,WL,SL);
    tmp = [C' S' R' ceps'];
    vacuumTrainFreqFeatures = [vacuumTrainFreqFeatures; tmp];
    tmp = [E' EE' Z'];
    vacuumTrainTimeFeatures = [vacuumTrainTimeFeatures; tmp];
    waitbar(i / length(vacuumTrain),f)
end

waitbar(0,f,'extracting vacuum features (test)')
vacuumTestFreqFeatures = [];
vacuumTestTimeFeatures = [];
for i=1:length(vacuumTest)
    [C,S,R,ceps]=frequency_features(vacuumTest(i).name,WL,SL);
    [E,EE,Z] = timedomainFeats(vacuumTest(i).name,WL,SL);
    tmp = [C' S' R' ceps'];
    vacuumTestFreqFeatures = [vacuumTestFreqFeatures; tmp];
    tmp = [E' EE' Z'];
    vacuumTestTimeFeatures = [vacuumTestTimeFeatures; tmp];
    waitbar(i / length(vacuumTest),f)
end

waitbar(0,f,'extracting airplane features (train)');
airplaneTrainFreqFeatures = [];
airplaneTrainTimeFeatures = [];
for i=1:length(airplaneTrain)
    [C,S,R,ceps]=frequency_features(airplaneTrain(i).name,WL,SL);
    [E,EE,Z] = timedomainFeats(airplaneTrain(i).name,WL,SL);
    tmp = [C' S' R' ceps'];
    airplaneTrainFreqFeatures = [airplaneTrainFreqFeatures; tmp];
    tmp = [E' EE' Z'];
    airplaneTrainTimeFeatures = [airplaneTrainTimeFeatures; tmp];
    waitbar(i / length(airplaneTrain),f)
end

waitbar(0,f,'extracting airplane features (test)')
airplaneTestFreqFeatures = [];
airplaneTestTimeFeatures = [];
for i=1:length(airplaneTest)
    [C,S,R,ceps]=frequency_features(airplaneTest(i).name,WL,SL);
    [E,EE,Z] = timedomainFeats(airplaneTest(i).name,WL,SL);
    tmp = [C' S' R' ceps'];
    airplaneTestFreqFeatures = [airplaneTestFreqFeatures; tmp];
    tmp = [E' EE' Z'];
    airplaneTestTimeFeatures = [airplaneTestTimeFeatures; tmp];
    waitbar(i / length(airplaneTest),f)
end

allTrainFreqFeatures = [windTrainFreqFeatures; vacuumTrainFreqFeatures;
    airplaneTrainFreqFeatures];
allTestFreqFeatures = [windTestFreqFeatures; vacuumTestFreqFeatures;
    airplaneTestFreqFeatures];
allTrainTimeFeatures = [windTrainTimeFeatures; vacuumTrainTimeFeatures;
    airplaneTrainTimeFeatures];
allTestTimeFeatures = [windTestTimeFeatures; vacuumTestTimeFeatures;
    airplaneTestTimeFeatures];
allTrainFeatures = [allTrainFreqFeatures allTrainTimeFeatures];
allTestFeatures = [allTestFreqFeatures allTestTimeFeatures];
allFeats = [allTrainFeatures; allTestFeatures];

close(f)