function p=prior(yTrain)
m=mean(yTrain);
sd=std(yTrain);
i=1;
m1=0;
m2=0;
m3=0;
for i=1:1: length(yTrain)
if yTrain(i)==1
m1=m1+1;
else if yTrain(i)==2
        m2=m2+1;
    else 
        m3=m3+1;
    end
end
end
p(1,:)=m1/length(yTrain);
p(2,:)=m2/length(yTrain);
p(3,:)=m3/length(yTrain);