[year, production, ~] = readData("../data/crudeOil.txt");

duration = 2012 - 1980 + 1;

% Extract numeric values from production
y = str2double(production);

% Create the design matrix X with quadratic terms
x = [ones(duration, 1), year(:), year(:).^2];

% Calculate least squares solution
[factors, ~, ~, ~] = leastSquares(x, y);

% Evaluate the quadratic model for the given years
z = factors(1) + factors(2) * year(:) + factors(3) * year(:).^2;

% Display the differences
for k = 2:duration
    disp(z(k) - z(k - 1));
end

% Plot the data and the quadratic model
subplot(1, 2, 1);
scatter(year, y, 'x', 'DisplayName', 'Data');
hold on;
plot(year, z, 'r', 'DisplayName', 'Quadratic Model');
xlabel('Year');
ylabel('Production');
legend('Location', 'southoutside', 'Orientation', 'horizontal');
title('Crude Oil Production 1980 - 2012');
hold off;

[~, productionK, ~] = readData("../data/kerosene.txt");
% [~, yK, zK] = getLinearModel(year, productionK, duration);
yK = zeros(duration, 1);
for i = 1:duration
    yK(i) = productionK(i);
end
xK = ones(duration, 3);

for j = 1:duration
    xK(j, 3) = year(j) * year(j);
    xK(j, 2) = year(j);
end

[factorsK, ~, ~, ~] = leastSquares(xK, yK);

zK = zeros(duration, 1);
for k = 1:duration
    zK(k) = factorsK(1) + (factorsK(2) * year(k)) + (factorsK(3) * year(k)^2);
end

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