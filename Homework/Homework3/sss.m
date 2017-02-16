% Filler code - replace with your code
k=5;
nTest = size(XTest,1);
D = zeros(nTest,k);
dist=zeros(nTest,nTest);
dis=0;
i=1;%% this interate for the test samples
n=1;%% this calculate for the training samples
j=1; %%this calculate for each dimensions for 
%% start to compute for overal distance matrix:
sum=0;
for i=1:1:nTest
for n=1:1:nTest
    for j=1:1:size(XTest,2)
    sum=sum+(XTrain(n,j)-XTest(i,j)).^2;
    end
    dis=sqrt(sum);
    sum=0;
    dist(i,n)=dis;
    dis=0;
end
end
%% start to compute for picking up k nearest neighbors:
n=1;
j=1;
i=1;
for n=1:1:nTest
    for j=1:1:k
for i=1:1:size(dist,2)
if dist(n,i)==min(dist(n,:))
    D(n,j)=i;
    dist(n,i)=100;
    break;
end
end

    end
end