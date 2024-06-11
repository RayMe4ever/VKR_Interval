% ИЗ-за того что интвервалов очень много нужно брать не сам маелеький
% интервал а половину пика.
function [left_border,right_border] = Krein_med(data_list)
data_lenght=size(data_list,1);
lefts = data_list(1:2:end);
rights = data_list(2:2:end);

left_border=Point_med(lefts);
right_border=Point_med(rights);

