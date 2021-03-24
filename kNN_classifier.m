function [accuracy_total,error_total] = kNN_classifier(train_data,train_target, test_data, k,  test_target,fileID)
%This function executes various calculations involved in the k Nearest
%Neighbour classifier
%This function takes the training data,training labels, testing data, value
%of k, testing labels and the file name to which the output has to be written.
%This function gives the accuracy and error of the model as the output arguement.

%To check if there are enough number of arguments passed in to this function
if nargin < 4
    disp("Error : Not enough input arguments ")
    return
end
%To check if the number of columns of the second matrix equals the number
%of columns of the first matrix
if size(train_data,2) ~= size(test_data,2)
    disp("Error : Size of train and test set is incorrect")
    return
end
%To check if k>0 and k<=cardinality of the training set (number of rows)
if k <= 0 && k > size(train_data,1)
    disp("Error : k is out of bound")
    return
end

if nargin >= 4
    if size(train_data,2) == size(test_data,2)
        if k > 0  && k < size(train_data,1)
            classification_accuracy = 0;
            error_rate = 0;
            for i = 1:size(test_data, 1)
                %To calculate the Euclidean Distance
                D = test_data(i, :) - train_data(: , :);
                D = D.^2;
                distance = sum(D, 2);
                distance = sqrt(distance);
                dist = [distance train_target];
                %To sort the row according to the minimum distance
                dist = sortrows(dist, 1);
                % For k value equal to 1
                if k == 1
                    k_neighbours = dist(k, :);
                    predicted = k_neighbours(1, 2);
                    true = test_target(i, 1);
                    if true == predicted
                        accuracy = 1;
                        error = 0;
                        classification_accuracy = classification_accuracy + accuracy;
                        error_rate = error_rate + error;
                    else
                        accuracy = 0;
                        error = 1;
                        error_rate = error_rate + error;
                    end
                    % the prediction, true value and the accuracy is
                    % written to the text file result.txt
                    fprintf(fileID,'%d ',predicted,'','','','','','','','','','', true,'','','','','','','','', accuracy*100);
                    fprintf(fileID,'\n');
                else
                    k_neighbours = dist(1:k, :);
                    if size(unique(k_neighbours(:, 2))) == 1
                        predicted = unique(k_neighbours(:, 2));
                    elseif size(unique(k_neighbours(:, 2))) == k
                        predicted = k_neighbours(1, 2);
                    else
                        predicted = mode(k_neighbours(:, 2));
                    end
                    true = test_target(i, 1);
                    if true == predicted
                        accuracy = 1;
                        error = 0;
                        classification_accuracy = classification_accuracy + accuracy;
                        error_rate = error_rate + error;
                    else
                        accuracy = 0;
                        error = 1;
                        error_rate = error_rate + error;
                    end
                    fprintf(fileID,'%d ',predicted,'','','','','','','','','','', true,'','','','','','','','', accuracy*100);
                    fprintf(fileID,'\n');
                end
            end
        else
            disp("Error : k out of bound")
        end
    else
        disp("Error : Incorect matrix sizes")
    end
else
    disp("Error : Not enough arguments")
end
accuracy_total = (classification_accuracy/size(test_target, 1)*100);
% error_total = 100-accuracy_total;
error_total = (error_rate/size(test_target, 1)*100);
end
