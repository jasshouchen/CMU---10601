function [ y ] = pcaEmbed( X, P )

% filler code - replace with your code
n = size(X,1);
k = size(P,2);
y = zeros(n,k);
y=X*P;

end

