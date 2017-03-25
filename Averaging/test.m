clear all;

nrow = 5;   % Define number of rows in the grid
ncol = 4;   % Define number of columns in the grid
nnode = nrow*ncol;

g = cellGraph(nrow,ncol);     % Build the grid
U = triu(g.adjMat);
L = tril(g.adjMat);
A = U-L';
G = graph(g.adjMat);
figure;
plot(G);