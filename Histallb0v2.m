tableNames = {'poly0', 'poly1', 'poly2', 'poly3', 'poly4', 'poly5', 'poly6',... 
     'poly7', 'poly8', 'poly9'};
b1=[];
b0=[];
y_max=-Inf;
x_max=-Inf;
y_min=Inf;
x_min=Inf;
% Цикл для итерации по названиям таблиц
for i = 1:length(tableNames)
    tableName = tableNames{i};  
myarray=evalin('base', tableName);
[tmp_b1,tmp_b0]=evaluate_b1_b0(tableName);
b1 = cat(1, b1, tmp_b1);
b0 = cat(1, b0, tmp_b0);

end
b0_filtered=b0(abs(b0)<1000);
h=histogram(b0_filtered, 50);hold on;
binEdges = h.BinEdges;
binCounts = h.Values;
binCenters = (binEdges(1:end-1) + binEdges(2:end))/2;
[maxHeight, maxIndex] = max(binCounts);
bigIndex = find(binCounts > (maxHeight/2));
minbigIndex = min(bigIndex);
maxbigIndex = max(bigIndex);

title('Распределение \beta_0 для выборки составленной из всех наборов данных','FontSize', 18);

% Определение координат вершин многоугольника
ylimits = ylim;
x_fill = [binCenters(minbigIndex), binCenters(maxbigIndex), binCenters(maxbigIndex), binCenters(minbigIndex)];
y_fill = [ylimits(1), ylimits(1), ylimits(2), ylimits(2)];
% Заполнение области
fill(x_fill, y_fill, 'green', 'FaceAlpha', 0.3, 'EdgeColor', 'none');
% Построение вертикальных линий
plot_variable_b1=plot([binCenters(minbigIndex), binCenters(minbigIndex)], ylim, 'green--', 'LineWidth', 2);
plot([binCenters(maxbigIndex), binCenters(maxbigIndex)], ylim, 'green--', 'LineWidth', 2);

legend(plot_variable_b1,...
    'Оценка вариабельности \beta_0',...
    'Location', 'northwest','FontSize', 14);