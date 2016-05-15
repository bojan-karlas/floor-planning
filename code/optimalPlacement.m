function [ x, y, w, h, Rect_W, Rect_H ] = optimalPlacement( H, V, a )
% OPTIMALPLACEMENT For given horizontal and vertical positional relations
% of rectangles, along with their areas, produces an optimal placement
% that minimizes the circumference of the overall bounding rectangle.

    if size(H,1) ~= size(H,2) || size(H,1) ~= size(V,1) || size(V,1) ~= size(V,2)
        error('H and V must be square matrices with equal dimensions.');
    end;
    if size(H,1) ~= length(a)
        error('Length of vector a must be the same as the heigt and width of H and V.');
    end;

    n = length(a);

    cvx_begin quiet
        variables x(n) y(n);
        variable w(n) nonnegative;
        variable h(n) nonnegative;
        variable Rect_W nonnegative;
        variable Rect_H nonnegative;
        minimize 2*(Rect_W+Rect_H);
        subject to
            0 <= x <= Rect_W - w;
            0 <= y <= Rect_H - h;
            diag(x)*H + diag(w)*H - H*diag(x) <= 0;
            diag(y)*V + diag(h)*V - V*diag(y) <= 0;
            a .* inv_pos(h) - w <= 0;
    cvx_end
end
