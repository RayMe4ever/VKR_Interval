% Создание ячейки с названиями таблиц
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
for i=1:(size(evalin('base', tableName),1))
    err_x=myarray{i,3};
    errorbar(myarray{i,1},myarray{i,2},err_x,'horizontal','LineWidth',1,'Color', 'blue');hold on;
    err_y=myarray{i,4};
    errorbar(myarray{i,1},myarray{i,2},err_y,'LineWidth',1,'Color', 'red');hold on;
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
xlabel('Измерения для T_{64}','FontSize', 14); % Подпись для оси x
ylabel('Измерения для T_{47}','FontSize', 14); % Подпись для оси y
axis equal; % Устанавливаем равные масштабы для осей X и Y
axis_limits = [0, max(x_max, y_max)];
xlim(axis_limits);
ylim(axis_limits);
end
%Поточечная медиана
med_b0_point=Point_med(b0);
med_b1_point=Point_med(b1);
%Медиана пролубникова варианта А
[med_b0_low_a,med_b0_up_a]=Prolubn_med_a(b0);
[med_b1_low_a,med_b1_up_a]=Prolubn_med_a(b1);
%Медиана пролубникова варианта В
[med_b0_low_v,med_b0_up_v]=Prolubn_med_v(b0);
[med_b1_low_v,med_b1_up_v]=Prolubn_med_v(b1);
%Медиана крейновича 
[med_kr_b0_low,med_kr_b0_up]=Krein_med(b0);
[med_kr_b1_low,med_kr_b1_up]=Krein_med(b1);

%Тут строим y-ки для графиков 
x = linspace(axis_limits(1), axis_limits(2), 100);
y = med_b1_point * x + med_b0_point;
y_low_a = med_b1_low_a*x+med_b0_low_a;
y_up_a = med_b1_up_a*x+med_b0_up_a;
y_low_v = med_b1_low_v*x+med_b0_low_v;
y_up_v = med_b1_up_v*x+med_b0_up_v;
y_low_kr = med_kr_b1_low*x+med_kr_b0_low;
y_up_kr = med_kr_b1_up*x+med_kr_b0_up;


plot_medi_point=plot(x, y, 'black-', 'LineWidth', 2);hold on; % Прямая y = b1*x + b0
% Графики нижней и верхней границы построенной с помощью med_p_A
plot_medi_low_a=plot(x, y_low_a, 'g-', 'LineWidth', 2);hold on; % 
plot_medi_up_a=plot(x, y_up_a, 'g-', 'LineWidth', 2);hold on; % 
% Закрашивание области между y_low_a и y_up_a
x_fill = [x, fliplr(x)];
y_fill = [y_up_a, fliplr(y_low_a)];
fill(x_fill, y_fill, 'green', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
% Графики нижней и верхней границы построенной с помощью med_p_V
plot_medi_low_v=plot(x, y_low_v, 'red-', 'LineWidth', 2);hold on; % 
plot_medi_up_v=plot(x, y_up_v, 'red-', 'LineWidth', 2);hold on; % 
% Закрашивание области между y_low_v и y_up_v
x_fill = [x, fliplr(x)];
y_fill = [y_up_v, fliplr(y_low_v)];
fill(x_fill, y_fill, 'red', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
% Графики нижней и верхней границы построенной с помощью med_kr
plot_medi_low_kr=plot(x, y_low_kr, 'blue-', 'LineWidth', 2);hold on; % 
plot_medi_up_kr=plot(x, y_up_kr, 'blue-', 'LineWidth', 2);hold on; % 
% Закрашивание области между y_low_kr и y_up_kr
x_fill = [x, fliplr(x)];
y_fill = [y_up_kr, fliplr(y_low_kr)];
fill(x_fill, y_fill, 'blue', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
%График y=x
plot_yeqx=plot(x,x,'black--', 'LineWidth', 2);hold on;


title('График для всех наборов данных');
legend([plot_medi_low_a, plot_medi_low_v,plot_medi_low_kr, plot_medi_point,plot_yeqx],...
    {'Интервал в пределах которого может быть построена прямая(med_p:A version)'...
    ,'Интервал в пределах которого может быть построена прямая(med_p:C version)',...
    'Интервал в пределах которого может быть построена прямая(med_k)',...
    'Прямая, с коэфицентами вычеслеными поточечно',...
    'Прямая y=x'}, 'Location', 'northwest');