function [b ] = knnClassify( XTrain, XTest, yTrain, k )

% Filler code - replace with your code
nTest = size(XTest,1);
b = zeros(nTest, 1);
D=knn(XTrain,XTest,k);
m1=zeros(nTest,1);
m2=zeros(nTest,1);
m3=zeros(nTest,1);
for n=1:1:nTest
for i=1:1:k
if yTrain(D(n,i),1)==1
    m1(n,1)=m1(n,1)+1;
else if yTrain(D(n,i),1)==2
        m2(n,1)=m2(n,1)+1;
    else if yTrain(D(n,i),1)==3
            m3(n,1)=m3(n,1)+1;
        end
    end
end    
end
end

%% define the sequence and the weight coefficient
for n=1:1:nTest
    if m1(n,1)>m2(n,1) & m1(n,1)>m2(n,1)
    b(n,1)=1;
    else if m2(n,1)>m1(n,1) & m2(n,1)>m3(n,1)
            b(n,1)=2;
        else
            b(n,1)=3;
        end
    end
end

end

