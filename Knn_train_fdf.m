disp('training knn for frequency features...')

labelWind = ones(length(windTrainFreqFeatures),1);
labelVacuum = repmat(2,length(vacuumTrainFreqFeatures),1);
labelAirplane = repmat(3,length(airplaneTrainFreqFeatures),1); 
allLabels = [labelWind; labelVacuum; labelAirplane];

labelWindT = ones(length(windTestFreqFeatures),1);
labelVacuumT = repmat(2,length(vacuumTestFreqFeatures),1);
labelAirplaneT = repmat(3,length(airplaneTestFreqFeatures),1); 
ground_truth = [labelWindT; labelVacuumT; labelAirplaneT];

k=[1 5 10 20 50 100];
rate = [];
for kk=1:length(k)
    %disp(['set-up the kNN... number of neighbors: ',mat2str(k(kk))])
    Mdl = fitcknn(allTrainFreqFeatures,allLabels','NumNeighbors',k(kk));

    % test the kNN
    predicted_label = predict(Mdl,allTestFreqFeatures);

    % measure the performance
    correct = 0;
    for i=1:length(predicted_label)
        if predicted_label(i)==ground_truth(i)
            correct=correct+1;
        end
    end
    %disp('recognition rate:')
    rate(kk) = (correct/length(predicted_label))*100;
end
[a,b]=max(rate);
disp('----------results----------------')
disp(['the maximum recognition rate is ',mat2str(a)])
disp(['and it is achieved with ',mat2str(k(b)),' nearest neighbors'])
disp(newline)

figure
subplot(3,1,1)
plot(k,rate)
title('performance for frequency features')
xlabel('number of neighbors')
ylabel('performance (%)')
grid on