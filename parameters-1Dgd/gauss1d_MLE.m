function [] = gauss1d_MLE(n,mu,sigma)
X = sigma*randn(n,1)+mu; %randn return matrix with 0 mean and variance 1
disp(X)
mu_MLE = mean_MLE(X); 
sigma_MLE = var_MLE(X); 
X = -3:0.5:3;
Y = g1_pdf(X,mu,sigma);
disp(['true:',num2str(Y)]);
Y_MLE = g1_pdf(X,mu_MLE,sigma_MLE); % using numbers generated from randn for estimation
disp(['estimated:',num2str(Y_MLE)]); 
plot(X,Y,'ro-',X,Y_MLE,'gx-');
legend('true','estimated');
waitfor(gcf)
endfunction

function [z]=g1_pdf(x,mu,sigma) 
z=((2*pi*sigma.^2)^(-1/2))*exp(-(x-mu).^2./(2*sigma.^2)); 
endfunction

function [my_mean] = mean_MLE(X)
my_mean = 1/length(X)*sum(X);
disp(my_mean)
endfunction

function [my_var] = var_MLE(X)
mu = 1/length(X)*sum(X);
my_var = sqrt(1/length(X)*sum((X-mu).^2)); 
disp(my_var)
endfunction