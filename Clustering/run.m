%load X
meanX=[-1 1];
meanY=[-1 1];
X=gen2Ddata(50,meanX,meanY);
kmeans(X,4,1);
