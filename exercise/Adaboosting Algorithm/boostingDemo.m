clear all;clc;close all

load hw2_adaboost_test.dat
load hw2_adaboost_train.dat
X = hw2_adaboost_train(:,1:2);
y = hw2_adaboost_train(:,3);
test_X = hw2_adaboost_test(:,1:2);
test_y = hw2_adaboost_test(:,3);
N = size(X,1);

%% Fit Single model
fprintf('Fitting Single model...\n');
z = (1/N)*ones(N,1);
% model = logisticRegress(X,y,z);
model = decisionStump(X,y,z);

% Compute training error
yhat = model.predict(model,X);
trainingError = sum(yhat ~= y)/N
% Compute testing error
yhat = model.predict(model,test_X);
testingError = sum(yhat ~= test_y)/length(test_y)

% Show data and decision boundaries
plot2DClassifier(X,y,model);
pause

%% Fit Boosted model
fprintf('Fitting boosted model...\n');
nBoosts = 300;
% model = adaBoost(X,y,nBoosts,@logisticRegress);
model = adaBoost(X,y,nBoosts,@decisionStump);

% Compute training error
yhat = model.predict(model,X);
trainingError = sum(yhat ~= y)/N
min( 1./((exp(model.alpha).^2)+1 ));% min train error;
% Compute testing error
yhat = model.predict(model,test_X);
testingError = sum(yhat ~= test_y)/length(test_y)
% Show data and decision boundaries
plot2DClassifier(X,y,model);


