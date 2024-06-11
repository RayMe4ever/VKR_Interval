% Пример данных
data = [10, 12, 9, 11, 13, 15, 14, 16, 18, 17, 20, 19];
group = [1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 3];

% Проведение ANOVA
[p, tbl, stats] = anova1(data, group);

% Применение критерия Тьюки
results = multcompare(stats, 'CType', 'tukey-kramer');

% Отображение результатов
disp(results);