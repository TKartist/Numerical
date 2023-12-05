lambda = eig(A_test);

figure;
bar(1:length(lambda), abs(lambda));
set(gca, 'YScale', 'log');
xlabel('Index');
ylabel('EigenValues');
title('EigenValues of A-test matrix');

minEigenValue = min(abs(lambda));
maxEigenValue = max(abs(lambda));
condNum = maxEigenValue / minEigenValue;

text(1, maxEigenValue, ['Minimum eig value:' num2str(minEigenValue)], 'VerticalAlignment', 'top', 'HorizontalAlignment','left');
text(40, maxEigenValue, ['Maximum eig value:' num2str(maxEigenValue)], 'VerticalAlignment', 'top', 'HorizontalAlignment','left');
text(80, maxEigenValue, ['Conditional Number:' num2str(condNum)], 'VerticalAlignment', 'top', 'HorizontalAlignment','left');