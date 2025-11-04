clear; clc
close all

addpath(genpath(pwd))

% extracting files and dividing them in training and testing
windFiles = dir([pwd,'\ESC-50\207 - Wind\*.ogg']);
windTrain = windFiles(1:(length(windFiles)*70)/100);
windTest = windFiles(((length(windFiles)*70)/100) + 1:end);

vacuumFiles = dir([pwd,'\ESC-50\407 - Vacuum Cleaner\*.ogg']);
vacuumTrain = vacuumFiles(1:(length(vacuumFiles)*70)/100);
vacuumTest = vacuumFiles(((length(vacuumFiles)*70)/100) + 1:end);

airplaneFiles = dir([pwd,'\ESC-50\508 - Airplane\*.ogg']);
airplaneTrain = airplaneFiles(1:(length(airplaneFiles)*70)/100);
airplaneTest = airplaneFiles(((length(airplaneFiles)*70)/100) + 1:end);

% running features extraction script
disp('extracting features...')
run extract_features.m

% normalization
run normalization.m

disp('principal component analisys...')
[~,score,~,~,explained] = pca(allFeats);

% plotting
colorWind = repmat([1 0 0],length([windTestFreqFeatures windTestTimeFeatures; ...
    windTrainFreqFeatures windTrainTimeFeatures]),1);
colorVacuum = repmat([0 1 0],length([vacuumTestFreqFeatures vacuumTestTimeFeatures; ...
    vacuumTrainFreqFeatures vacuumTrainTimeFeatures]),1);
colorAirplane = repmat([0 0 1],length([airplaneTestFreqFeatures airplaneTestTimeFeatures; ...
    airplaneTrainFreqFeatures airplaneTrainTimeFeatures]),1);
C = [colorWind; colorVacuum; colorAirplane];

scatter3(allFeats(:,1),allFeats(:,2),allFeats(:,3),[],C);
title('before PCA')

figure
scatter3(score(:,1),score(:,2),score(:,3),[],C);
title('after PCA')

% calculating coefficients with variance >= 80
varSum = cumsum(explained);
n_coeff = find(varSum >= 80, 1);
disp(['n. of coefficients with variance > 80% : ',mat2str(n_coeff)])

% running Knn scripts
run knn_train_fdf.m
run knn_train_tdf.m
run knn_train_all.m
