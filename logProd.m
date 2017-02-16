function [ xProd ] = logProd( X )

%filler code - replace with your code
xProd = 0;
i=1;
sum=0;
for i=1:1:length(X)
sum=sum+X(i);
end
xProd=sum;
end

