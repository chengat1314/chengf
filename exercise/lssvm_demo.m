function lssvm_demo()
clear all;clc;close all
load hw2_lssvm_all.dat
train_X = hw2_lssvm_all(1:400,1:10);
train_y = hw2_lssvm_all(1:400,end);
test_X = hw2_lssvm_all(401:end,1:10);
test_y = hw2_lssvm_all(401:end,end);


