function [ y ] = EMCluster( X, k, t, mu, sigma )

% filler code - replace with your code
n = size(X,1);
y = zeros(n,1);
%% start to deal with the posterior probability:
N=zeros(n,k);%% for the likelihood function:
for j=1:1:k
    N(:,j)=mvnpdf(X,mu(j,:),sigma(:,:,j));
end
%% start to compute the posterior:
posterior=zeros(n,k);
for j=1:1:k
for i=1:1:n
    posterior(i,j)=N(i,j)*t(j,1);
end
end
%% find the max vlaue:
for i=1:1:n
    [value,y(i,1)]=max(posterior(i,:));
end
end

