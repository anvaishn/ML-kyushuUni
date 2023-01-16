%  Load Face dataset
load ('faces.mat');

%  Display the first 100 faces in the dataset
displayData(X(1:100, :));
print -dpng 100faces.png

fprintf(['\nDiaplaying the first 100 faces.\n']); 
fprintf('Program paused. Press enter to continue.\n');
%pause;
kbhit();

%  Before running PCA, it is important to first normalize X by
%  subtracting 
%  the mean value from each feature
[X_norm, mu, sigma] = featureNormalize(X);

%  Run PCA
[U, S] = pca(X_norm);

%  Visualize the top 36 eigenvectors found
displayData(U(:, 1:36)');
print -dpng 36eigenfaces.png

fprintf(['\nVisualize the top 36 eigenvectors.\n']); 
fprintf('Program paused. Press enter to continue.\n');
%pause;
kbhit();

fprintf(['\nVisualizing the projected (reduced dimension) faces.\n']); 

K = 100;
Z = projectData(X_norm, U, K);
X_rec  = recoverData(Z, U, K);

% Display normalized data
subplot(1, 2, 1);
displayData(X_norm(1:100,:));
title('Original faces');
axis square;

% Display reconstructed data from only k eigenfaces
subplot(1, 2, 2);
displayData(X_rec(1:100,:));
title('Recovered faces');
axis square;
print -dpng orig_vs_rec.png