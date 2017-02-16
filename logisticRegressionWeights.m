function [ w ] = logisticRegressionWeights( XTrain, yTrain, w0, nIter)

%filler code - replace with your code
nFeat = size(XTrain,2);
w = zeros(nFeat,1);
w=w0;
w1=w;
yita=0.1;
sum=0;
n=1;
i=1;
k=1;
for n=1:1:nIter
    for i=1:1:nFeat
        for k=1:1:size(XTrain,1) 
        
  %%      if i==1
%%sum=sum+XTrain(n,i)*(yTrain(n)-sigmoidProb(1,XTrain(n,i),w0));
    %%        else
%%sum=sum+XTrain(k,i)*(yTrain(k,:)-sigmoidProb(1,XTrain(k,:),w));
  sum=sum+XTrain(k,i)*(yTrain(k,:)-(1/(1+exp(-XTrain(k,:)*w))));
        end
        w1(i,1)=w1(i,1)+yita*sum;
        sum=0;
    end
    w=w1;
       
        %%if i==1
          %%  w(i,1)=w0-yita*sum;
        %%else
       %% sum=0;
end
end
    %%end
%%end


