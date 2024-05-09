run('vars.m');

[bfgs_x, bfgs_x_list, bfgs_norm_list, bfgs_f_list] = BFGS(rosenbrock, grad);

bfgs_title = 'Iterates on the Rosenbrock Function Energy Landscape (BFGS)';
bfgs_grad_title = 'Gradient Norms Over Iterations (BFGS)';
bfgs_f_title = "Functions over each iteration (BFGS)";
gnorms = "norms";
gval = "function values";

landscapes(bfgs_x_list, bfgs_title);
gradient_plots(bfgs_norm_list, bfgs_grad_title, gnorms);
gradient_plots(bfgs_f_list, bfgs_f_title, gval);

fprintf('Iterations for Newton method with backtracking: %d\n', size(bfgs_f_list, 1));
