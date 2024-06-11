%Старая версия
tableName = 'poly0';
[b1,b0]=evaluate_b1_b0(tableName);
% Тут добавим код для нахождения поточечной медианы
xline(Point_med(b0),'red','pointed median');hold on
% Тут добавили код для нахождения среднего значения
%                   xline(mean(b0),'green','average value');hold on
% Тут добавим код для нахождения интервальной медианы
[med_b0_low,med_b0_up]=Prolubn_med_a(b0);
mid_med_b0=med_b0_low+(med_b0_up-med_b0_low)/2;
rad_med_b0=(med_b0_up-med_b0_low)/2;

[b0_min,index_min]=min(b0);
b0(index_min)=0;%заменяю элемент выброса на 0
% semilogy(abs(b0));
hist(b0,50);
%Добавил сюда медиану, потому что она перекрывается гистограммой
xline(med_b0_low,'yellow','Prolubn_median_a');hold on
xline(med_b0_up,'yellow','Prolubn_median_a');hold on
errorbar(mid_med_b0,0,rad_med_b0,'horizontal','LineWidth',5,'Color', 'yellow');
