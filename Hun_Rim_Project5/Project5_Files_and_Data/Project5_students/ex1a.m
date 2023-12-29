% Define the objective function coefficients
c = [4; 1];

% Define the inequality constraint matrix and vector
A = [1, 2; -1, -1; -2, -3];
b = [40; -30; -72];

% Define lower bounds for variables
lowerBounds = [0; 0];

% Solve the linear programming problem
options = optimoptions('linprog', 'Display', 'off');
[x, fval, exitflag] = linprog(c, A, b, [], [], lowerBounds, [], options);

% Display the optimal solution
disp('Optimal Solution:');
disp(['x = ', num2str(x(1))]);
disp(['y = ', num2str(x(2))]);
disp(['Optimal Objective Value: ', num2str(fval)]);

% Plot the feasible region
figure;
hold on;

% Plot the inequalities
fimplicit(@(x, y) x + 2*y - 40, 'r', 'LineWidth', 2);  % x + 2y ≤ 40
fimplicit(@(x, y) x + y - 30, 'g', 'LineWidth', 2);   % x + y ≥ 30
fimplicit(@(x, y) 2*x + 3*y - 72, 'b', 'LineWidth', 2); % 2x + 3y ≥ 72

% Highlight the feasible region
x_vals = linspace(0, 36, 100);
y1_vals = (40 - x_vals) / 2;
y2_vals = max(0, 30 - x_vals);
y3_vals = max((72 - 2*x_vals) / 3, 0);
xp = [x(1), x_vals(100), x_vals(100), x(1)];
yp = [x(2), y1_vals(100), max(y2_vals(100), y3_vals(100)), x(2)];

% Plot the filled region
fill(xp, yp, 'c', 'FaceAlpha', 0.3);

% Plot the optimal solution point
plot(x(1), x(2), 'ro', 'MarkerSize', 10, 'LineWidth', 2);

% Set plot properties
title('Feasible Region and Optimal Solution');
xlabel('x');
ylabel('y');
legend('x + 2y \leq 40', 'x + y \geq 30', '2x + 3y \geq 72', 'Feasible Region', 'Optimal Solution');

hold off;
