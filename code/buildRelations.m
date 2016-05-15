function [ L, U ] = buildRelations( a )
% BUILDRELATIONS Given a set of rectangle areas, tries to come up with a
% relative arrangement of those rectangles, such that the area is most evenly
% distributed accross the total area. Returns the vertical and horizontal
% positioning graphs as matrices.

    n = length(a);
    [ L, U ] = splitAndRelate(a, 1:n, zeros(n), zeros(n), 0);

    function [ L, U ] = splitAndRelate( a, a_indx, L, U, direction)
        [ a1_indx, a2_indx ] = splitAreas(a);
        for i = a_indx(a1_indx)
            for j = a_indx(a2_indx)
                if direction == 0
                    L(i,j) = 1;
                else
                    U(i,j) = 1;
                end
            end
        end

        if length(a1_indx) > 1
            [ L, U ] = splitAndRelate( a(a1_indx), a_indx(a1_indx), L, U, ~direction);
        end;
        if length(a2_indx) > 1
            [ L, U ] = splitAndRelate( a(a2_indx), a_indx(a2_indx), L, U, ~direction);
        end;
    end
end
