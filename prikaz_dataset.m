clear ; close all; clc

input_layer_size  = 900;  
hidden_layer1_size = 630;
hidden_layer2_size = 360;  
num_labels = 92;             


fprintf('Loading and Visualizing Data ...\n')
X = dlmread('X.mat');
y = dlmread('Y.mat');
samples =size(X,1);
options = optimset('MaxIter', 50);
lambda = 1;
                          

X = X(1:samples,:);
y = y(1:samples,:);
m = size(X, 1);

% prikazi random 100 podataka
% sel = randperm(size(X, 1));
% sel = sel(1:100);


%prikazi sve klase
displayData(X(1:92, :));


