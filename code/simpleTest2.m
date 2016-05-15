n = 5;
Amin = [100 100 100 100 100; ...
         20  50  80 150 200; ...
        180  80  80  80  80; ...
         30 150  30 200 110];

H = [ 0 0 1 0 0;
      0 0 1 0 0;
      0 0 0 0 1;
      0 0 0 0 1;
      0 0 0 0 0 ];

V = [ 0 0 0 1 0;
      1 0 0 0 0;
      0 0 0 1 0;
      0 0 0 0 0;
      0 0 0 0 0 ];

for iter = 1:4
    a = Amin(iter,:)';
    tic
    [ x, y, w, h, Rect_W, Rect_H ] = optimalPlacement(H,V,a);
    toc
    subplot(2,2,iter)
    for i=1:n
        fill([x(i); x(i)+w(i); x(i)+w(i); x(i)],[y(i);y(i);y(i)+h(i);y(i)+h(i)],0.90*[1 1 1]);
        hold on;
    end
    
    for i=1:n
        t = text(x(i)+w(i)/2, y(i)+h(i)/2,['B_',int2str(i)]);
        set(t, 'HorizontalAlignment', 'center');
        set(t, 'VerticalAlignment', 'middle');
        %set(t, 'BackgroundColor', 'white');
        set(t, 'FontWeight', 'bold');
        set(t, 'FontName', 'Cambria');
    end
    axis([0 Rect_W 0 Rect_H]);
    axis equal; axis off;
end