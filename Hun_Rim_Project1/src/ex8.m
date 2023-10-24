load('householder/housegraph.mat');

nameCell = cellstr(name);


indG = find(strcmp(nameCell, 'Golub'));
indM = find(strcmp(nameCell, 'Moler'));
indS = find(strcmp(nameCell, 'Saunders'));
indTC = find(strcmp(nameCell, 'TChan'));
indD = find(strcmp(nameCell, 'Demmel'));


common_GM = find(A(indG,:) .* A(indM,:));
common_GS = find(A(indG,:) .* A(indS,:));
common_TCD = find(A(indTC,:) .* A(indD,:));


names_GM = nameCell(common_GM);
names_GS = nameCell(common_GS);
names_TCD = nameCell(common_TCD);

% Display the results(optional stuff)
disp('Golub and Moler:');
for i = 1:numel(names_GM)
    disp(names_GM{i});
end

disp(' Golub and Saunders:');
for i = 1:numel(names_GS)
    disp(names_GS{i});
end

disp('TChan and Demmel:');
for i = 1:numel(names_TCD)
    disp(names_TCD{i});
end