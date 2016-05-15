a = [70; 20; 40; 15; 100; 200; 230; 35; 145; 25];
%a = [10; 20; 40; 15; 100];

[ L, U ] = buildRelations(a);

H = transReduction(L);
V = transReduction(U);

gH = drawgraph(H); view(gH);
gV = drawgraph(V); view(gV);

[ x, y, w, h, Rect_W, Rect_H ] = optimalPlacement(H,V,a);

n = length(a);

for i=1:n
    fill([x(i); x(i)+w(i); x(i)+w(i); x(i)],[y(i);y(i);y(i)+h(i);y(i)+h(i)],0.90*[1 1 1]);
    hold on;
end

for i=1:n
    t = text(x(i)+w(i)/2, y(i)+h(i)/2,['B_{',int2str(i),'}']);
    set(t, 'HorizontalAlignment', 'center');
    set(t, 'VerticalAlignment', 'middle');
    %set(t, 'BackgroundColor', 'white');
    set(t, 'FontWeight', 'bold');
    set(t, 'FontName', 'Cambria');
end

axis([0 Rect_W 0 Rect_H]);
axis equal; axis off;