function point_med = Point_med(data_list)
data_list=sort(data_list);
if (mod(length(data_list),2))
    medi_index=ceil(length(data_list)/2);
    point_med=data_list(medi_index);
else
    medi_index=ceil(length(data_list)/2);
    point_med=(data_list(medi_index)+data_list(medi_index+1))/2;
end

