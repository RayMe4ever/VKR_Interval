% Создание ячейки с названиями таблиц
tableNames = {'poly0', 'poly1', 'poly2', 'poly3', 'poly4', 'poly5', 'poly6',... 
     'poly7', 'poly8', 'poly9'};

% Создание пустой переменной для хранения общего размера таблиц
Int_counter = 0;

% Цикл для итерации по названиям таблиц
for i = 1:length(tableNames)
    % Получение имени текущей таблицы
    tableName = tableNames{i};  
    % Подсчет общего размера таблиц
    Int_counter = Int_counter + size(evalin('base', tableName),1);
end

disp(['Общий размер всех таблиц: ', num2str(Int_counter)]);










