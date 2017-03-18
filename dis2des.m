function dis = dis2des( node, des, g )
% Compute the distance to the destination from the current node
% node: current node
% des: destination node
% g: the underling graph structure
%
% dis: the desired distance

nodeCoord = getCoord(node,g);
desCoord = getCoord(des,g);

dis = sum(abs(nodeCoord-desCoord));

end

