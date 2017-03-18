function node = nextNode( cNode, des, g )
% Find next node that the tuple should be sent to.
% cNode: current node that has the tuple
% des: destination of the tuple
% g: the underlying graph structure
%
% node: the next node that has been determined

G = graph(g.adjMat);
nei = neighbors(G, cNode);
distance = zeros(length(nei),1);

for i = 1:length(nei)
    distance(i) = dis2des(nei(i),des,g);
end
[~,I] = min(distance);
node = nei(I);

end

