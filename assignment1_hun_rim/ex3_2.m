
f = @(x1, x2, mu) x1.^2 + mu * x2.^2;

x1 = linspace(-10, 10, 100);
x2 = linspace(-10, 10, 100);
[X1, X2] = meshgrid(x1, x2);

mu_values = [1, 10];

for i = 1:length(mu_values)
    mu = mu_values(i);
    
    Z = f(X1, X2, mu);
    
    % surfaces
    figure;
    surf(X1, X2, Z);
    xlabel('x1');
    ylabel('x2');
    zlabel('f(x1, x2)');
    title(['Surface Plot for \mu = ', num2str(mu)]);
    
    % contours
    figure;
    contour(X1, X2, Z);
    xlabel('x1');
    ylabel('x2');
    title(['Contour Plot for \mu = ', num2str(mu)]);
end
