function [ w ] = weightsL( XTrain, yTrain )

% Filler code - replace with your code
nFeat = size(XTrain,2);
w = zeros(nFeat,1);
w=inv(XTrain'*XTrain)*XTrain'*yTrain;
end

