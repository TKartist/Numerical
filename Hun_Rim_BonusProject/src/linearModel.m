[year, production, ~] = readData("../data/crudeOil.txt");

duration = 2012 - 1980 + 1;
% [xc, yc, zc] = getLinearModel(year, production, duration);
y = zeros(duration, 1);
for i = 1:duration
    y(i) = str2double(production(i));
end

x = ones(duration, 2);

for j = 1:duration
    x(j, 2) = year(j);
end

[factors, ~, ~, ~] = leastSquares(x, y);

z = zeros(duration);
for k = 1:duration
    z(k) = factors(1) + factors(2) * year(k);
end
subplot(1, 2, 1);
scatter(year(1:duration), y, 'o', 'DisplayName', 'Data');
hold on;
plot(year(1:duration), z);
xlabel('year');
ylabel('production');
legend('Origin', 'Linear Model');
legend('Location', 'southoutside', 'Orientation', 'horizontal');
title('Crude Oil  Production 1980 - 2012');
hold off;

[~, productionK, ~] = readData("../data/kerosene.txt");
% [~, yK, zK] = getLinearModel(year, productionK, duration);
yK = zeros(duration, 1);
for i = 1:duration
    yK(i) = productionK(i);
end
xK = ones(duration, 2);

for j = 1:duration
    xK(j, 2) = year(j);
end

[factorsK, ~, ~, ~] = leastSquares(xK, yK);

zK = zeros(duration);
for k = 1:duration
    zK(k) = factorsK(1) + factorsK(2) * year(k);
end

subplot(1, 2, 2)
scatter(year(1:duration), yK, 'o', 'DisplayName', 'Data');
hold on;
plot(year(1:duration), zK);
xlabel('year');
ylabel('production');
legend('Origin', 'Linear Model');
legend('Location', 'southoutside', 'Orientation', 'horizontal');
title('Kerosene Production 1980 - 2012');
hold off;