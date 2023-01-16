function [beta,res,t,w,q,c,p,u] = pls(X,Y,m)
% NIPALS algorithm for pls

Xorg = X;
u(:,1) = Y(:,1);
for i=1:m

  w(:,i) = X'*u(:,1);
  w(:,i) = w(:,i)/norm(w(:,i)); %aribitary
  t(:,i) = X*w(:,i);
  t(:,i) = t(:,i)/norm(t(:,i)); %aribitary
  c(:,i) = Y'*t(:,i)/(t(:,i)'*t(:,i));
  u(:,i) = Y*c(:,i)/(c(:,i)'*c(:,i));
  p(:,i) = X'*t(:,i)/(t(:,i)'*t(:,i));

  X = X - t(:,i)*p(:,i)';
  %  Y = Y - t(:,i)*c(:,i)';
  beta = w*((p'*w)\c');
  res = Y-Xorg*beta;

  disp(['itr ',num2str(i)]);
  for k=1:size(Y,2)
    disp([' RSS:',num2str(norm(res(:,k)))]);
    q(k) = 1 - sum(res(:,k).^2)/sum( (Y(:,k)-mean(Y(:,k))).^2 );
    disp([' Q2:',num2str(q(k))]);
  end
end
