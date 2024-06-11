tableName = 'poly0';
[b1,b0]=evaluate_b1_b0(tableName);


% hist(b0,50)
% plot(b0)
% semilogy(abs(b0))
med_b0_point=Point_med(b0);
med_b1_point=Point_med(b1);
[med_b0_low,med_b0_up]=Prolubn_med_a(b0);
[med_b1_low,med_b1_up]=Prolubn_med_a(b1);
sorted_b0=sort(b0);
sorted_b1=sort(b1);

%Тут мы строим интервалы и вычисляем границы области графика чтоб сделать
%ее квадратной
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
axis_limits = [min(x_min, y_min), max(x_max, y_max)];
xlim(axis_limits);
ylim(axis_limits);

%Тут строим y-ки для графиков 
x = linspace(x_min, x_max, 100);
y = med_b1_point * x + med_b0_point;
y_int_low_up_a = med_b1_low*x+med_b0_up;
y_int_up_low_a = med_b1_up*x+med_b0_low;
y_int_low_low_a = med_b1_low*x+med_b0_low;
y_int_up_up_a = med_b1_up*x+med_b0_up;

y_up_a=max(max(y_int_low_up_a,y_int_up_low_a),max(y_int_low_low_a,y_int_up_up_a));
y_low_a=min(min(y_int_low_up_a,y_int_up_low_a),min(y_int_low_low_a,y_int_up_up_a));
plot_medi_point=plot(x, y, 'r-', 'LineWidth', 2);hold on; % Прямая y = b1*x + b0
% Графики нижней и верхней границы построенной с помощью med_p_A
plot_medi_low_a=plot(x, y_low_a, 'g-', 'LineWidth', 2);hold on; % 
plot_medi_up_a=plot(x, y_up_a, 'g-', 'LineWidth', 2);hold on; % 

% Закрашивание области между f1(x) и f2(x)
x_fill = [x, fliplr(x)];
y_fill = [y_up_a, fliplr(y_low_a)];
fill(x_fill, y_fill, 'green', 'FaceAlpha', 0.1, 'EdgeColor', 'none');

legend([plot_medi_low_a, plot_medi_point], {'Интервал в пределах которого может быть построена прямая(med_p:A version)', 'Прямая, с коэфицентами вычеслеными поточечно'}, 'Location', 'northeast');
