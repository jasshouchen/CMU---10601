function [ idx, C ] = kmeans( X, k, C_0 )

% filler code - replace with your code
n = size(X,1);
idx = zeros(n,1);
C = C_0;
number=zeros(k,1);
C_0=zeros(k,size(X,2));
judge=1;
while judge==1
    idx2=idx;
    for i=1:1:n
    dist=repmat(X(i,:),k,1)-C;%% calculate for the difference between two points
    [Distance,idx(i,1)]=min(sum(dist.*dist,2));
    end
    for c=1:1:k
    for i=1:1:n
    if idx(i,1)==c
        number(c,1)=number(c,1)+1;
        C_0(c,:)=C_0(c,:)+X(i,:);
    end
    end
    if number(c,1)==0
        C_0(c,:)=0;
    else
        C_0(c,:)=C_0(c,:)/number(c,1);
    end
   
    end
 if idx==idx2
        judge=0;
    else
        C=C_0;
        C_0=zeros(k,size(X,2));
        number=zeros(k,1);
    end
    
% C_0=zeros(k,size(X,2));
% idx2=ones(n,1);
% %% start to calculate for the distances:
% while idx2(:,1)~=idx(:,1)
% idx2=idx;
% sum1=0;
% dist=zeros(n,k);%% c denotes for k
% for i=1:1:n
% for c=1:1:k
% for f=1:1:size(X,2)
% sum1=sum1+(abs(X(i,f)-C_0(c,f))^.2);
% end
% dist(i,c)=sqrt(sum1);
% sum1=0;
% end
% end
% %% start to compare between different clusters:
% for i=1:1:n
% for c=1:1:k
% if dist(i,c)==min(dist(i,:))
%     idx(i,1)=c;
% %     break;
% end
% end
% end
% newX=zeros(size(X,1),size(X,2));
% newnumber=zeros(k,1);
% %% start to put values in the newX matrix:
%     for c=1:1:k
%         for i=1:1:n
% if idx(i,1)==c
%      C_0(c,:)=C_0(c,:)+X(i,:);
%     newnumber(c,1)=newnumber(c,1)+1;
% end
%     
%         end
% if newnumber(c,1)==0
%     C_0(c,:)=0;
% else
%      C_0(c,:)=C_0(c,:)/newnumber(c,1);
% end 
% C=C_0;
%     C_0=zeros(k,size(X,2));
%     newnumber=zeros(k,1);
%     end
% C=C_0;
end
