
run('vars.m');
% Plot titles
land_title = 'Iterates on the Rosenbrock Function Energy Landscape';
norms_title = 'Gradient Norms Over Iterations';
fs_title = 'Functions over each iterations';
ntbt = " Newton Backtracking";
nt = " Newton";
gd = " Grad";
gdbt = " GradBacktracking";
gnorms = "norms";
fval = "function value";

[x_min_newton_bt, f_min_newton_bt, iterates_newton_bt, grads_newton_bt, newton_history_bt] = Newton(rosenbrock, grad, hess, x0, tol, N, 1);
[x_min_newton, f_min_newton, iterates_newton, grads_newton, newton_history] = Newton(rosenbrock, grad, hess, x0, tol, N, 0);
[x_history_bt, grad_history_bt, grad_norms_bt] = GD(rosenbrock, grad, x0, N, tol, 1);
[x_history, grad_history, grad_norms] = GD(rosenbrock, grad, x0, N, tol, 0);

% Exercise 1.4 : Plotting the obtained iterates on 2D energy landscapes

% Plotting landscapes
landscapes(iterates_newton_bt, strcat(land_title, ntbt));
landscapes(iterates_newton, strcat(land_title, nt));
landscapes(x_history_bt, strcat(land_title, gdbt));
landscapes(x_history, strcat(land_title, gd));

% Exercise 1.5 : Analyze convergence behaviours (gradient norms and function value)

% Plotting gradient norms
gradient_plots(grads_newton_bt, strcat(norms_title, ntbt), gnorms);
gradient_plots(grads_newton, strcat(norms_title, nt), gnorms);
gradient_plots(grad_norms_bt, strcat(norms_title, gdbt), gnorms);
gradient_plots(grad_norms, strcat(norms_title, gd), gnorms);

% Plotting function convergence
gradient_plots(newton_history_bt, strcat(fs_title, ntbt), fval);
gradient_plots(newton_history, strcat(fs_title, nt), fval);
gradient_plots(grad_history_bt, strcat(fs_title, gdbt), fval);
gradient_plots(grad_history, strcat(fs_title, gd), fval);

% we add one element at each iterations so this is fine.
fprintf('Iterations for Newton method with backtracking: %d\n', size(grads_newton_bt, 2));
fprintf('Iterations for Gradient method with backtracking: %d\n', size(grad_norms_bt, 2));

