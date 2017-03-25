function coord = getCoord( node, g )
% Return the coordinate of a specific node
% node: desired node indx
% g: the underlying graph structure
%
% coord: the outcome array whose first entry is row number, second entry is
% column number

coord = g.coord((node-1)*2+1:(node-1)*2+2);

end

