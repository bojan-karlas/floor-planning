function [ A ] = transClosure( A )
% TRANSCLOSURE Given an adjacency matrix of a directed graph, produces a
% transitive closure graph A+ such that there is an edge (u,v) in A+ for every
% two nodes u and v for which there is a directed path in A.

    if size(A,1) ~= size(A,2)
        error('Adjacency matrix must be square');
    end;

    n = size(A,1);

    for i = 1:ceil(log2(n))
        A = double(logical(A + logical(A * A)));
    end
end
