
function gradient_plots(norms, Title, y_label)
    figure;
    hold on;
    semilogy(norms, 'r-o', 'LineWidth', 1.0, 'MarkerSize', 4);
    xlabel('Iterations');
    ylabel(y_label);
    title(Title);
    set(gca, 'YScale', 'log');
    hold off;
end