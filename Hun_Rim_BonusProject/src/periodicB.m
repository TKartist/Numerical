[x1, y1] = readTemperatureData('../data/temperature.txt', 1960, 1963);

x = [ones(length(x1), 1), cos(2 * pi * x1), sin(2 * pi * x1), cos(4 * pi * x1)];

[factors, ~, ~, ~] = leastSquares(x, y1);

h = height(x1);

z = factors(1) + factors(2) * cos(2 * pi * x1(1:h)) + factors(3) * sin(2 * pi * x1(1:h)) + factors(4) * cos(4 * pi * x1(1:h));
% z = factors(1) + factors(2) * cos(2 * pi * x1(1:h)) + factors(3) * sin(2 * pi * x1(1:h));
disp(factors(3) * sin(2 * pi * x1(1:h)));

subplot(1, 2, 1);
scatter(x1, y1, 'x', 'DisplayName', 'Data');
hold on;
plot(x1, z, 'r', 'DisplayName', 'Quadratic Model');
xlabel('Year');
ylabel('Production');
legend('Origin', 'Periodic Model B');
legend('Location', 'southoutside', 'Orientation', 'horizontal');
title('Swiss weather between 1960 Jan to 1963 Jan');
hold off;

[x2, y2] = readTemperatureData('../data/temperature.txt', 1960, 1970);

xL = [ones(length(x2), 1), cos(2 * pi * x2), sin(2 * pi * x2), cos(4 * pi * x2)];

[factorsL, ~, ~, ~] = leastSquares(xL, y2);

h2 = height(x2);

z2 = factorsL(1) + factorsL(2) * cos(2 * pi * x2(1:h2)) + factorsL(3) * sin(2 * pi * x2(1:h2)) + factorsL(4) * cos(4 * pi * x2(1:h2));

subplot(1, 2, 2);
scatter(x2, y2, 'x', 'DisplayName', 'Data');
hold on;
plot(x2, z2, 'r', 'DisplayName', 'Quadratic Model');
xlabel('Year');
ylabel('Production');
legend('Origin', 'Periodic Model B');
legend('Location', 'southoutside', 'Orientation', 'horizontal');
title('Swiss Weather between 1960 Jan to 1970 Jan');
hold off;
