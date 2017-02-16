function [ c ] = perceptronClassify( XTest, w)

% Filler code - replace with your code
nTest = size(XTest,1);
c = zeros(nTest,1);
nFeat=size(XTest,2);
c=sign(XTest*w);
end

