%The following MATLAB script can be used to plot the boundaries of the unit balls of p-norm given in Fig. 3.1.
x = linspace(-1,1,101);
p = [1 1.5 2 3 5 10];
figure, clf, whitebg('white'),
set(gcf, 'Color', [1 1 1]); hold on;
for i = 1:length(p)
    y = (1-(abs(x).^p(i))).^(1/p(i));
    x2 = [x fliplr(x)];
    y2 = [y -fliplr(y)];
    plot(x2,y2, 'Linewidth', 2)
end

axis equal; axis tight;