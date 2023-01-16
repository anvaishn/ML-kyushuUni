function [U, S] = pca(X)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
%

% Useful values
[m, n] = size(X);
U = zeros(n);
S = zeros(n);

% Note: When computing the covariance matrix, remember to divide by m (the
%       number of examples).
%

[U S V]=svd(X'*X./m);
%[U S]=eig(X'*X./m);

% =========================================================================

end
