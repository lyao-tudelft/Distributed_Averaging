function g = gridGraph( nrow, ncol )
% Create a grid graph
% nrow: number of desired rows in the graph
% ncol: number of desired columns in the graph
%
% g: a structure containing the Adjacency matrix 'adjMat', number of nodes
% 'nnode', number of rows 'nrow', number of columns 'ncol', and coodinates
% ofeach node 'coord'

nnode = nrow*ncol;          % Number of nodes in the grid
adjMat = zeros(nnode);      % Initialize the Adjacency matrix
r = 0:nrow-1;

for i = 1:nnode
    
    if sum(i == r*ncol+1)                               % Node is on the first column
        if i == 1
            adjMat(i, [i+1,i+ncol]) = 1;
        elseif i == nnode-ncol+1
            adjMat(i, [i+1, i-ncol]) = 1;
        else
            adjMat(i, [i+1, i-ncol, i+ncol]) = 1;
        end
    elseif sum(i == (r+1)*ncol)                         % Node is on the last column
        if i == ncol
            adjMat(i, [i-1, i+ncol]) = 1;
        elseif i == nnode
            adjMat(i, [i-1, i-ncol]) = 1;
        else
            adjMat(i, [i-1, i+ncol, i-ncol]) = 1;
        end
    elseif sum(i == 1:ncol)                             % Node is on the first row while not on the ends
        adjMat(i, [i+1, i-1, i+ncol]) = 1;
    elseif sum(i == nnode-ncol+1:nnode)                 % Node is on the last row while not on the ends
        adjMat(i, [i+1, i-1, i-ncol]) = 1;
    else                                                % Node is on the middle
        adjMat(i, [i+1, i-1, i-ncol, i+ncol]) = 1;
    end
    
    coord = zeros(2*nnode, 1);
    temp = zeros(2,1);
    
    % Fill coordinates for each node
    for n = 1:nnode
        temp(1) = ceil(n/ncol);
        temp(2) = n-(temp(1)-1)*ncol;
        coord((n-1)*2+1:(n-1)*2+2) = temp;
    end
    
    g = struct('adjMat',adjMat,'nnode',nnode,'nrow',nrow,'ncol',ncol,'coord', coord);
    
end


end

