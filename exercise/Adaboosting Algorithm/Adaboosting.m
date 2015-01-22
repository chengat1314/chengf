function Adaboosting()
clc;close all;clear;
load hw2_adaboost_test.dat
load hw2_adaboost_train.dat
T = 300;

train_X = hw2_adaboost_train(:,1:2);
train_y = hw2_adaboost_train(:,3);

plotfun(train_X,train_y); % plot the train samples;

% For the decision stump algorithm, please implement the following steps. Any ties can be arbitrarily broken.
% 1. For any feature i, sort all the xn,i values to x[n],i such that x[n],i?x[n+1],i.
% 2. Consider thresholds within ?? and all the midpoints x[n],i+x[n+1],i2. 
%   Test those thresholds with s?{?1,+1} to determine the best (s,?) combination that minimizes Euin using feature i.
% 3. Pick the best (s,i,?) combination by enumerating over all possible i. 

for i = 1:T
    
    s,i,cita 
end