function [x, y] = readTemperatureData(filepath, s, e)
    data = readtable(filepath, 'NumHeaderLines', 16);
    year = data.Var1;
    temperatures = [data.Var2, data.Var3, data.Var4, data.Var5, data.Var6, data.Var7, data.Var8, data.Var9, data.Var10, data.Var11, data.Var12, data.Var13];
    x = zeros((e - s) * 12, 1);
    y = zeros((e - s) * 12, 1);
    e = e - 1;
    count = 0;
    for i = 1:height(data)
        if year(i) >= s
            for j = 1 : 12
                y(count * 12 + j, 1) = temperatures(i, j);
                x(count * 12 + j, 1) = year(i) + (1 / 12 * (j - 1)) - s;
            end
            count = count + 1;
        end
        if year(i) >= e
            break
        end
    end
end