[b, J] = function logistic2(X,y,lambda)
[n p] = size(X);
b = zeros(p,1); J = 0; itr = 0;


while 1
  itr = itr + 1;
  disp(["iteration: ",num2str(itr)]);
  prev_J = J;

  % Compute J here
  J = -(y'*X*b - sum(log(1+exp(X*b)))) + lambda/2*sum(b.^2);


  if abs(prev_J-J) < 1/n, break, end

  % Compute the first gradient here
  gradJ = X'*(h(X*b) - y) + lambda*b;


  % Compute the second gradient here

hessian = X'*(diag(h(X*b).*(1 - h(X*b))))*X + lambda*ones(p);
  % Update beta here
  b = b - inv(hessian)*gradJ;
end
endfunction
