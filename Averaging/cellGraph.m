function g = cellGraph( nrow, ncol )
% Create a cellular graph
% nrow: number of desired rows in the graph
% ncol: number of desired columns in the graph
%
% g: a structure containing the Adjacency matrix 'adjMat', number of nodes
% 'nnode', number of rows 'nrow', number of columns 'ncol', and coodinates
% ofeach node 'coord'

nnode = ncol*nrow;
adjMat = zeros(nnode);

coord = zeros(2*nnode,1);

% Node coordinates
for node = 1:nnode
    coord((node-1)*2+1) = ceil(node/ncol);
    
    if mod(coord((node-1)*2+1),2)
        coord((node-1)*2+2) = node-(coord((node-1)*2+1)-1)*ncol;
    else
        coord((node-1)*2+2) = node-(coord((node-1)*2+1)-1)*ncol+0.5;
    end
    
end
gtemp = struct('adjMat',adjMat,'nnode',nnode,'nrow',nrow,'ncol',ncol,'coord', coord);

for node = 1:nnode
    
    coordinate = getCoord(node, gtemp);
    if coordinate(1) == 1        % Node is on the first row
        if node == 1
            adjMat(node, [node+1, node+ncol]) = 1;
        elseif node == ncol
            adjMat(node, [node-1, node+ncol, node+ncol-1]) = 1;
        else
            adjMat(node, [node+1, node-1, node+ncol, node+ncol-1]) = 1;
        end
    elseif coordinate(1) == nrow         % Node is on the last row
        if mod(nrow,2)
            if node == nnode
                adjMat(node, [node-1, node-ncol, node-ncol-1]) = 1;
            elseif node == nnode-ncol+1
                adjMat(node, [node+1, node-ncol]) = 1;
            else
                adjMat(node, [node-1, node+1, node-ncol, node-ncol-1]) = 1;
            end
        else
            if node == nnode
                adjMat(node, [node-1, node-ncol]) = 1;
            elseif node == nnode-ncol+1
                adjMat(node, [node+1, node-ncol, node-ncol+1]) = 1;
            else
                adjMat(node, [node-1, node+1, node-ncol, node-ncol+1]) = 1;
            end
        end
    elseif coordinate(2) == 1       % Nodes on the first column
        adjMat(node, [node+1, node-ncol, node+ncol]) = 1;
    elseif coordinate(2) == 1.5     % Nodes on the 1.5th column
        adjMat(node, [node+1, node-ncol, node-ncol+1, node+ncol, node+ncol+1]) = 1;
    elseif coordinate(2) == ncol    % Nodes on the last column
        adjMat(node, [node-1, node-ncol, node-ncol-1, node+ncol, node+ncol-1]) = 1;
    elseif coordinate(2) == ncol+0.5    % Nodes on the last+0.5th column
        adjMat(node, [node-1, node-ncol, node+ncol]) = 1;
    elseif mod(coordinate(1),2)     % Nodes on even rows
        adjMat(node, [node-1, node+1, node-ncol, node-ncol-1, node+ncol, node+ncol-1]) = 1;
    else
        adjMat(node, [node-1, node+1, node-ncol, node-ncol+1, node+ncol, node+ncol+1]) = 1;
    end
    
end

g = struct('adjMat',adjMat,'nnode',nnode,'nrow',nrow,'ncol',ncol,'coord', coord);

end

