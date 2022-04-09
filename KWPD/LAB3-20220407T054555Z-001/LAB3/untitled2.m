close all

x1 = linspace(0,1,100);
x2 = linspace(0.5,1,100);

y1 = 3 * x1 + 2;
y2 = -x1 + 4;
y3 = 5 * x1 + 1;

figure
hold on;
grid on;

b.FaceColor = '#D95319';

plot(x1, y1, 'b')
plot(x1, y2)
plot(x1, y3, 'g')

xlim([0,1])
ylim([0, 6])

hold off;