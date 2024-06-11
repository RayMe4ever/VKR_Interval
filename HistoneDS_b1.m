tableName = 'poly0';
[b1,b0]=evaluate_b1_b0(tableName);
% Медиана пролубникова варианта A
[med_b1_low,med_b1_up]=Prolubn_med_a(b1);
%Медиана пролубникова варианта В
[med_b1_low_v,med_b1_up_v]=Prolubn_med_v(b1);
%Медиана крейновича 
[med_kr_b1_low,med_kr_b1_up]=Krein_med(b1);


b1_filtered=b1(abs(b1)<3);
hist(b1_filtered, 30);
graphName = sprintf('Распределение \\beta_1 для набора данных: %s', tableName);
title(graphName,'FontSize', 14);

% Тут добавим код для нахождения поточечной медианы
plot_medi_point=xline(Point_med(b1),'black');hold on

% Тут добавим код для y=(1)
plot_ones=xline(1,'black--');hold on

%Закрашивание крейновича 
% Определение координат вершин многоугольника
ylimits = ylim;
x_fill = [med_kr_b1_low, med_kr_b1_up, med_kr_b1_up, med_kr_b1_low];
y_fill = [ylimits(1), ylimits(1), ylimits(2), ylimits(2)];
% Заполнение области
fill(x_fill, y_fill, 'blue', 'FaceAlpha', 0.3, 'EdgeColor', 'none');
% Построение вертикальных линий
plot_medi_low_kr=plot([med_kr_b1_low, med_kr_b1_low], ylim, 'blue--', 'LineWidth', 2);
plot([med_kr_b1_up, med_kr_b1_up], ylim, 'blue--', 'LineWidth', 2);

%Закрашивание пролубникова С
% Определение координат вершин многоугольника
ylimits = ylim;
x_fill = [med_b1_low_v, med_b1_up_v, med_b1_up_v, med_b1_low_v];
y_fill = [ylimits(1), ylimits(1), ylimits(2), ylimits(2)];
% Заполнение области
fill(x_fill, y_fill, 'red', 'FaceAlpha', 0.3, 'EdgeColor', 'none');
% Построение вертикальных линий
plot_medi_low_v=plot([med_b1_low_v, med_b1_low_v], ylim, 'r--', 'LineWidth', 2);
plot([med_b1_up_v, med_b1_up_v], ylim, 'r--', 'LineWidth', 2);

%Закрашивание пролубникова А
% Определение координат вершин многоугольника
ylimits = ylim;
x_fill = [med_b1_low, med_b1_up, med_b1_up, med_b1_low];
y_fill = [ylimits(1), ylimits(1), ylimits(2), ylimits(2)];
% Заполнение области
fill(x_fill, y_fill, 'green', 'FaceAlpha', 0.3, 'EdgeColor', 'none');
% Построение вертикальных линий
plot_medi_low_a=plot([med_b1_low, med_b1_low], ylim, 'g--', 'LineWidth', 2);
plot([med_b1_up, med_b1_up], ylim, 'g--', 'LineWidth', 2);


legend([plot_medi_low_a, plot_medi_low_v,plot_medi_low_kr, plot_medi_point,plot_ones],...
    {'Интервал в пределах которого берется \beta_1 (med_p:A version)'...
    ,'Интервал в пределах которого берется \beta_1(med_p:C version)',...
    'Интервал в пределах которого берется \beta_1 (med_k)',...
    '\beta_1 вычесленная поточечно ',...
    '\beta_1=1'}, 'Location', 'northwest','FontSize', 14);

