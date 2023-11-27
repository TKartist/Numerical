[year, production, ~] = readData("../data/crudeOil.txt");

duration = 2011 - 1980 + 1;

y = str2double(production);

x = [ones(duration, 1), year(1:duration), year(1:duration).^2, year(1:duration).^3];

[factors, ~, ~, ~] = leastSquares(x, y(1:duration));

z = factors(1) + factors(2) * year(1:duration) + factors(3) * year(1:duration).^2 + factors(4) * year(1:duration).^3;

subplot(1, 2, 1);
scatter(year(1:duration), y(1:duration), 'x', 'DisplayName', 'Data');
hold on;
plot(year(1:duration), z(1:duration), 'r', 'DisplayName', 'Quadratic Model');
xlabel('Year');
ylabel('Production');
legend('Origin', 'Cubic Model');
legend('Location', 'southoutside', 'Orientation', 'horizontal');
title('Crude Oil Production 1980 - 2012');
hold off;

[~, productionK, ~] = readData("../data/kerosene.txt");
yK = productionK(1:duration);

xK = [ones(duration, 1), year(1:duration), year(1:duration).^2, year(1:duration).^3];

[factorsK, ~, ~, ~] = leastSquares(xK, yK);

zK = factorsK(1) + factorsK(2) * year(1:duration) + factorsK(3) * year(1:duration).^2 + factorsK(4) * year(1:duration).^3;


subplot(1, 2, 2)
scatter(year(1:duration), yK, 'x', 'DisplayName', 'Quadratic Fit');
hold on;
plot(year(1:duration), zK);
xlabel('year');
ylabel('production');
legend('Origin', 'Cubic Model');
legend('Location', 'southoutside', 'Orientation', 'horizontal');
title('Kerosene Production 1980 - 2012');
hold off;