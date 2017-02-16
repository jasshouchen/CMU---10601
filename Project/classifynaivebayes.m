function [classPred] = classify(XTrain_fName, yTrain_fName, XTest_fName)
%UNTITLED Summary of this function goes here
% %   Detailed explanation goes here
% 
ytrain=yTrain_fName;
XTest=XTest_fName;
% yTrain=yTrain_fName;
XTrain=XTrain_fName;
% XTrain = csvread(XTrain_fName);
% XTest = csvread(XTest_fName);
% yTrain = csvread(yTrain_fName);
% XTest=XTest_fName;
% % ------ REPLACE WITH YOUR CODE ------
c = zeros(size(XTest,1),1);
%% pca to reduce dimensionality using pca method for matrix of Xtrain:
% filler code - replace with your code
XTrain=XTrain_fName;
ktrain=200;
ft = size(XTrain,2);
pt = zeros(ft,ktrain);
xtrainmean=mean(XTrain);
for i=1:1:size(XTrain,2)
XTrain(:,i)=XTrain(:,i)-xtrainmean(1,i);
end
% (1/size(X,1))*
Covariancemtrain=XTrain'*XTrain;
[m_Vtrain,m_Ltrain]=eig(Covariancemtrain);
%% find the max value:
maxmtrain=zeros(ft,1);
numbertrain=1;
for i=1:1:size(m_Ltrain,1)
    if m_Ltrain(i,i)~=0
        maxmtrain(numbertrain)=m_Ltrain(i,i);
        numbertrain=numbertrain+1;
    end
end
maxmtrain=sort(maxmtrain,'descend');
ntrain=1;
for j=1:1:ktrain
for i=1:1:size(m_Ltrain,1)
if (m_Ltrain(i,i)==max(maxmtrain))
    ptrain(:,ntrain)=m_Vtrain(:,i);
    maxmtrain(j,1)=0;
    ntrain=ntrain+1;
    break;
end
end
end
%% start to embed the pca XTrain:
ntrain = size(XTrain,1);
ktrain = size(ptrain,2);
xtrain = zeros(ntrain,ktrain);
xtrain=XTrain*ptrain;
%% start to conduct dimension reduction for XTest:
XTest=XTest_fName;
ftest = size(XTest,2);
ptest = zeros(ftest,ktrain);
xmeantest=mean(XTest);
for i=1:1:size(XTest,2)
XTest(:,i)=XTest(:,i)-xmeantest(1,i);
end
% (1/size(X,1))*
Covariancemtest=XTest'*XTest;
[m_Vtest,m_Ltest]=eig(Covariancemtest);
%% find the max value:
maxmtest=zeros(ftest,1);
numbertest=1;
for i=1:1:size(m_Ltest,1)
    if m_Ltest(i,i)~=0
        maxmtest(numbertest)=m_Ltest(i,i);
        numbertest=numbertest+1;
    end
end
maxmtest=sort(maxmtest,'descend');
ntest=1;
for j=1:1:ktrain
for i=1:1:size(m_Ltest,1)
if (m_Ltest(i,i)==max(maxmtest))
    ptest(:,ntest)=m_Vtest(:,i);
    maxmtest(j,1)=0;
    ntest=ntest+1;
    break;
end
end
end
%% start to embed pca:
ntest = size(XTest,1);
ktest = size(ptest,2);
xtest = zeros(ntest,ktest);
xtest=XTest*ptest;
% xtest, xtrain, 
%% start to conduct naive bayes classifier:
% nb=NaiveBayes.fit(xtrain, ytrain);
% cpre=predict(nb,xtest);
%% first ti derive for the prior probability:
nfeature=0;
nfeature=max(yTrain_fName)+1;
number=zeros(nfeature,1);
p=zeros(size(number,1),1);
for i=1:1: length(ytrain)
if ytrain(i)==0
number(1,:)=number(1,:)+1;
else if ytrain(i)==1
        number(2,:)=number(2,:)+1;
    else if ytrain(i)==2
        number(3,:)=number(3,:)+1;
        else
            number(4,:)=number(4,:)+1;
        end
    end
end
end
for i=1:1:size(number,1)
p(i,1)=number(i,1)/length(ytrain);
end
%% start to compute the likelihood function:
numFeature = size(xtrain,2);
numClass = max(ytrain)+1;
M=zeros(numFeature,numClass);
V = zeros(numFeature,numClass);
i=1;
k=1;
j=1;
y=[0;1;2;3;];
sumy=zeros(numFeature,numClass);
sumx=zeros(numFeature,numClass);
xsquaresum=zeros(numFeature,numClass);
%% calculate for mu:
for i=1:1:numFeature
for k=1:1:numClass
    for j=1:1:length(ytrain)
    if ytrain(j)==y(k)
        sumy(i,k)=sumy(i,k)+1;
        sumx(i,k)=sumx(i,k)+xtrain(j,i);
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
    for j=1:1:length(ytrain)
    if ytrain(j)==y(k)
    xsquaresum(i,k)=xsquaresum(i,k)+(xtrain(j,i)-M(i,k)).^2;
    end
    end
    V(i,k)=xsquaresum(i,k)/sumy(i,k);
    end
end
 %% start the naive bayesian classifier:
numFeature = size(xtrain,2);
numClass = max(ytrain)+1;
%filler code - replace with your code
nTest = size(xtrain,1);
classPred = zeros(nTest,1);
i=1;
k=1;
j=1;
posterior=ones(nTest,numClass);
        for j=1:1:nTest
            probability1=p(1,1);
            probability2=p(2,1);
            probability3=p(3,1);
            probability4=p(4,1);
               for k=1:1:numClass
                 for i=1:1:numFeature
                     if k==1
                 probability1=(1/sqrt(2*pi*V(i,k))*exp((-1/2)*((xtest(j,i)-M(i,k)).^2/V(i,k))))*probability1;
                     else if k==2
                             probability2=(1/sqrt(2*pi*V(i,k))*exp((-1/2)*((xtest(j,i)-M(i,k)).^2/V(i,k))))*probability2;
                         else if k==3
                             probability3=(1/sqrt(2*pi*V(i,k))*exp((-1/2)*((xtest(j,i)-M(i,k)).^2/V(i,k))))*probability3;
                             else if k==4 
                                  probability4=(1/sqrt(2*pi*V(i,k))*exp((-1/2)*((xtest(j,i)-M(i,k)).^2/V(i,k))))*probability4;
                 
                                 end
                             end
                         end
                     end
                 end
               end
               posterior(j,1)=probability1;
               posterior(j,2)=probability2;
               posterior(j,3)=probability3;
               posterior(j,4)=probability4;
         
        end
for j=1:1:nTest
    if posterior(j,1)==max(posterior(j,:))
        c(j,1)=0;
    else if posterior(j,2)==max(posterior(j,:))
            c(j,1)=1;
        else if posterior(j,3)==max(posterior(j,:))
            c(j,1)=2;
            else
                c(j,1)=3;
            end
        end
    end
end
end