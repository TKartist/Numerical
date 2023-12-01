function [year, production, change] = readData(filepath)
    data = readtable(filepath, 'NumHeaderLines', 3);
    data = renamevars(data, ["Var1", "Var2", "Var3"], ["year", "production", "change"]);
    year = data.year;
    production = data.production;
    change = data.change;   
end