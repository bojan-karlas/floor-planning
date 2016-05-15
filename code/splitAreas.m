function [ a1, a2 ] = splitAreas( a )
% SPLITAREAS Given a vector of integer values, uses a greedy strategy to split
% those values into two subsets such that the sums of values in the resulting
% subsets are as close to each other as possible. Returns two vectors with
% resulting subsets.

    [ as, indx ] = sort(a);
    indx = flip(indx)';

    sum1 = 0; sum2 = 0;
    a1 = []; a2 = [];

    for i = indx
        if sum1 < sum2
            a1 = [a1 i];
            sum1 = sum1 + a(i);
        else
            a2 = [a2 i];
            sum2 = sum2 + a(i);
        end;
    end;
end
