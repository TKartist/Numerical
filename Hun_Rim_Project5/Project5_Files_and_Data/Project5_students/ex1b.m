% has to be converted to -ve as we are looking for maximum
c = [-60; -70];

A = [25, 40; 1, 1];
b = [7000; 265];

lowerBounds = [0; 0];

options = optimoptions('linprog', 'Display','off');
[x, fval, exitflag] = linprog(c, A, b, [], [], lowerBounds, [], options);

disp('Optimal Solution:');
disp(['x = ', num2str(x(1))]);
disp(['y = ', num2str(x(2))]);
disp(['Optimal Objective Value: ', num2str(-fval)]);

figure;
hold on;

fimplicit(@(x, y) 25*x + 40*y - 7000, 'r', 'LineWidth', 2);
fimplicit(@(x, y) x + y - 265, 'b', 'LineWidth', 2);

x_vals = linspace(0, 265, 265);
y1_vals = (7000 - 25 * x_vals) / 40;
y2_vals = 265 - x_vals;

y_fill = zeros(size(x_vals));
for i = 1:length(x_vals)
    y_fill(i) = min(y1_vals(i), y2_vals(i));
end

fill([x_vals, 0, 0], [y_fill, 0, 0], 'c', 'FaceAlpha', 0.3);

plot(x(1), x(2), 'ro', 'MarkerSize', 10, 'LineWidth', 2);

title('Feasible Region and Optimal Solution');
xlabel('x');
ylabel('y');
legend('25x + 40y \leq 7000', 'x + y \leq 265', 'Feasible Region', 'Optimal Solution');

hold off;
