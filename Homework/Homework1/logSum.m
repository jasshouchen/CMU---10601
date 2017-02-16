function [ sumX ] = logSum( X )

%filler code - replace with your code
p=max(X);
a = log(exp(X(1)-p));
for i=2:1:length(X)
a=log(exp(a)+exp(X(i)-p));
end
sumX=p+a;
end

