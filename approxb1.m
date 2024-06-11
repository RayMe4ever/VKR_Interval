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
%Поточечная медиана;
med_b1_point=Point_med(b1);
%Медиана пролубникова варианта А
[med_b1_low_a,med_b1_up_a]=Prolubn_med_a(b1);
%Медиана пролубникова варианта В
[med_b1_low_v,med_b1_up_v]=Prolubn_med_v(b1);
%Медиана крейновича 
[med_kr_b1_low,med_kr_b1_up]=Krein_med(b1);

err_med_a=(med_b1_up_a-med_b1_low_a)/2;
plot_err_med_a=errorbar(med_b1_low_a+err_med_a,2,err_med_a,'horizontal','green','LineWidth',2);hold on;

err_med_v=(med_b1_up_v-med_b1_low_v)/2;
plot_err_med_v=errorbar(med_b1_low_v+err_med_v,1,err_med_v,'horizontal','red','LineWidth',2);hold on;

err_med_kr=(med_kr_b1_up-med_kr_b1_low)/2;
plot_err_med_kr=errorbar(med_kr_b1_low+err_med_kr,0,err_med_kr,'horizontal','blue','LineWidth',2);hold on;

plot_med_point=plot(med_b1_point,3, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');hold on;
title('Оценки для коэфицента \beta_1 для выборки из всех наборов данных');
legend([plot_err_med_a, plot_err_med_v,plot_err_med_kr, plot_med_point],...
    {'Интервал в котором расположены значения \beta_1 посчитанный med_p(A)'...
    ,'Интервал в котором расположены значения \beta_1 посчитанный med_p(C)',...
    'Интервал в котором расположены значения \beta_1 посчитанный med_{kr}',...
    'Значение \beta_1 посчитанное поточечной медианой'}, 'Location', 'northwest');
ylabel('Номер исследования');
xlim([-3 3]); % Установка пределов оси X
ylim([0 5]); % Установка пределов оси Y