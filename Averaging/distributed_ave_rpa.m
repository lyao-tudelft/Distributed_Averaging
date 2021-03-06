clear all;

nrow = 3;   % Define number of rows in the grid
ncol = 4;   % Define number of columns in the grid
nnode = nrow*ncol;

g = cellGraph(nrow,ncol);     % Build the grid
% G = graph(g.adjMat);
% figure;
% plot(G);
x = randi(5, nnode, 1);    % Assign initial values

errthr = 1e-3;     % Assign error threshold
k = 0;
kmax = 10^5;
i = 0;

err = randPathAve(g, x, errthr, kmax);
figure;
plot(err);