function [ cls ] = logisticRegressionClassify( XTest, w )
%filler code - replace with your code
nTest = size(XTest,1);
cls = zeros(nTest,1);
j=1;
Pnot=zeros(nTest,1);
Pone=zeros(nTest,1);
for j=1:1:nTest
Pnot(j,1)=exp(-XTest(j,:)*w)/(1+exp(-XTest(j,:)*w));
Pone(j,1)=1/(1+exp(-XTest(j,:)*w));
end
for j=1:1:nTest
if Pnot(j,1)>=Pone(j,1)
    cls(j,1)=0;
else
    cls(j,1)=1;
end
end
end

