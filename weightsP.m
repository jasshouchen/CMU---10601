function [ w ] = weightsP( XTrain, yTrain, nIter)

% Filler code - replace with your code
nFeat = size(XTrain,2);
w = zeros(nFeat,1);
woveral=zeros(nFeat,nIter);
%% individual codes start from here:
i=1;
k=1;
n=1;
sum=0;
num=0;
for n=1:1:nIter
    for i=1:1:size(XTrain,1)
if w'*XTrain(i,:)'*yTrain(i,1)<=0
w=(w'+yTrain(i,1)*XTrain(i,:))';
woveral(:,i)=w;
num=num+1;
else
    woveral(:,i)=w;
end
    end
    num=0;
end
%% start to count the number of each weight:
count=zeros(num,2);
n=1;
countnum=1;
for countnum=1:1:num
for n=1:1:nIter
if woveral(:,n)==woveral(:,n+1)
    count(countnum,1)=n+1;
number=number+1;
else
    count(countnum,2)=number;
    number=0;
   
end
end
end
%% put the weight into the w vector:
for i=1:1:num
if count(i,2)==max(count(:,2))
    w=woveral(:,count(i,1));
end

end

