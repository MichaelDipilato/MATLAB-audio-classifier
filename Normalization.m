disp('normalization...')
mn = mean(allTrainFreqFeatures);
st = std(allTrainFreqFeatures);
allTrainFreqFeatures = (allTrainFreqFeatures - ...
    repmat(mn,size(allTrainFreqFeatures,1),1))./repmat(st,size(allTrainFreqFeatures,1),1);

mn = mean(allTestFreqFeatures);
st = std(allTestFreqFeatures);
allTestFreqFeatures = (allTestFreqFeatures - ...
    repmat(mn,size(allTestFreqFeatures,1),1))./repmat(st,size(allTestFreqFeatures,1),1);

mn = mean(allTrainTimeFeatures);
st = std(allTrainTimeFeatures);
allTrainTimeFeatures = (allTrainTimeFeatures - ...
    repmat(mn,size(allTrainTimeFeatures,1),1))./repmat(st,size(allTrainTimeFeatures,1),1);

mn = mean(allTestTimeFeatures);
st = std(allTestTimeFeatures);
allTestTimeFeatures = (allTestTimeFeatures - ...
    repmat(mn,size(allTestTimeFeatures,1),1))./repmat(st,size(allTestTimeFeatures,1),1);

mn = mean(allTrainFeatures);
st = std(allTrainFeatures);
allTrainFeatures = (allTrainFeatures - ...
    repmat(mn,size(allTrainFeatures,1),1))./repmat(st,size(allTrainFeatures,1),1);

mn = mean(allTestFeatures);
st = std(allTestFeatures);
allTestFeatures = (allTestFeatures - ...
    repmat(mn,size(allTestFeatures,1),1))./repmat(st,size(allTestFeatures,1),1);

mn = mean(allFeats);
st = std(allFeats);
allFeats = (allFeats - ...
    repmat(mn,size(allFeats,1),1))./repmat(st,size(allFeats,1),1);