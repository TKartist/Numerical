%% Examples of gradient descent method

% Remark: pay attention to the value of the step.

%% ROSENBROCK FUNCTION

% Global minimum is (a,a^2)

a = 1;
b = 100;
f = @(x)((a-x(1))^2+b*(x(2)-x(1)^2)^2);


gradient = @(x)


x_in = [0;0];
alpha = 1e-4;
n_it = 400000;
tol = 1e-6;

xvect = grad_method(x_in, alpha, gradient, n_it, tol);


%% PLOT
figure(1)
x0 = -4:0.1:4;
y0 = -4:0.1:4;
[X, Y] = meshgrid(x0, y0);
f= @(x,y) 3*(y - x.^2).^2 + (1 - x).^2;
surf(X, Y, f(X,Y));
hold on
plot3(xvect(:,1),xvect(:,2),f(xvect(:,1),xvect(:,2)),'r-','LineWidth', 5) % here we plot every points we obtained




