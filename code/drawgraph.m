function [graph] = drawgraph( AdjMat )
% DRAWGRAPH Draws a graph given its adjacency matrix.

    graph = biograph(AdjMat);

    graph.EdgeType = 'straight';
    graph.NodeAutoSize = 'off';

    nodes = get(graph, 'Nodes');
    for i = 1:length(nodes)
        nodes(i).ID = ['B',int2str(i)];
        nodes(i).Label = ['B',int2str(i)];
        nodes(i).Shape = 'circle';
        nodes(i).Color = [1 1 1];
        nodes(i).LineWidth = 2;
        nodes(i).LineColor = [0 0 0];
        nodes(i).FontSize = 11;
        nodes(i).size = [30 30];
    end

    edges = get(graph, 'Edges');
    for i = 1:length(edges)
        edges(i).LineColor = [0 0 0];
    end
end
