% ИЗ-за того что интвервалов очень много нужно брать не сам маелеький
% интервал а половину пика.
function [int_med_low,int_med_hig] = Prolubn_med_a(data_list)
data_list=sort(data_list);
data_lenght=size(data_list,1);
interval_count=data_lenght/2;
average_interval=ceil(interval_count/2);
if (mod(interval_count, 2)==0)
    int_med_low=(data_list(average_interval*2-1)+data_list(average_interval*2+1))/2;
    int_med_hig=(data_list(average_interval*2+2)+data_list(average_interval*2))/2;
else
    int_med_low=data_list(average_interval*2-1);
    int_med_hig=data_list(average_interval*2);
end


