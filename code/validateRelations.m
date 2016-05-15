function [ valid ] = validateRelations( L, U )
% VALIDATERELATIONS Check if the two relations L and U, when combined, contain
% cycles. If they do, they are proclaimed to be invalid.

    if size(L,1) ~= size(L,2) | size(L,1) ~= size(U,1) | size(U,1) ~= size(U,2)
        error('Input matrices must be square and equal dimensions.');
    end;

    n = size(L,1);
    if L + L' + U + U' == ones(n) - eye(n)
        valid = 1;
    else
        valid = 0;
    end
end
