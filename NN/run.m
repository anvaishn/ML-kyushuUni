load('MNIST.mat');
load('Weights.mat');
imagesc(reshape(X(5000,:),[16 16]))
disp(size(X))
Xy = X(:,1);

