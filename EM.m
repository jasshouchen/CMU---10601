function [t, mu, sigma] = EM( X, k, t_0, mu_0, sigma_0, nIter)

% filler code - replace with your code
t = t_0;
mu = mu_0;
sigma = sigma_0;
n=size(X,1);
% t: pior(k,1)
% T: distribution(n,k)
N=zeros(n,k);
T=zeros(n,k);
% e step
for Iter=1:nIter
    for j=1:k
        N(:,j)=mvnpdf(X,mu(j,:),sigma(:,:,j));
    end
    for i=1:n
        T(i,:)=N(i,:).*t'/(N(i,:)*t);
    end

% m step
% calculate mu
    for i=1:k
        for j=1:n
            s(j,:)=T(j,i)*X(j,:);
        end
        mu(i,:)=sum(s)/sum(T(:,i));
% calculate sigma
        s1=zeros(size(X,2));
        for j=1:n
            s1=s1+T(j,i)*((mu(i,:)-X(j,:))'*(mu(i,:)-X(j,:)));
        end
        sigma(:,:,i)=s1/sum(T(:,i));
        t(i)=sum(T(:,i))/n;
    end
end
end



