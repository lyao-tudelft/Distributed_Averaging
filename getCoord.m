function coord = getCoord( node, g )
% Return the coorsinate of a specific node
% node: desired node indx
% g: the underlying graph structure
%
% coord: the outcome array whose first entry is row number, second entry is
% column number

coord = zeros(2,1);

coord(1) = ceil(node/g.ncol);
coord(2) = node-(coord(1)-1)*g.ncol;

end

