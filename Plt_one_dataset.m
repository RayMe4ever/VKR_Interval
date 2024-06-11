%Выбираем таблицу по которой будем строить интервалы
tableName = 'poly0';
myarray=evalin('base', tableName);
    y_max=-Inf;
    x_max=-Inf;
    y_min=Inf;
    x_min=Inf;
for i=1:(size(evalin('base', tableName),1))
    err_x=myarray{i,3};
    errorbar(myarray{i,1},myarray{i,2},err_x,'horizontal','LineWidth',1,'Color', 'blue');hold on;
    err_y=myarray{i,4};
    errorbar(myarray{i,1},myarray{i,2},err_y,'LineWidth',1,'Color', 'red');hold on;
    xlabel('Измерения для T_64','FontSize', 14); % Подпись для оси x
    ylabel('Измерения для T_47','FontSize', 14); % Подпись для оси y
    axis equal; % Устанавливаем равные масштабы для осей X и Y
    if((myarray{i,2}+err_y)>y_max)
        y_max=(myarray{i,2}+err_y);
    end
    if((myarray{i,1}+err_x)>x_max)
        x_max=(myarray{i,1}+err_x);
    end
    if((myarray{i,2}-err_y)<y_min)
        y_min=(myarray{i,2}-err_y);
    end
    if((myarray{i,1}-err_x)<x_min)
        x_min=(myarray{i,1}-err_x);
    end
end
axis_limits = [min(x_min, y_min), max(x_max, y_max)];
xlim(axis_limits);
ylim(axis_limits);

