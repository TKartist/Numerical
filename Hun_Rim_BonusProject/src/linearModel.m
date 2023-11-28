[year, production, ~] = readData("../data/crudeOil.txt");

duration = 2011 - 1980 + 1;

year = year - 1980;

y = str2double(production);

x = [ones(duration, 1), year(1:duration)];

[factors, ENLC, SELC, RMSELC] = leastSquares(x, y(1:duration));

z = factors(1) + factors(2) * year(1:duration);
linearCrudePrediction = factors(1) + factors(2) * 2012;
subplot(1, 2, 1);
scatter(year(1:duration), y(1:duration), 'o', 'DisplayName', 'Data');
hold on;
plot(year(1:duration), z);
xlabel('year');
ylabel('production');
legend('Origin', 'Linear Model');
legend('Location', 'southoutside', 'Orientation', 'horizontal');
title('Crude Oil  Production 1980 - 2011');
hold off;

[~, productionK, ~] = readData("../data/kerosene.txt");
yK = productionK;

xK = [ones(duration, 1), year(1:duration)];

[factorsK, ENLK, SELK, RMSELK] = leastSquares(xK, yK(1:duration));

zK = factorsK(1) + factorsK(2) * year(1:duration);

linearKeroPrediction = factorsK(1) + factorsK(2) * 2012;

subplot(1, 2, 2)
scatter(year(1:duration), yK(1:duration), 'o', 'DisplayName', 'Data');
hold on;
plot(year(1:duration), zK);
xlabel('year');
ylabel('production');
legend('Origin', 'Linear Model');
legend('Location', 'southoutside', 'Orientation', 'horizontal');
title('Kerosene Production 1980 - 2011');
hold off;