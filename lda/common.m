load digit.mat
who %show variables
size(X) %show size
size(T) % show size
%Computation of a common covariance matrix
[a b c] = size(X);
S = zeros(a);
mu = zeros(a,c);
for i=1:c
mu(:,i) = mean(X(:,:,i),2);
S = S + cov(X(:,:,i)');
end

S=S/c;
invS = inv(S);
%posteriors for all c's
P = zeros(c,c);
 for i=1:c
    P(i,:) = T(:,7,:)'*invS*mu(:,i) - mu(:,i)'*invS*mu(:,i)./2;
 end
disp(P)
