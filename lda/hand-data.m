load digit.mat
who %show variables
% size(X) show size 256x500x10
% size(T) show size 256x200x10
% imshow(reshape(X(:,10,1),[16 16])');
%mean of the features of a digit “1” 
mu1=mean(X(:,:,1),2); %second argument is the direction of the mean,
% here the mean is taken of rows - (2), so size of mu1 will be 256x1, without 2, the mean is of dimension 500x1
%mean of the features of a digit “2” 
mu2=mean(X(:,:,2),2);
%covariance matrix common to both “1” and “2” 
S=(cov(X(:,:,1)')+cov(X(:,:,2)'))/2;
%size(cov(X(:,:,1)')) is 256x256
%inverse of a matrix 
invS=inv(S);
%prepare test data
t=T(:,:,1); % 200 “1”s %posterior probability for “1”.
% log p(y=1∣x)=x'Σ−1μy=1−12μy=1'Σ−1μy=1 
p1=t'*invS*mu1 - mu1'*invS*mu1/2;
%posterior probability for “2”
% log p(y=2∣x)=x'Σ−1μy=2−12μy=2'Σ−1μy=2
p2=t'*invS*mu2 - mu2'*invS*mu2/2; 
disp(p1-p2)
% result=sign(p1-p2) %”1” if positive, “2” otherwise 
%number of correct answers
% sum(result==1);
%rate of correct answers 
% sum(result==1)/length(result)
%displaying the misclassified digit 
% err=find(result~=1)
% imshow(reshape(t(:,err),[16 16])')
% waitfor(gcf)