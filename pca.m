function [ p ] = pca( X, k)

% filler code - replace with your code
f = size(X,2);
p = zeros(f,k);
xmean=mean(X);
for i=1:1:size(X,2)
X(:,i)=X(:,i)-xmean(1,i);
end
% (1/size(X,1))*
Covariancem=X'*X;
[m_V,m_L]=eig(Covariancem);
%% find the max value:
maxm=zeros(f,1);
number=1;
for i=1:1:size(m_L,1)
    if m_L(i,i)~=0
        maxm(number)=m_L(i,i);
        number=number+1;
    end
end
maxm=sort(maxm,'descend');
n=1;
for j=1:1:k
for i=1:1:size(m_L,1)
if (m_L(i,i)==max(maxm))
    p(:,n)=m_V(:,i);
    maxm(j,1)=0;
    n=n+1;
    break;
end
end
end

end

