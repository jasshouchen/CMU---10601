function [ classPred ] = naiveBayesClassify( XTrain, XTest, yTrain )
numFeature = size(XTrain,2);
numClass = max(yTrain);
%filler code - replace with your code
nTest = size(XTrain,1);
classPred = zeros(nTest,1);
[M,V]=likelihood(XTrain, yTrain);
p=prior(yTrain);
i=1;
k=1;
j=1;
posterior=ones(nTest,numClass);
        for j=1:1:nTest
            probability1=p(1,1);
            probability2=p(2,1);
            probability3=p(3,1);
               for k=1:1:numClass
                 for i=1:1:numFeature
                     if k==1
                 probability1=(1/sqrt(2*pi*V(i,k))*exp((-1/2)*((XTest(j,i)-M(i,k)).^2/V(i,k))))*probability1;
                     else if k==2
                             probability2=(1/sqrt(2*pi*V(i,k))*exp((-1/2)*((XTest(j,i)-M(i,k)).^2/V(i,k))))*probability2;
                         else
                             probability3=(1/sqrt(2*pi*V(i,k))*exp((-1/2)*((XTest(j,i)-M(i,k)).^2/V(i,k))))*probability3;
                 
             end
                     end
                 end
               end
               posterior(j,1)=probability1;
               posterior(j,2)=probability2;
               posterior(j,3)=probability3;
               
   
        end
for j=1:1:nTest
    if posterior(j,1)==max(posterior(j,:))
        classPred(j,1)=1;
    else if posterior(j,2)==max(posterior(j,:))
            classPred(j,1)=2;
        else
            classPred(j,1)=3;
        end
    end

end
end