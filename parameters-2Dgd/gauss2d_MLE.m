function [] = gauss2d_MLE(n,Mu,Sigma) %usage: gauss2d_MLE(10,[0 0]',[1 -0.5;-0.5 1]) 
X = randn(n,length(Mu))*Sigma+ones(n,1)*Mu'; 
Mu_MLE = mean(X)';
disp(Mu_MLE)
Sigma_MLE = cov(X);
X = -3:0.1:3;
Y = -3:0.1:3;
for i=1:length(X)
    for j=1:length(Y)
    Z(i,j) = g2_pdf(X(i),Y(j),Mu,Sigma);
    Z_MLE(i,j) = g2_pdf(X(i),Y(j),Mu_MLE,Sigma_MLE);
    end 
end
figure(1);
surface(X,Y,Z);
title('true distribution')

figure(2);
surface(X,Y,Z_MLE);
title('estimated destribution')
waitfor(gcf)
% figure(1);clf;
% surface(Z);
% title('true distribution') figure(2);clf;
% surface(Z_MLE);
% title('estimated distribution') %print -deps gauss2d_MLE.eps endfunction