function [M,V]=likelihood(XTrain, yTrain)
numFeature = size(XTrain,2);
numClass = max(yTrain);
M= zeros(numFeature,numClass);
V = zeros(numFeature,numClass);
i=1;
k=1;
j=1;
y=[1;2;3];
sumy=zeros(numFeature,numClass);
sumx=zeros(numFeature,numClass);
xsquaresum=zeros(numFeature,numClass);
%% calculate for mu:
for i=1:1:numFeature
for k=1:1:numClass
    for j=1:1:length(yTrain)
    if yTrain(j)==y(k)
        sumy(i,k)=sumy(i,k)+1;
        sumx(i,k)=sumx(i,k)+XTrain(j,i);
    end
   
    end
     M(i,k)=sumx(i,k)/sumy(i,k);
end
end
i=1;
k=1;
j=1;
%% calculate for sigma:
for i=1:1:numFeature
    for k=1:1:numClass
    for j=1:1:length(yTrain)
    if yTrain(j)==y(k)
    xsquaresum(i,k)=xsquaresum(i,k)+(XTrain(j,i)-M(i,k)).^2;
    end
    end
    V(i,k)=xsquaresum(i,k)/sumy(i,k);
    end
end


