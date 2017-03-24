function err = randPathAve( g, x, errthr, kmax )
% Randomized Path Averaging
% g: the underlying graph structure
% errthr: error threshold
% kmax: maximum number of iteration round
%
% err: error

nnode = g.nnode;
x_ave = sum(x)/length(x);
err = inf;
k = 0;

while err(end) >= errthr && k <= kmax

    node = randi(nnode);    % Pick a node randomly
    des = randi(nnode);     % pick a destination that is not the Node
    while des == node
        des = randi(nnode);
    end
    
    dis = dis2des(node, des, g);
    interNode = [];
    hop = 1;
    interNode(1) = node;
    
    while dis > 1
        hop = hop+1;
        interNode(hop) = nextNode(interNode(hop-1), des, g);
        dis = dis2des(interNode(hop), des, g);
    end
    
    x(interNode) = sum(x(interNode))/length(interNode);
    
    k = k+1;
    err(k) = norm(x-x_ave);
    
end

end

