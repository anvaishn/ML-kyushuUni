% find returns the indices of the
% rows meeting the specified condition
X=load('ex4x.dat');
y=load('ex4y.dat');
pos = find(y == 1); neg = find(y == 0);

% Assume the features are in the 2nd and 3rd
% columns of x
%plot(X(pos, 1), X(pos,2), 'go'); hold on
%plot(X(neg, 1), X(neg,2), 'rx')
X=[ones(80,1) X];
[b J] = logistic(X,y);

%decision boundary
p = h(X*b);
q = 1-h(X*b);
%figure
%plot3(X(pos,2),X(pos,3),p(pos),'go')
%hold on
%plot3(X(neg,2),X(neg,3),p(neg),'rx')
% hold off

 %comparing results with OLS

b_ols = X\y;
y_ols = X*b_ols;
figure
plot3(X(pos,2),X(pos,3),y_ols(pos),'go')
hold on
plot3(X(neg,2),X(neg,3),y_ols(neg),'rx')
hold off
