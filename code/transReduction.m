function [ A_red ] = transReduction( A )
% TRANSREDUCTION Given a directed graph A, removes all edges (u,v) for which
% there already exists a directed path from node u to v that doesn't contain
% edge (u,v).

    if size(A,1) ~= size(A,2)
        error('Adjacency matrix must be square');
    end;

    n = size(A,1);
    A_red = zeros(n);

    for i = 1:n
        for j = 1:n
            if A(i,j) == 1
                A_red(i,j) = 1;

                for k = 1:n
                    if A(i,k) == 1 & A(k,j) == 1
                        A_red(i,j) = 0;
                    end
                end
            end
        end;
    end;
end
