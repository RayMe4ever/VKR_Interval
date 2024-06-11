% Создание ячейки с названиями таблиц
tableNames = {'poly0', 'poly1', 'poly2', 'poly3', 'poly4', 'poly5', 'poly6',... 
     'poly7', 'poly8', 'poly9'};
% Создание сетки элементарных интервалов
mesh_x = [];
% Создание пустой переменной для хранения общего размера таблиц
Int_counter = 0;

% Цикл для итерации по названиям таблиц
for i = 1:length(tableNames)
    tableName = tableNames{i};
%     Вот сюда надо добавить цикл
end

disp(['Общий размер всех таблиц: ', num2str(Int_counter)]);



for k=1:(size(evalin('base', tableName),1))
    if evalin('base', [tableName '{k,3}'])==0
        mesh_x = cat(1,mesh_x,evalin('base', [tableName '{k,1}']));   
    end
    if evalin('base', [tableName '{k,4}'])==0
        mesh_y = cat(1,mesh_y,evalin('base', [tableName '{k,2}']));   
    end
end
% Сетка по Х
for k=1:(size(evalin('base', tableName),1))
    for sign = ['-','+']
        flaq_same=0;
        if sign=='-' 
            border=evalin('base', [tableName '{k,1}'])-evalin('base', [tableName '{k,3}']);
        end
        if sign=='+' 
            border=evalin('base', [tableName '{k,1}'])+evalin('base', [tableName '{k,3}']);
        end
        for t=1:(length(mesh_x))
            if (border)==mesh_x(t)
            flaq_same=1;
            end
        end
        if flaq_same==0
          mesh_x = cat(1,mesh_x,border);
        end 
    end
end
mesh_x=sort(mesh_x);

% evalin('base', [tableName '{1,4}'])