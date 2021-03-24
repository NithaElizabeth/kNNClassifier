% --------------------------------------------------------------------------
% This is a k-Nearest Neighbors classifier trained and tested on a MNIST
% dataset that represent handwritten digits in 28x28 greyscale images.
% This model is intended to classify the test data into category based on
% the provided data. The categories are digits from 1-10.
% Lab Number : 3
% Programmed By : Nitha Elizabeth John
% Guided By : Prof.Stefano Rovetta
% --------------------------------------------------------------------------
clc;
clear all;
close all;

% The output obtained will be written to this text file
fileID = fopen('result.txt','w');

% The dataset is loaded. 0 corresponds to training data and 1 corresponds
% to testing data
[train, train_label] = loadMNIST(0); %train = n X d and label = nX 1
[test, test_label] = loadMNIST(1);  %test = m X d and target is m X1
class = size((unique(train_label)),1);
k=[1 2 3 4 5 6 7 8 9 10 15 20 30 35 40 45 50 60 70 80 90]; %if k = 1, nearest neighbour classifier. If k ~= 1, then k-nearest neighbour
k_rand = k(randperm(length(k),1));

% Selected first 100 values inorder to reduce the computation time while
% checking running the classifier. 
train = train(1:100,:);
train_label = train_label(1:100,:);
test = test(1:100,:);
test_label = test_label(1:100,:);

disp('-----------------------------------START-----------------------------------');
fprintf(fileID,'---------------------------------------------------------------------------');
fprintf(fileID,'\n');
fprintf(fileID,'Predicted   True   Accuracy  ');fprintf(fileID,'\n');
fprintf(fileID,'---------------------------------------------------------------------------');
fprintf(fileID,'\n');
[accuracy,error] =kNN_classifier(train,train_label, test,k_rand, test_label,fileID);
disp('The result for TASK 2 is written to the file result.txt');
for i = 1:class
    fprintf(fileID,'---------------------------------------------------------------------------');
    fprintf(fileID,'\n');
    fprintf(fileID,'For digit = %5d',i);
    fprintf(fileID,'\n');
    fprintf(fileID,'---------------------------------------------------------------------------');
    fprintf(fileID,'\n');
    for j = 1 : size(k,2)
        if mod(k(j),class)~= 0
            [accuracy_model(j),error_model(j)] = kNN_classifier(train, train_label==i, test,k(j), test_label==i,fileID);
        else
            fprintf(fileID,'k is divisible by the number of class');
            fprintf(fileID,'\n');
            accuracy_model(j) = 0;error_model(j)= 0;
        end
    end
    % Plotting the accuracy and error plots for every digit
    figure (i);
    subplot(2,1,1);
    bar(k,accuracy_model,'r');
    xlabel('Values for k')
    ylabel('Accuracy (in %)')
    title("Accuracy plot for digit " + i)
    subplot(2,1,2);
    bar(k,error_model,'m');
    xlabel('Values for k')
    ylabel('Error (in %)')
    title("Error rates for digit " + i)
end
disp('The result for TASK 3 is written to the file result.txt');
disp('-----------------------------------END-----------------------------------');