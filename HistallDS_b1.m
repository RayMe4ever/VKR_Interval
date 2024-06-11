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
% b1(b1 > 5) = Inf;
% b1(b1 < -5) = -Inf;
b1_filtered=b1(abs(b1)<5);
% b1(b1 < -5) = 0;
% histfit(b1, 50, 'normal');
hist(b1_filtered, 50);

title('Распределение \beta_1 для выборки составленной из всех наборов данных','FontSize', 14);