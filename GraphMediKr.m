
array = cell(4, 1); % Создаем пустой массив размером 4x1
mesh = [];
% Заполнение массива массивов
array{1} = [0.5, 2.5]; % Первый массив
array{2} = [1.7, 3.8]; % Второй массив
array{3} = [3.8, 6.7]; % Третий массив
array{4} = [4.5, 4.5]; % Четвертый массив
% array{5} = [2.5, 3.9]; % Пятый массив

% Вывод массива массивов
for i=1:(length(array))
    disp(array{i});
end
for i=1:(length(array))
    if array{i}(1)== array{i}(2)
        mesh = cat(1,mesh,array{i}(1));   
    end
end
for i=1:(length(array))
    for j=1:2
        flaq_same=0;
        for k=1:(length(mesh))
            if array{i}(j)==mesh(k)
            flaq_same=1;
            end
        end
        if flaq_same==0
          mesh = cat(1,mesh,array{i}(j));
        end 
    end
end
mesh=sort(mesh);
% Изображение элементарных интервалов
for i=1:(length(mesh)-1)
    err=(mesh(i+1)-mesh(i))/2;
    errorbar(mesh(i)+((mesh(i+1)-(mesh(i)))/2),0,err,'horizontal');hold on;
end
% Изображение концов элементарного разбиения
for i=1:(length(mesh))
    xline(mesh(i),'--',mesh(i),'LabelOrientation','horizontal','LabelHorizontalAlignment','center','LabelVerticalAlignment','middle','Color','#4DBEEE');hold on;
end
% Изображение наших интервалов
for i=1:(length(array))
    err=(array{i}(2)-array{i}(1))/2;
    errorbar(array{i}(1)+((array{i}(2)-array{i}(1))/2),i,err,'horizontal','black','LineWidth',2);hold on;
end

