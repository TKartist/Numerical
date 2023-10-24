load('householder/housegraph.mat');
degree = sum(A, 2);
[degreeSorted, indexNames] = sort(degree);
nameCells = cellstr(name);
count = length(degreeSorted);
maxDegree = degreeSorted(count);
coauthors = strings(5, maxDegree)
authors = strings(5, 1);
k = 1;
for i = count : -1 : count - 4 
    ind = indexNames(i);
    authors(k) = nameCells(ind);
    k = k + 1;
end
l = 1;
for i = count: -1 : count -4
    nameCount = 1;
    ind = indexNames(i);
    for j = 1 : count
        if (A(ind, j) == 1)
            coauthors(l, nameCount) = nameCells(j);
            nameCount = nameCount + 1;
        end
    end
    l = l + 1;
end
output = [authors coauthors];
     
