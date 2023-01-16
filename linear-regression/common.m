load Longley.dat
y = Longley(:,1);
x = Longley(:, 2:7);
X = [ones(16,1) x];
b = X\y;
Y= X*b;
errorbar(y,y-Y)
waitfor(gcf)